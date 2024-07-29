package controller.Staff;

import dal.News_categoryDAO;
import dal.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import model.*;
import util.MyUtils;

/**
 *
 * @author Admin
 */
public class ManageNewsCategory extends HttpServlet {

    private final int ItemsOfPage = 10;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchQuery = request.getParameter("search");
        ArrayList<News_category> searchResults = null;
        boolean status = false;
        try {
            News_categoryDAO newsDAO = new News_categoryDAO();

            status = searchQuery != null && !searchQuery.isEmpty();
            if (status) {
                searchResults = newsDAO.searchNewCategoryString(searchQuery.trim());
                status = !searchResults.isEmpty();
                MyUtils.setAlertAttributes(request, status, "search " + searchQuery);
            } else {
                searchResults = newsDAO.getAll();
            }
            String pageNumberParam = request.getParameter("pageNumber");
            int pageNumber = pageNumberParam != null ? Integer.parseInt(pageNumberParam) : 1;
            int numberOfItems = searchResults.size();
            request.setAttribute("numberOfItems", numberOfItems);
            request.setAttribute("numberOfPage", (int) Math.ceil((double) numberOfItems / ItemsOfPage));
            request.setAttribute("categoryList", MyUtils.getArrayListByPaging(searchResults, pageNumber, ItemsOfPage));
            request.setAttribute("searchWords", searchQuery);
            request.getRequestDispatcher("Views/Employ/Staff/ManageNewsCategory.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("alertMessage", "An error occurred while processing your request.");
            request.setAttribute("alertType", "danger");
            request.getRequestDispatcher("Views/Employ/Staff/ManageNewsCategory.jsp").forward(request, response);
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            String id_Raw = request.getParameter("id");
            String categoryName = request.getParameter("categoryName");
            HttpSession session = request.getSession();
            Employee currentE = (Employee) session.getAttribute("currentEmployee");
            boolean status = false;
            switch (action) {
                case "add":
                    status = new News_categoryDAO().addCategory(categoryName);
                    break;
                case "update":
                    status = new News_categoryDAO().editCategory(categoryName, Integer.parseInt(id_Raw));
                    break;
                case "active":
                    status = new News_categoryDAO().updateStatus(1, Integer.parseInt(id_Raw));
                    break;
                case "inactive":
                    status = new News_categoryDAO().updateStatus(0, Integer.parseInt(id_Raw));
                    break;
                case "delete":
                    status = new News_categoryDAO().deleteCategory(Integer.parseInt(id_Raw));
                    break;
                default:
                    request.setAttribute("alertMessage", "Unknown action: " + action);
                    request.setAttribute("alertType", "danger");
                    doGet(request, response);
                    return;
            }
            MyUtils.setAlertAttributes(request, status, action + " category ");
        } catch (Exception e) {
            request.setAttribute("alertMessage", "An error occurred while processing your request.");
            request.setAttribute("alertType", "danger");
        }
        doGet(request, response);
    }

}
