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
        String roleQuery = request.getParameter("roleSearch");
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
                MyUtils.setAlertAttributes(request, true, "found " + searchResults.size() + " of '" + searchQuery + "'");
            } else {
                // No results found, empty the list
                session.removeAttribute("eList");
                MyUtils.setAlertAttributes(request, false, "search " + searchQuery);
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
                } else if (roleId == 0) {
                    searchResults = dao.getAll();
                } else {
                    searchResults = new ArrayList<>(); // No results found, empty the list
                }
            } catch (NumberFormatException e) {
                // Handle invalid role query gracefully
                request.setAttribute("alertMessage", "Invalid role ID.");
                request.setAttribute("alertType", "danger");
                searchResults = new ArrayList<>(); // No valid results, empty the list
            }
        }
        System.out.println("print here");
// If searchResults is still null or empty, return all employees
        if (searchResults.isEmpty()) {
            searchResults = dao.getAll();
            session.setAttribute("eList", searchResults);
            MyUtils.setAlertAttributes(request, false, searchQuery + roleQuery);
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
        String action = request.getParameter("action");

        if (idParam == null && idParam.isEmpty()) {
            // Handling when ID parameter is present (for search or initial load)
            MyUtils.setAlertAttributes(request, false, "Searching ID " + idParam);
            doGet(request, response); // Assuming doGet method handles initial data retrieval
        } else {
            // Handling actions based on the 'action' parameter
            boolean status = false;
            try {
                int id = Integer.parseInt(idParam); // Parse ID to integer
                EmployeeDAO employeeDAO = new EmployeeDAO(); // Instantiate DAO object

                switch (action) {
                    case "updateRole":
                        // Updating employee role
                        String role = request.getParameter("role");
                        int roleId = switch (role) {
                            case "2" ->
                                2; // Manager
                            case "1" ->
                                1; // Admin
                            default ->
                                3; // Staff (default)
                        };
                        status = employeeDAO.updateEmployeeRole(id, roleId);
                        break;

                    case "active":
                        // Setting employee status to active (1)
                        status = employeeDAO.updateEmployeeStatus(id, 1);
                        break;

                    case "inactive":
                        // Setting employee status to inactive (0)
                        status = employeeDAO.updateEmployeeStatus(id, 0);
                        break;

                    default:
                        throw new AssertionError("Invalid action: " + action);
                }

                if (status) {
                    // Refreshing data after successful update
                    HttpSession session = request.getSession();
                    session.removeAttribute("eList"); // Remove cached employee list
                }
            } catch (NumberFormatException ex) {
                // Handling invalid ID format
                request.setAttribute("alertMessage", "Invalid ID format.");
                request.setAttribute("alertType", "danger");
            }

            // Setting alert message based on action performed
            MyUtils.setAlertAttributes(request, status, action + " account ID: " + idParam);
            // Forwarding to doGet to refresh page with updated data or error message
            doGet(request, response);
        }

    }

}
