/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.*;
import util.MyUtils;

/**
 *
 * @author Admin
 */
public class ManageDiscount extends HttpServlet {

    private final int ItemsOfPage = 10;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchQuery = request.getParameter("search");
        String statusParam = request.getParameter("status");
        String pageNumberParam = request.getParameter("pageNumber");
        int pageNumber = pageNumberParam != null ? Integer.parseInt(pageNumberParam) : 1;
        Map<Discount, Product> searchResults = null;
//check search words product name or user
        if (searchQuery != null && !searchQuery.isEmpty()) {
            
            searchResults = searchProductsByString(new DiscountDAO().getAllWithDiscount(), searchQuery);
            MyUtils.setAlertAttributes(request, !searchResults.isEmpty(), "find " + searchResults.size() + " of '" + searchQuery + "'");
        }

        if (statusParam != null && !statusParam.isEmpty()) {
            try {
                int status = Integer.parseInt(statusParam);
                Map<Discount, Product> statusResults = (status == 0)
                        ? new DiscountDAO().getAllWithDiscount()
                        : filterStatus(status);

                if (searchResults == null) {
                    searchResults = statusResults;
                }
                MyUtils.setAlertAttributes(request, searchResults != null, "filter " + searchResults.size() + " result.");
            } catch (NumberFormatException e) {
                // Handle invalid role query gracefully
                request.setAttribute("alertMessage", "Invalid role ID.");
                request.setAttribute("alertType", "danger");
            }
        }

        if (searchResults == null) {
            searchResults = new DiscountDAO().getAllWithDiscount();
        }
        int numberOfItems = searchResults.size();
        Comparator<Discount> comparator = Comparator.comparing(Discount::getId).reversed();//sort object discount by key
        searchResults = MyUtils.sortMap(searchResults, comparator);
        request.setAttribute("productList", new ProductDAO().getAll());
        request.setAttribute("numberOfItems", numberOfItems);
        request.setAttribute("numberOfPage", (int) Math.ceil(numberOfItems / ItemsOfPage));
        request.setAttribute("discount", MyUtils.getMapByPaging(searchResults, pageNumber, ItemsOfPage));
        request.setAttribute("employee", new EmployeeDAO().getAll());
        request.getRequestDispatcher("Views/Employ/Staff/ManageDiscount.jsp?pageNumber=" + pageNumber).forward(request, response);
    }

    private Map<Discount, Product> searchProductsByString(Map<Discount, Product> list, String keyword) {
        Map<Discount, Product> result = new HashMap<>();
        String[] keywords = MyUtils.convertKeywords(keyword);
        for (Map.Entry<Discount, Product> entry : list.entrySet()) {
            Discount key = entry.getKey();
            Product p = entry.getValue();
            if (MyUtils.containsKeywords(p.getName(), keywords)) {
                result.put(key, p);
            }
        }
        return result;
    }

    private Map<Discount, Product> filterStatus(int status) {
        Map<Discount, Product> statusResults = new HashMap<>();
        for (Map.Entry<Discount, Product> entry : new DiscountDAO().getAllWithDiscount().entrySet()) {
            Discount key = entry.getKey();
            Product value = entry.getValue();
            boolean checkDate = false;
            LocalDate endDate = LocalDate.parse(key.getExp_date());
            LocalDate startDate = LocalDate.parse(key.getStart_date());
            switch (status) {
                case 1:
                    checkDate = endDate.isAfter(LocalDate.now());
                    break;
                case 2:
                    checkDate = startDate.isAfter(LocalDate.now());
                    break;
                case 3:
                    checkDate = startDate.isBefore(LocalDate.now());
                    break;
                default:
                    break;
            }
            if (checkDate) {
                statusResults.put(key, value);
            }
        }
        return statusResults;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String productIdParam = request.getParameter("product_id");
        boolean status = handleAction(request, response, action);
        MyUtils.setAlertAttributes(request, status, action + " " + productIdParam);
        doGet(request, response);
    }

    public Discount parseParameter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String productIdParam = request.getParameter("product_id");
            String quantityParam = request.getParameter("quantity");
            String valueParam = request.getParameter("value");
            String startDate = request.getParameter("start_date");
            String expDate = request.getParameter("exp_date");
            HttpSession session = request.getSession();
            Employee currentE = (Employee) session.getAttribute("currentEmployee");

            MyUtils.validateParameters(productIdParam, quantityParam, valueParam, expDate);

            int productId = Integer.parseInt(productIdParam);
            int quantity = Integer.parseInt(quantityParam);
            int value = Integer.parseInt(valueParam);

            LocalDate startDateCheck = LocalDate.parse(startDate);
            LocalDate endDate = LocalDate.parse(expDate);
            boolean checkNumber = quantity > 0 && value > 0;
            boolean checkDate = endDate.isAfter(LocalDate.now()) && startDateCheck.isAfter(LocalDate.now());
            boolean checkValid = endDate.isAfter(startDateCheck);
            String mess;
            if (checkNumber) {
                if (checkDate && checkValid) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    return new Discount(id, productId, quantity, value, startDate, expDate, currentE.getId(), 1);
                } else if (checkDate == false) {
                    MyUtils.setAlertAttributes(request, false, "Start date or Experation Date is not in the future");
                    doGet(request, response);
                } else if (checkValid) {
                    MyUtils.setAlertAttributes(request, false, "Start date must be before Experation Date");
                    doGet(request, response);
                }
            } else {
                MyUtils.setAlertAttributes(request, checkNumber, "Quantity or Values is smaller than 0.");
                doGet(request, response);
            }
        } catch (IllegalArgumentException e) {
            request.setAttribute("alertMessage", e.getMessage());
            request.setAttribute("alertType", "danger");
        }
        return null;
    }

    private boolean handleAction(HttpServletRequest request, HttpServletResponse response, String action) throws ServletException, IOException {
        boolean status = false;
        Discount d = parseParameter(request, response);
        switch (action) {
            case "edit":
                status = (d != null) ? new DiscountDAO().updateDiscount(d) : false;
                break;
            //delete chuyen thanh hidden 
            case "add":
                status = (d != null) ? new DiscountDAO().addDiscount(d) : false;
                break;
            case "delete":
                String productIdParam = request.getParameter("product_id");
                try {
                    int productId = Integer.parseInt(productIdParam);
                    status = new DiscountDAO().deleteDiscount(productId);
                } catch (Exception e) {
                    System.out.println("Discount exception: " + e);
                }
                break;
            default:
                break;
        }
        return status;
    }

}
