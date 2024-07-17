package controller.Customers;

import dal.BrandDAO;
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
import model.Order_detail;
import model.Rate;

public class OrderDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int order_detail_id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("listProductOrder", new Order_detailDAO().getByOrderID(order_detail_id));
        request.setAttribute("listProduct", new ProductDAO().getAll());
        
        // Get feedback for each product in the order
        Map<Integer, Rate> feedbackMap = new HashMap<>();
        RateDAO rateDAO = new RateDAO();
        for (Order_detail od : new Order_detailDAO().getByOrderID(order_detail_id)) {
            Rate feedback = rateDAO.getCommentByID(od.getId()).get(od.getProduct_id());
            if (feedback != null) {
                feedbackMap.put(od.getId(), feedback);
            }
        }
        request.setAttribute("feedbackMap", feedbackMap);
        
        request.getRequestDispatcher("Views/Customers/OrderDetail.jsp").forward(request, response);
    }
}
