/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Account;

import dal.CustomerDAO;
import dal.EmployeeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/Account/Register.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String checkPass = request.getParameter("checkPass");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String error = "Password not match!";
        HttpSession session = request.getSession();
        if(password.equals(checkPass)){
            error = "Username or email already existed!";
            if(new CustomerDAO().checkSignUp(username, email)&&new EmployeeDAO().checkSignUp(username, email)){
                session.setAttribute("username", username);
                session.setAttribute("email", email);
                session.setAttribute("password", password);
                session.setAttribute("phone", phone);
                session.setAttribute("address", address);
                session.setAttribute("firstname", firstname);
                session.setAttribute("lastname", lastname);
                request.setAttribute("type", 1);
                request.setAttribute("email", email);
                request.getRequestDispatcher("sendmail").forward(request, response);
                return;
            }
        }
        request.setAttribute("error", error);
        request.getRequestDispatcher("Views/Account/Register.jsp").forward(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}