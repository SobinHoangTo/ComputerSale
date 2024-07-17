/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Account;

import dal.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.MyUtils;

/**
 *
 * @author vdqvi
 */
public class VerifyCode extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        HttpSession session = request.getSession();
        String trueCode = (String) session.getAttribute("code");
        if (new MyUtils().getMd5(code).equals(trueCode)) {
            String username = (String)session.getAttribute("username");
            String email = (String)session.getAttribute("email");
            String password = (String)session.getAttribute("password");
            String phone = (String)session.getAttribute("phone");
            String address = (String)session.getAttribute("address");
            String firstname = (String)session.getAttribute("firstname");
            String lastname = (String)session.getAttribute("lastname");
            new CustomerDAO().add(username, email, password, phone, address, firstname, lastname);
            response.sendRedirect("login");
        }
        else {
            request.setAttribute("alertMessage", "Code wrong!!!");
            request.setAttribute("alertType", "danger");
            request.getRequestDispatcher("verifycode").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
