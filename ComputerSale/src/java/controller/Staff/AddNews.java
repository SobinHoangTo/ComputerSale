package controller.Staff;

import dal.*;
import model.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import util.MyUtils;

public class AddNews extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetch the categories
        request.setAttribute("categoryList", new News_categoryDAO().getAll());

        // Fetch news if editing
        String newsId = request.getParameter("newsid");
        if (newsId != null) {
            try {
                News news = new NewsDAO().getNewsByID(Integer.parseInt(newsId));
                request.setAttribute("news", news);
            } catch (NumberFormatException e) {
                request.setAttribute("alertMessage", "Invalid news ID format.");
                request.setAttribute("alertType", "danger");
            }
        }

        request.getRequestDispatcher("Views/Employ/Staff/AddNews.jsp?newsid=" + newsId).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action_raw = request.getParameter("action");
        String idStr = request.getParameter("id");
        try {
            int action = Integer.parseInt(action_raw);
            action_raw = (action == 1) ? "save changes" : (action == 2) ? "delete" : "add";
            boolean status = handleAction(request, response, action);
            MyUtils.setAlertAttributes(request, status, action_raw + " news number ");

        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
            request.setAttribute("alertMessage", "An error occurred while processing your request.");
            request.setAttribute("alertType", "danger");
        }
        doGet(request, response);
    }

    public News parseParameter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String title = request.getParameter("title");
        String shortDescription = request.getParameter("shortDescription");
        String newsDetail = request.getParameter("newsDetail");
        String newsCategoryIdStr = request.getParameter("news_category_id");
        String status_raw = request.getParameter("status");
        HttpSession session = request.getSession();
        Employee currentE = (Employee) session.getAttribute("currentEmployee");

        MyUtils.validateParameters(idStr, title, shortDescription, newsDetail, newsCategoryIdStr);

        int id = Integer.parseInt(idStr);
        int newsCategoryId = Integer.parseInt(newsCategoryIdStr);
        int status = Integer.parseInt(status_raw);
        return new News(id, title, shortDescription,
                LocalDate.now().toString(), currentE.getId(),
                newsDetail, newsCategoryId, status);
    }

    private boolean handleAction(HttpServletRequest request, HttpServletResponse response, int action) throws ServletException, IOException {
        boolean isUpdated = false;
        switch (action) {
            case 1:
                isUpdated = new NewsDAO().updateNews(parseParameter(request, response));
                break;
            case 2:
                String idStr = request.getParameter("id");
                try {
                    int id = Integer.parseInt(idStr);
                    isUpdated = new NewsDAO().deleteNews(id);
                } catch (Exception e) {
                }
                break;
            case 3:
                isUpdated = new NewsDAO().addNews(parseParameter(request, response));
                System.out.println("Add Done");
                break;
            default:
                request.setAttribute("alertMessage", "Unknown action: " + action);
                request.setAttribute("alertType", "danger");
                doGet(request, response);
        }
        return isUpdated;
    }

}
