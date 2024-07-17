package controller.Guest;

import dal.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.mail.Session;

public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("categoryList", new CategoryDAO().getAll());
        request.setAttribute("listBrand", new BrandDAO().getAll());
        request.setAttribute("topProducts", new ProductDAO().getHomeProduct());
        request.setAttribute("news", new NewsDAO().getHomeNews());
        
        
        request.getRequestDispatcher("Views/Guest/Home.jsp").forward(request, response);    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        request.setAttribute("listBrand", new BrandDAO().getAll());
        System.out.println(new BrandDAO().getAll());
        request.getRequestDispatcher("Views/Guest/Home.jsp").forward(request, response);
//        request.getRequestDispatcher("home").forward(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
