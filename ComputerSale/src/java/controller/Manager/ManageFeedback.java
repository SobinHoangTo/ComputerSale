/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Manager;

import dal.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import model.*;
import util.MyUtils;

/**
 *
 * @author Admin
 */
public class ManageFeedback extends HttpServlet {

    private final int ItemsOfPage = 10;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        HttpSession session = request.getSession();
        String searchQuery = request.getParameter("search");
        boolean status = searchQuery != null && !searchQuery.isEmpty();

        Map<Rate, Product> list = (Map<Rate, Product>) session.getAttribute("feedbackList");
        //if the session list is null, get all
        if (list == null) {
            list = new RateDAO().getRateProductMap();
            session.setAttribute("feedbackList", list);
        }

        String pageNumberParam = request.getParameter("pageNumber");
        int pageNumber;
        try {
            pageNumber = (pageNumberParam != null) ? Integer.parseInt(pageNumberParam) : 1;
        } catch (NumberFormatException e) {
            pageNumber = 1;
        }

        int numberOfItems = list.size();

        if (status) { //if the list is not null
            Map<Rate, Product> results = new HashMap<>();
            for (Map.Entry<Rate, Product> entry : list.entrySet()) {
                Rate key = entry.getKey();
                Product val = entry.getValue();
                //search product name
                if (key.getFeedback().contains(searchQuery) || val.getName().contains(searchQuery)
                        || val.getCPU().contains(searchQuery) || val.getGPU().contains(searchQuery)
                        || val.getOS().contains(searchQuery)) {
                    results.put(key, val);
                }
                //search by rate id and customer object
                for (Map.Entry<Integer, Customer> entry1 : new RateDAO().getCustomerRate().entrySet()) {
                    Customer cus = entry1.getValue();
                    if (cus.getUsername().contains(searchQuery)) {
                        if (!results.containsKey(key)) {
                            results.put(key, val);
                        }
                    }
                }
            }

            if (!results.isEmpty()) {// the search list is not null
                list = results;
                session.setAttribute("feedbackList", list);
                MyUtils.setAlertAttributes(request, status, "find " + list.size() + " results.");
            } else {
                session.removeAttribute("feedbackList");
                MyUtils.setAlertAttributes(request, false, "found keyword '" + searchQuery + "'");
            }
        }
        Comparator<Rate> comparator = Comparator.comparing(Rate::getId).reversed();//sort object discount by key
        list = MyUtils.sortMap(list, comparator);
        numberOfItems = list.size();
        int numberOfPages = (int) Math.ceil((double) numberOfItems / ItemsOfPage);

        request.setAttribute(
                "numberOfItems", numberOfItems);
        request.setAttribute(
                "numberOfPage", numberOfPages);
        request.setAttribute(
                "feedbackList", MyUtils.getMapByPaging(list, pageNumber, ItemsOfPage));
        request.setAttribute(
                "customerList", new RateDAO().getCustomerRate());

        request.getRequestDispatcher(
                "Views/Employ/Manager/ManageFeedback.jsp?search=" + searchQuery + "&pageNumber=" + pageNumber).forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        // Get the ID of the rate to be deleted from the request parameter
        int rateId = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");
        // Perform deletion of rate by ID
        RateDAO rateDAO = new RateDAO();
        boolean deletionSuccess = rateDAO.deleteRateById(rateId);
        MyUtils.setAlertAttributes(request, deletionSuccess, "delete feedback ID " + rateId);
        HttpSession session = request.getSession();
        session.removeAttribute("feedbackList");
        // Forward back 
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
