package controller.Customers;

import dal.OrderDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Customer;
import model.Order;

public class ShoppingHistory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer temp = (Customer) session.getAttribute("currentCustomer");

        ArrayList<Order> listOrder = new OrderDAO().getCustomerOrder(temp.getId());
        Map<Integer, Integer> totalPrices = new HashMap<>();

        OrderDAO orderDAO = new OrderDAO();
        for (Order order : listOrder) {
            int totalPrice = orderDAO.getTotalSales(order.getId());
            totalPrices.put(order.getId(), totalPrice);
        }

        request.setAttribute("listOrder", listOrder);
        request.setAttribute("totalPrices", totalPrices);
        request.getRequestDispatcher("Views/Customers/ShoppingHistory.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
