/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Customers;

import dal.OrderDAO;
import dal.Serial_numberDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import model.Serial_number;
import payroll.Config;

/**
 *
 * @author vdqvi
 */
public class Order extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<String> error = (ArrayList<String>) request.getAttribute("alertMessage");
        HttpSession session = request.getSession();
        int orderID;
        try {
            orderID = (Integer) session.getAttribute("orderID");
            if (error == null || error.isEmpty()) {
                Map fields = new HashMap();
                for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                    String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                    String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                    if ((fieldValue != null) && (fieldValue.length() > 0)) {
                        fields.put(fieldName, fieldValue);
                    }
                }

                String vnp_SecureHash = request.getParameter("vnp_SecureHash");
                if (fields.containsKey("vnp_SecureHashType")) {
                    fields.remove("vnp_SecureHashType");
                }
                if (fields.containsKey("vnp_SecureHash")) {
                    fields.remove("vnp_SecureHash");
                }
                String signValue = Config.hashAllFields(fields);
                if (signValue.equals(vnp_SecureHash) && "00".equals(request.getParameter("vnp_TransactionStatus"))) {
                    new OrderDAO().updatePaid_date(orderID);
                    System.out.println("Thành công");
                    session.removeAttribute("orderID");
                    request.getRequestDispatcher("thankyou").forward(request, response);
                    return;
                }
            }
            new OrderDAO().updateStatus(3, 0, orderID);
            ArrayList<Serial_number> temp = new Serial_numberDAO().getByOrderID(orderID);
            for (Serial_number i : temp) {
                new Serial_numberDAO().updateStatus(i.getId(), 2);
            }
            session.removeAttribute("orderID");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        
        ArrayList<String> newError = new ArrayList<>();
        newError.add("Not Success!!!");
        if (error != null) {
            newError.addAll(error);
        }

        request.setAttribute("alertMessage", newError);
        request.setAttribute("alertType", "danger");
        request.getRequestDispatcher("carts").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
