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
import model.Customer;
import util.MyUtils;

/**
 *
 * @author vdqvi
 */
public class ForgetPassword extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doPost(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String email = request.getParameter("email");
        Customer temp = new CustomerDAO().getByEmail(email);
        if(temp!=null){
            String newPass = MyUtils.genCode(6);
            new CustomerDAO().changePassword(temp.getId(), newPass);
            request.setAttribute("type", 2);
            request.setAttribute("newPass", newPass);
            request.getRequestDispatcher("sendmail").forward(request, response);
            return;
        }
        request.setAttribute("error", "Email not found!!!");
        request.getRequestDispatcher("/Views/Account/Forgot.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
