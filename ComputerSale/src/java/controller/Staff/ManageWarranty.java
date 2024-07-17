/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Staff;

import dal.Warranty_recordDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author Admin
 */
public class ManageWarranty extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<ArrayList<String>> list = new Warranty_recordDAO().getAllToManage();
        list.sort((ArrayList<String> a1, ArrayList<String> a2)->a1.get(5).compareTo(a2.get(5)));
        Collections.reverse(list);
//        list.sort(Comparator.comparing(o -> o.get(5)));
        request.setAttribute("list", list);
        request.getRequestDispatcher("Views/Employ/Staff/ManageWarranty.jsp").forward(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
