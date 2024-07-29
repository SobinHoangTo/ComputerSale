package controller.Customers;

import dal.CustomerDAO;
import dal.OrderDAO;
import dal.Order_detailDAO;
import dal.ProductDAO;
import dal.RateDAO;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Customer;
import model.Order_detail;
import model.Rate;
import model.Order;

public class OrderDetail extends HttpServlet {

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
        
        int orderId = Integer.parseInt(request.getParameter("id"));
        Order_detailDAO orderDetailDAO = new Order_detailDAO();
        ProductDAO productDAO = new ProductDAO();
        RateDAO rateDAO = new RateDAO();

        request.setAttribute("orderId", orderId);
        
        request.setAttribute("price", new Order_detail().getPrice());
        request.setAttribute("customer", temp.getFirstname() + " " + temp.getLastname());
        request.setAttribute("orderInfor", new OrderDAO().getById(orderId));
        request.setAttribute("listProductOrder", orderDetailDAO.getByOrderID(orderId));
        request.setAttribute("listProduct", productDAO.getAll());

        // Get feedback for each product in the order
        Map<Integer, Rate> feedbackMap = new HashMap<>();
        for (Order_detail od : orderDetailDAO.getByOrderID(orderId)) {
            Rate feedback = rateDAO.getCommentByOrderDetailId(od.getId());
            if (feedback != null) {
                feedbackMap.put(od.getId(), feedback);
            }
        }
        request.setAttribute("feedbackMap", feedbackMap);

        request.getRequestDispatcher("Views/Customers/OrderDetail.jsp").forward(request, response);
    }
}
