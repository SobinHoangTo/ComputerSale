/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Customers;

import dal.ProductDAO;
import dal.Serial_numberDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import model.Cart;
import model.Product;
import model.Serial_number;

/**
 *
 * @author vdqvi
 */
public class Checkout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doPost(request, response);
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            HashMap<Integer, Cart> order = new HashMap<>();
            ArrayList<String> error = new ArrayList<>();
            int totalPrice = 0;
            if (request.getParameter("productID") == null) {
                String[] idChecked = request.getParameterValues("check");
                HashMap<Integer, Cart> cart = (HashMap<Integer, Cart>) session.getAttribute("cart");
                if (cart == null || cart.isEmpty() || idChecked == null || idChecked.length == 0) {
                    response.sendRedirect("carts");
                    return;
                }
                for (String i : idChecked) {
                    Cart temp = cart.get(Integer.valueOf(i));
                    if (temp != null) {
                        ArrayList<Serial_number> sn = new Serial_numberDAO().getAllByProductIdAndStatus(temp.getProduct().getId(), 1);
                        if (temp.getQuantity() <= sn.size()) {
                            order.put(temp.getProduct().getId(), temp);
                            totalPrice += temp.getProduct().getPrice() * temp.getQuantity();
                        } else {
                            error.add(sn.size() > 0 ? temp.getProduct().getName() + " remaining " + sn.size() + " left!!!" : temp.getProduct().getName() + " is out of stock!!!");
                        }
                    } else {
                        error.clear();
                        error.add("Somethings went wrong!!!");
                        request.setAttribute("alertMessage", error);
                        request.setAttribute("alertType", "danger");
                        request.getRequestDispatcher("carts").forward(request, response);
                        return;
                    }
                }
            }
            else{
                int id = Integer.parseInt(request.getParameter("productID"));
                Product temp = new ProductDAO().getById(id);
                totalPrice = temp.getPrice();
                order.put(id, new Cart(temp, 1));
            }
            if (error.isEmpty()) {
                request.setAttribute("totalPrice", totalPrice);
                session.setAttribute("order", order);
                request.getRequestDispatcher("Views/Customers/Payment.jsp").forward(request, response);
                return;
            } else {
                request.setAttribute("alertMessage", error);
                request.setAttribute("alertType", "danger");
                request.getRequestDispatcher("carts").forward(request, response);
                return;
            }
        } catch (Exception e) {
            System.err.println("Checkout exception:" + e.getMessage());
        }
        response.sendRedirect("home");
    }
}
