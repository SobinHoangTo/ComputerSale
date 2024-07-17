/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Admin;

import dal.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import model.*;
import util.MyUtils;

/**
 *
 * @author Admin
 */
public class ManageAccount extends HttpServlet {

    private final int ItemsOfPage = 10;

//    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String searchQuery = request.getParameter("search");
        String roleQuery = request.getParameter("role");
        HttpSession session = request.getSession();
        ArrayList<Employee> searchResults = (ArrayList<Employee>) session.getAttribute("eList");
        EmployeeDAO dao = new EmployeeDAO();

        boolean isSearchQueryProvided = searchQuery != null && !searchQuery.isEmpty();
        boolean isRoleQueryProvided = roleQuery != null && !roleQuery.isEmpty();

// Check if search results are not initialized
        if (searchResults == null) {
            searchResults = dao.getAll(); // Retrieve all employees if not already stored in session
        }

// Filter by search query if provided
        if (isSearchQueryProvided) {
            ArrayList<Employee> results = new ArrayList<>();
            for (Employee i : searchResults) {
                if (i.toString().contains(searchQuery)) {
                    results.add(i);
                }
            }
            if (!results.isEmpty()) {
                searchResults = results;
                session.setAttribute("eList", searchResults);
            } else {
                searchResults = new ArrayList<>(); // No results found, empty the list
            }
        }

        // Filter by role if provided
        if (isRoleQueryProvided) {
            try {
                int roleId = Integer.parseInt(roleQuery);
                ArrayList<Employee> roleResults = new ArrayList<>();
                for (Employee i : searchResults) {
                    if (i.getRole_id() == roleId) {
                        roleResults.add(i);
                    }
                }
                if (!roleResults.isEmpty()) {
                    searchResults = roleResults;
                }else if (roleId==0) {
                    searchResults = dao.getAll();
                }
                else {
                    searchResults = new ArrayList<>(); // No results found, empty the list
                }
            } catch (NumberFormatException e) {
                // Handle invalid role query gracefully
                request.setAttribute("alertMessage", "Invalid role ID.");
                request.setAttribute("alertType", "danger");
                searchResults = new ArrayList<>(); // No valid results, empty the list
            }
        }

// If searchResults is still null or empty, return all employees
        if (searchResults.isEmpty()) {
            searchResults = dao.getAll();
            session.setAttribute("eList", searchResults);
            MyUtils.setAlertAttributes(request, isSearchQueryProvided, roleQuery);
        }

// Handle pagination
        String pageNumberParam = request.getParameter("pageNumber");
        int pageNumber = pageNumberParam != null ? Integer.parseInt(pageNumberParam) : 1;
        int numberOfItems = searchResults.size();
        int numberOfPages = (int) Math.ceil((double) numberOfItems / ItemsOfPage);

        request.setAttribute("numberOfItems", numberOfItems);
        request.setAttribute("numberOfPage", numberOfPages);
        request.setAttribute("eList", MyUtils.getArrayListByPaging(searchResults, pageNumber, ItemsOfPage));

        request.getRequestDispatcher("Views/Employ/Admin/ManageAccount.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                String role = request.getParameter("role");

                // Convert role to role_id
                int roleId = switch (role) {
                    case "2" ->
                        2;
                    case "1" ->
                        1;
                    default ->
                        3;
                };

                // Update the employee role in the database
                EmployeeDAO employeeDAO = new EmployeeDAO();
                boolean isUpdated = employeeDAO.updateEmployeeRole(id, roleId);

                // Set an attribute for the result message
                if (isUpdated) {
                    request.setAttribute("alertMessage", "Role updated successfully!");
                    request.setAttribute("alertType", "success");
                } else {
                    request.setAttribute("alertMessage", "Failed to update the role.");
                    request.setAttribute("alertType", "danger");
                }
            } catch (NumberFormatException ex) {
                // Handle the case where the ID parameter is not a valid integer
                request.setAttribute("alertMessage", "Invalid ID format.");
                request.setAttribute("alertType", "danger");
            }
        } else {
            // Handle the case where the ID parameter is null or empty
            request.setAttribute("alertMessage", "ID parameter is missing.");
            request.setAttribute("alertType", "danger");
        }

        // Forward to the management page to display the result message
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
