package controller.Customers;

import dal.RateDAO;
import model.Rate;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Feedback extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doPost(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            int orderDetailId = Integer.parseInt(request.getParameter("orderDetailId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String feedback = request.getParameter("feedback");

            Rate rate = new Rate();
            rate.setOrder_detail_id(orderDetailId);
            rate.setStar_rate(rating);
            rate.setFeedback(feedback);
            rate.setStatus((byte) 1);

            RateDAO rateDAO = new RateDAO();
            rateDAO.addFeedback(orderDetailId, rating, feedback);

            // Redirect lại đúng trang chi tiết đơn hàng
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            response.sendRedirect("orderdetail?id=" + orderId);
    }
}
