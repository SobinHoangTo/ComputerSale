/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Guest;

import dal.BrandDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Product;
import util.MyUtils;

/**
 *
 * @author Admin
 */
public class ProductsList extends HttpServlet {

    private final int ItemsOfPage = 9;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Product> pList = (ArrayList<Product>) session.getAttribute("pList");
        int pageNumber;
        try {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        } catch (Exception e) {
            System.out.println("Caught Exception: " + e.getMessage());
            pageNumber = 1;
            pList = new ProductDAO().getAll();
            session.setAttribute("pList", pList);
            session.removeAttribute("brandFilter");
            session.removeAttribute("categoryFilter");
            session.removeAttribute("priceFilter");
        }
        pList = pList == null ? new ProductDAO().getAll() : pList;
        if (request.getParameter("filter") != null) {
            StringBuilder filter = new StringBuilder();
            if (request.getParameterValues("brand") != null) {
                for (String i : request.getParameterValues("brand")) {
                    if (filter.isEmpty()) {
                        filter.append(" (brand_id=").append(i);
                    } else {
                        filter.append(" or brand_id=").append(i);
                    }
                }
                filter.append(")");
            }
            System.out.println(request.getParameterValues("brand"));
            session.setAttribute("brandFilter", request.getParameterValues("brand"));
            if (Integer.parseInt(request.getParameter("category")) > 0) {
                if (filter.isEmpty()) {
                    filter.append(" category_id=").append(request.getParameter("category"));
                } else {
                    filter.append(" and category_id=").append(request.getParameter("category"));
                }
            }
            
            System.out.println(request.getParameter("category"));
            session.setAttribute("categoryFilter", request.getParameter("category"));
            if (Integer.parseInt(request.getParameter("price")) > 0) {
                if (filter.isEmpty()) {
                    filter.append(" price<").append(request.getParameter("price"));
                } else {
                    filter.append(" and price<").append(request.getParameter("price"));
                }
            }
            System.out.println(filter.toString());
            session.setAttribute("priceFilter", request.getParameter("price"));
            pList = new ProductDAO().getAllByFilter(filter.toString());
            session.setAttribute("pList", pList);
        }

        int numberOfItems = pList.size();
        request.setAttribute("categoryList", new CategoryDAO().getAll());
        request.setAttribute("bList", new BrandDAO().getAll());
        request.setAttribute("numberOfItems", numberOfItems);
        request.setAttribute("numberOfPage", numberOfItems / ItemsOfPage + 1);
        request.setAttribute("pList", MyUtils.getArrayListByPaging(pList, pageNumber, ItemsOfPage));
        request.getRequestDispatcher("Views/Guest/Products.jsp?pageNumber=" + pageNumber).forward(request, response);
    }
}
