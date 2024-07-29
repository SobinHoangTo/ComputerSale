/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Staff;

import dal.DiscountDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import model.*;
import util.MyUtils;

/**
 *
 * @author Admin
 */
public class AddDiscount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("productList", new ProductDAO().getAll());
        request.getRequestDispatcher("Views/Employ/Staff/AddDiscount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
            boolean isUpdated=false;
            if (checkNumber) {
                if (checkDate && checkValid) {
                    Discount d = new Discount(0, productId, quantity, value, startDate, expDate, currentE.getId(), 0);
                    isUpdated = new DiscountDAO().addDiscount(d);
                     MyUtils.setAlertAttributes(request, isUpdated, "add new discount");
                     doGet(request, response);
                } else if (checkDate == false||checkValid==false) {
                    MyUtils.setAlertAttributes(request, false, "Start date or Experation Date is not in the future, and Start date must be before Experation Date");
                    doGet(request, response);
                } 
            } else {
                MyUtils.setAlertAttributes(request, checkNumber, "Quantity or Values is smaller than 0.");
                doGet(request, response);
            }
           
        } catch (Exception e) {
        }
    }
}
