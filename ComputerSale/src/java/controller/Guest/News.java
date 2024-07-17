package controller.Guest;

import dal.NewsDAO;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Map;
import model.*;

public class News extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
         Map<String, model.News> newsMap = new NewsDAO().getAuthorNews(id);
         for (Map.Entry<String, model.News> entry : newsMap.entrySet()) {
            String key = entry.getKey();
            model.News value = entry.getValue();
            request.setAttribute("author", key);
            request.setAttribute("news", value);
        }
        request.getRequestDispatcher("Views/Guest/News.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
