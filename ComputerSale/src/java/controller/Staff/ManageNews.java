package controller.Staff;

import dal.News_categoryDAO;
import dal.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Comparator;
import model.*;
import util.MyUtils;

public class ManageNews extends HttpServlet {
    
    private final int ItemsOfPage = 10;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchQuery = request.getParameter("search");
        String categoryFilter = request.getParameter("category");
        HttpSession session = request.getSession();
        ArrayList<News> searchResults = (ArrayList<News>) session.getAttribute("nMap");
        boolean status = false;
        try {
            NewsDAO newsDAO = new NewsDAO();
            // Check if search results are not initialized
            if (searchResults == null) {
                searchResults = newsDAO.getManageNews(); // Retrieve all if not already stored in session
            }
            
            if (searchQuery != null && !searchQuery.isEmpty()) {
                searchResults = newsDAO.searchByNewString(searchQuery.trim());
                status = !searchResults.isEmpty();
                MyUtils.setAlertAttributes(request, status, "found " + searchResults.size() + " results of '" + searchQuery + "'");
            } else if (categoryFilter != null && !categoryFilter.isEmpty()) {
                int categoryId = Integer.parseInt(categoryFilter);
                searchResults = (categoryId == 0) ? newsDAO.getManageNews() : newsDAO.searchByNewsCategory(categoryId);
                
            }

            // If searchResults is still null or empty, return all employees
            if (searchResults.isEmpty()) {
                searchResults = newsDAO.getManageNews();
                session.setAttribute("nMap", searchResults);
            }
            searchResults.sort(Comparator.comparingInt(News::getId).reversed());
            String pageNumberParam = request.getParameter("pageNumber");
            int pageNumber = pageNumberParam != null ? Integer.parseInt(pageNumberParam) : 1;
            int numberOfItems = searchResults.size();
            request.setAttribute("numberOfItems", numberOfItems);
            request.setAttribute("numberOfPage", (int) Math.ceil((double) numberOfItems / ItemsOfPage));
            request.setAttribute("nMap", MyUtils.getArrayListByPaging(searchResults, pageNumber, ItemsOfPage));
            request.setAttribute("employee", new EmployeeDAO().getAll());
            request.setAttribute("searchWords", searchQuery);
            request.setAttribute("categoryList", new News_categoryDAO().getAll());
        } catch (Exception e) {
            request.setAttribute("alertMessage", "An error occurred while processing your request.");
            request.setAttribute("alertType", "danger");
            e.printStackTrace();
        }
        request.getRequestDispatcher("Views/Employ/Staff/ManageNews.jsp?pageNumber=").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Servlet for managing news by staff";
    }
}
