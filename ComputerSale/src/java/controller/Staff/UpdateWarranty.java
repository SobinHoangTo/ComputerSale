/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Staff;

import dal.DAOJoin;
import dal.Warranty_recordDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Employee;

/**
 *
 * @author vdqvi
 */
public class UpdateWarranty extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Employee currentE = (Employee)session.getAttribute("currentEmployee");
        String message = null;
        String alert = "danger";
        boolean isAccept = false;
        try {
            message = "Something went wrong!!!";
            int id = Integer.parseInt(request.getParameter("id"));
            int type = Integer.parseInt(request.getParameter("type"));
            String res = request.getParameter("res");
            if(res==null||res.isBlank()){
                message = "Response is empty!!!";
                throw new Exception();
            }
            if(type==2||type==3){
                new Warranty_recordDAO().updateStatus(id, type, res, currentE.getId());
                if(type==2){
                    isAccept = true;
                    request.setAttribute("info", new DAOJoin().getInformationWarranty(id));
                }
            }
            else{
                message = "Wrong type!!!";
                throw new Exception();
            }
            message = "Update done.";
            alert = "success";
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        request.setAttribute("alertType", alert);
        request.setAttribute("alertMessage", message);
        if(isAccept){
            request.setAttribute("type", 3);
            request.getRequestDispatcher("sendmail").forward(request, response);
        }
        request.getRequestDispatcher("managewarranty").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
