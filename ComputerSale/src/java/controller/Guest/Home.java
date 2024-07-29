package controller.Guest;

import dal.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.mail.Session;
import model.Product;

public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("categoryList", new CategoryDAO().getAll());
        request.setAttribute("news", new NewsDAO().getHomeNews());
        request.setAttribute("newsHeaderName", new News_categoryDAO().getByIdActive(1));
        request.setAttribute("newsHeader", new NewsDAO().getNewsByCategoryID(1));
        request.setAttribute("brandHeader", new BrandDAO().getAllByActiveStatus());
        pushNew(request, response);

        request.setAttribute("discount", getMatchingEntries(new DiscountDAO().getDiscountProductID(), new ProductDAO().getHomeProduct()));
        session.setAttribute("listBrand", new BrandDAO().getAllByActiveStatus());
        request.setAttribute("topProducts", new ProductDAO().getHomeProduct());

        request.getRequestDispatcher("Views/Guest/Home.jsp").forward(request, response);
    }

    public static Map<Integer, Integer> getMatchingEntries(Map<Integer, Integer> map, ArrayList<Product> objList) {
        Map<Integer, Integer> entry = new HashMap<>();
        for (Product obj : objList) {
            if (map.containsKey(obj.getId())) {
                entry.put(obj.getId(), map.get(obj.getId()));
            }
        }
        return entry;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("listBrand", new BrandDAO().getAll());
        System.out.println(new BrandDAO().getAll());
        request.getRequestDispatcher("Views/Guest/Home.jsp").forward(request, response);
//        request.getRequestDispatcher("home").forward(request, response);
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
