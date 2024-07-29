/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Staff;

import dal.DiscountDAO;
import dal.ProductDAO;
import dal.RateDAO;
import dal.Serial_numberDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Map;
import model.Discount;
import model.Serial_number;

/**
 *
 * @author Admin
 */
public class ManageSerialNumber extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id_raw = request.getParameter("productID");
            int id = Integer.parseInt(id_raw);
            request.setAttribute("product", new ProductDAO().getById(id));
            request.setAttribute("snList", new Serial_numberDAO().getAllByProductId(id));
            request.getRequestDispatcher("Views/Employ/Staff/ManageSerialNumber.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("ManageSerialNumber error:" + e.getMessage());
            response.sendRedirect("manageproducts");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id_raw = request.getParameter("productID");
            int id = Integer.parseInt(id_raw);
            String quantity_raw = request.getParameter("quantity");
            int quantity = Integer.parseInt(quantity_raw);
            String sn_template = id + "_SN_";
            ArrayList<Serial_number> snList = new Serial_numberDAO().getAllByProductId(id);
            for (int i = 1; i <= quantity; i++) {
                new Serial_numberDAO().add(new Serial_number(0, sn_template + (snList.size() + i < 10 ? "0" + (snList.size() + i) : snList.size() + i), id, 1));
            }
            request.setAttribute("product", new ProductDAO().getById(id));
            request.setAttribute("snList", new Serial_numberDAO().getAllByProductId(id));
            request.getRequestDispatcher("Views/Employ/Staff/ManageSerialNumber.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("ManageSerialNumber error:" + e.getMessage());
            response.sendRedirect("manageproducts");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
