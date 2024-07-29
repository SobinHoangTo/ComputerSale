/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Account;

import dal.CustomerDAO;
import dal.EmployeeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import model.Cart;
import model.Customer;
import model.Employee;

/**
 *
 * @author Admin
 */
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        HashMap<Integer,Cart> cart = (HashMap<Integer,Cart>)session.getAttribute("cart");
        int cartLength = 0;
        if(cart!=null){
            cartLength = (int)session.getAttribute("cartLength");
        }
        
        session.invalidate();
        session = request.getSession();
        session.setAttribute("cart", cart);
        session.setAttribute("cartLength", cartLength);
        request.getRequestDispatcher("Views/Account/Login.jsp").forward(request, response);
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password =  request.getParameter("password");
        Customer cTemp = new CustomerDAO().checkLogin(username, password);
        if (cTemp != null) {
            session.setAttribute("currentCustomer", cTemp);
            response.sendRedirect("home");
            return;
        }
        Employee eTemp = new EmployeeDAO().checkLogin(username, password);
        if (eTemp != null && eTemp.getStatus()==1) {
            session.setAttribute("currentEmployee", eTemp);
            switch (eTemp.getRole_id()) {
                case 1 ->
                    response.sendRedirect("employeehome");
                case 2 ->
                    response.sendRedirect("employeehome");
                default ->
                    response.sendRedirect("employeehome");
            }
            return;
        }
        request.setAttribute("message", "Wrong username or password");
        request.getRequestDispatcher("Views/Account/Login.jsp").forward(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
