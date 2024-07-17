/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Customers;

import dal.ProductDAO;
import java.io.IOException;
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
public class AddToCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        JSONObject json = new JSONObject();
        Product temp = new ProductDAO().getById(id);
        if (temp != null) {
            HttpSession session = request.getSession();
            HashMap<Integer, Cart> cart = (HashMap<Integer, Cart>) session.getAttribute("cart");
            if (cart == null) {
                cart = new HashMap<>();
            }
            if (cart.get(id) == null) {
                cart.put(id, new Cart(temp, 1));
            } else {
                cart.replace(id, new Cart(temp, cart.get(id).getQuantity() + 1));
            }
            int cartLength = getCartLength(cart);
            session.setAttribute("cart", cart);
            session.setAttribute("cartLength", cartLength);
            json.put("data", cartLength);
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
