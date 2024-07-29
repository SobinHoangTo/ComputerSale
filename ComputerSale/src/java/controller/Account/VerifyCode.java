/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Account;

import dal.CustomerDAO;
import java.io.IOException;
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
        System.out.println("Hello");
        String code = request.getParameter("code");
        HttpSession session = request.getSession();
        String trueCode = (String) session.getAttribute("code");
        if (MyUtils.getMd5(code).equals(trueCode)) {
            String username = (String)session.getAttribute("username");
            String email = (String)session.getAttribute("email");
            String password = (String)session.getAttribute("password");
            String phone = (String)session.getAttribute("phone");
            String address = (String)session.getAttribute("address");
            String firstname = (String)session.getAttribute("firstname");
            String lastname = (String)session.getAttribute("lastname");
            new CustomerDAO().add(username, email, password, phone, address, firstname, lastname);
            response.sendRedirect("login?message=Register Succcessfully!!!");
        }
        else {
            request.setAttribute("message", "Code wrong!!!");
            request.getRequestDispatcher("Views/Account/ConfirmCode.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
