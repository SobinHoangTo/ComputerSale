package controller.Guest;

import dal.BrandDAO;
import dal.NewsDAO;
import dal.News_categoryDAO;
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
        pushNew(request, response);
        request.setAttribute("newsHeaderName", new News_categoryDAO().getByIdActive(1));
        request.setAttribute("newsHeader", new NewsDAO().getNewsByCategoryID(1));
        request.setAttribute("brandHeader", new BrandDAO().getAllByActiveStatus());
        request.getRequestDispatcher("Views/Guest/News.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void pushNew(HttpServletRequest request, HttpServletResponse response) {
        model.News news = new NewsDAO().getNewsByID(1);
        if (news != null) {
            String newsDetail = news.getNews_detail();
            String address = "", phone = "", email = "";

            if (newsDetail != null && !newsDetail.isEmpty()) {
                for (String detail : newsDetail.split("<br>")) {
                    if (detail.startsWith("Store Address: ")) {
                        address = detail.substring(15);
                    } else if (detail.startsWith("Phone: ")) {
                        phone = detail.substring(7);
                    } else if (detail.startsWith("Email: ")) {
                        email = detail.substring(7);
                    }
                }
            }

            request.setAttribute("address", address);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
        }
    }
}
