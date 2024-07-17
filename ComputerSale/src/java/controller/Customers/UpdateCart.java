/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Customers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import model.Cart;
import model.Product;
import org.json.JSONObject;

/**
 *
 * @author vdqvi
 */
public class UpdateCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        JSONObject json = new JSONObject();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            int value = Integer.parseInt(request.getParameter("value"));
            HttpSession session = request.getSession();
            HashMap<Integer, Cart> cart = (HashMap<Integer, Cart>) session.getAttribute("cart");
            if (cart.get(id) != null) {
                if (value == 2) {
                    remove(cart, json, id);
                } else {
                    Cart temp = cart.get(id);
                    int quantity = temp.getQuantity();
                    quantity = (value == 1) ? (quantity + 1) : (quantity - 1);
                    if (quantity == 0) {
                        remove(cart, json, id);
                    } else {
                        cart.replace(id, new Cart(temp.getProduct(), quantity));
                        json.put("data", quantity);
                        json.put("totalItemPrice", temp.getProduct().getPrice() * quantity);
                    }

                }
                int cartLength = getCartLength(cart);
                json.put("cartLength", cartLength);
                session.setAttribute("cart", cart);
                session.setAttribute("cartLength", cartLength);
            }
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
        }
        response.getWriter().print(json.toString());
    }

    private int getCartLength(HashMap<Integer, Cart> cart) {
        int cartLength = 0;
        for (Map.Entry<Integer, Cart> i : cart.entrySet()) {
            cartLength += i.getValue().getQuantity();
        }
        return cartLength;
    }

    private void remove(HashMap<Integer, Cart> cart, JSONObject json, int id) {
        cart.remove(id);
        json.put("data", 0);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
