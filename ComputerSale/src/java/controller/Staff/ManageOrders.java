package controller.Staff;

import dal.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import util.MyUtils;
import model.*;

/**
 *
 * @author Admin
 */
public class ManageOrders extends HttpServlet {

    private final int ItemsOfPage = 10;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String searchQuery = request.getParameter("search");
        String statusFilter = request.getParameter("statusSearch");

        HttpSession session = request.getSession();
        ArrayList<Order> list = (ArrayList<Order>) session.getAttribute("orders");
        boolean status = false;

        OrderDAO ordersDAO = new OrderDAO();
        // Retrieve all orders if not already stored in session
        if (list == null) {
            list = ordersDAO.getOrders();
        }

        if (searchQuery != null && !searchQuery.isEmpty()) {
            searchQuery = searchQuery.trim().toLowerCase();
            ArrayList<Order> searchResult = new ArrayList<>();
            ArrayList<Customer> allCustomers = new CustomerDAO().getAll();

            for (Order order : list) {
                boolean matchFound = false;

                // Check if the search query matches the order's address or phone
                if (MyUtils.removeDiacritics(order.getAddress()).toLowerCase().contains(searchQuery)
                        || MyUtils.removeDiacritics(order.getPhone()).toLowerCase().contains(searchQuery)) {
                    searchResult.add(order);
                    matchFound = true;
                }

                // Check if the search query matches any customer details
                for (Customer c : allCustomers) {
                    if (MyUtils.removeDiacritics(c.getFirstname()).toLowerCase().contains(searchQuery)
                            || MyUtils.removeDiacritics(c.getLastname()).toLowerCase().contains(searchQuery)
                            || MyUtils.removeDiacritics(c.getUsername()).toLowerCase().contains(searchQuery)) {
                        if (order.getCustomer_id() == c.getId() && !searchResult.contains(order)) {
                            searchResult.add(order);
                            matchFound = true;
                        }
                    }
                }

                // If match found in either address/phone or customer details, add to search results
                if (matchFound && !searchResult.contains(order)) {
                    searchResult.add(order);
                }
            }

            if (!searchResult.isEmpty()) {
                list = searchResult;
                session.setAttribute("orders", list);
            } else {
                list.clear(); // No results found, clear the list
            }
            status = !list.isEmpty();
            MyUtils.setAlertAttributes(request, status, "Found " + list.size() + " results for '" + searchQuery + "'");
        } else if (statusFilter != null && !statusFilter.isEmpty()) {
            int statusID = Integer.parseInt(statusFilter);
            list = (statusID == 0) ? ordersDAO.getOrders() : ordersDAO.searchByOrderStatus(statusID);
            session.setAttribute("orders", list);
            status = !list.isEmpty();
            MyUtils.setAlertAttributes(request, status, "find " + list.size() + " results.");
        }

        if (list.isEmpty()) {
            list = ordersDAO.getOrders();
            session.setAttribute("orders", list);
        }

        LocalDate currentDate = LocalDate.now();
        int pageNumber = 1;
        String pageNumberParam = request.getParameter("pageNumber");
        if (pageNumberParam != null) {
            pageNumber = Integer.parseInt(pageNumberParam);
        }

        list.sort(Comparator.comparingInt(Order::getId).reversed());
        int numberOfItems = list.size();
        request.setAttribute("numberOfItems", numberOfItems);
        request.setAttribute("numberOfPage", (int) Math.ceil((double) numberOfItems / ItemsOfPage));
        request.setAttribute("orders", MyUtils.getArrayListByPaging(list, pageNumber, ItemsOfPage));
        request.setAttribute("odDetails", new Order_detailDAO().getOrderOrderDetails());
        request.setAttribute("sum", new Order_detailDAO().getOrderTotal());
        request.setAttribute("total", new OrderDAO().getTotalSales());
        request.setAttribute("compareStatus", compareDates(list, currentDate));
        request.setAttribute("currentDate", LocalDate.now().toString());
        request.setAttribute("customer", new CustomerDAO().getAll());
        request.setAttribute("employee", new EmployeeDAO().getAll());
        request.setAttribute("serial", new Serial_numberDAO().getAll());
        request.setAttribute("product", new ProductDAO().getAll());

        request.getRequestDispatcher("Views/Employ/Staff/ManageOrders.jsp?pageNumber=").forward(request, response);

    }

    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    private static Map<Integer, Integer> compareDates(List<Order> orders, LocalDate currentDate) {
        if (orders == null || currentDate == null) {
            throw new IllegalArgumentException("Orders list and current date must not be null.");
        }

        Map<Integer, Integer> compareMap = new HashMap<>();

        for (Order order : orders) {
            LocalDate dateFromDB;
            if (order.getVerified_on() != null) {
                try {
                    dateFromDB = LocalDate.parse(order.getVerified_on(), formatter);
                } catch (Exception e) {
                    throw new IllegalArgumentException("Invalid date format for order ID: " + order.getId(), e);
                }
                int value;
                switch (order.getOrder_status()) {
                    case 1, 3 ->
                        value = 1;
                    case 2, 4 ->
                        value = (dateFromDB.isAfter(currentDate)) ? 0 : 1;
                    case 5, 6, 7 ->
                        value = 0;
                    default ->
                        throw new AssertionError("Unexpected order status: " + order.getOrder_status());
                }
                compareMap.put(order.getId(), value);
            }
        }

        return compareMap;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String orderId = request.getParameter("orderId");
        String orderStatus = request.getParameter("status");
        boolean isUpdated = false;
        HttpSession session = request.getSession();
        Employee currentE = (Employee) session.getAttribute("currentEmployee");

        try {
            int id = Integer.parseInt(orderId); // Parse the status ID from the request
            int status = Integer.parseInt(orderStatus); // Parse the status ID from the request
            isUpdated = new OrderDAO().updateStatus(status, currentE.getId(), id); // Assuming updateStatus only needs the new status
            if (isUpdated) {
                session.removeAttribute("orders");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        MyUtils.setAlertAttributes(request, isUpdated, "update " + orderId);
        doGet(request, response);
    }

}
