/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Guest;

import dal.BrandDAO;
import dal.CategoryDAO;
import dal.DiscountDAO;
import dal.NewsDAO;
import dal.News_categoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
        pList = pList == null ? new ProductDAO().getAvailable(null) : pList;
        int pageNumber;
        try {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
            done(request, response, pList, pageNumber);
            return;
        } catch (Exception e) {
            pageNumber = 1;
        }
        if (request.getParameter("search") != null) {
            String search = request.getParameter("search");
            pList = sortListBySimilarity(search, pList);
            session.setAttribute("pList", pList);
            done(request, response, pList, pageNumber);
            return;
        }
        if (request.getParameter("sort") != null) {
            try {
                int sort = Integer.parseInt(request.getParameter("sort"));
                pList = sort(pList, sort);
                session.setAttribute("pList", pList);
                session.setAttribute("sort", sort);
                done(request, response, pList, pageNumber);
                return;
            } catch (Exception e) {
                System.out.println("Sort product list error: " + e.getMessage());
            }
        }
        if (request.getParameter("filter") != null) {
            try {
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
                if (request.getParameter("price") != null) {
                    if (Integer.parseInt(request.getParameter("price")) > 0) {
                        if (filter.isEmpty()) {
                            filter.append(" price<").append(request.getParameter("price"));
                        } else {
                            filter.append(" and price<").append(request.getParameter("price"));
                        }
                    }
                }

                System.out.println(filter.toString());
                session.setAttribute("priceFilter", request.getParameter("price"));
                pList = new ProductDAO().getAllByFilter(filter.toString());
                try {
                    int sort = (Integer) session.getAttribute("sort");
                    pList = sort(pList, sort);
                } catch (Exception e) {
                }
                session.setAttribute("pList", pList);
                done(request, response, pList, pageNumber);
                return;
            } catch (Exception e) {
                System.out.println("Filter product list error: " + e.getMessage());
            }
        }

        done(request, response, pList, pageNumber);
    }

    private ArrayList<Product> sortByName(int type, ArrayList<Product> list) {
        Collections.sort(list, (Product p1, Product p2) -> type == 1 ? p1.getName().compareToIgnoreCase(p2.getName()) : p2.getName().compareToIgnoreCase(p1.getName()));
        return list;
    }

    private ArrayList<Product> sortByPrice(int type, ArrayList<Product> list) {
        Collections.sort(list, (Product p1, Product p2) -> type == 1 ? p1.getPrice() - p2.getPrice() : p2.getPrice() - p1.getPrice());
        return list;
    }

    private void done(HttpServletRequest request, HttpServletResponse response, ArrayList<Product> pList, int pageNumber)
            throws ServletException, IOException {
        int numberOfItems = pList.size();
        request.setAttribute("categoryList", new CategoryDAO().getAvailiable(null));
        request.setAttribute("newsHeaderName", new News_categoryDAO().getByIdActive(1));
        request.setAttribute("newsHeader", new NewsDAO().getNewsByCategoryID(1));
        request.setAttribute("brandHeader", new BrandDAO().getAllByActiveStatus());
        pushNew(request, response);

        request.setAttribute("discount", new DiscountDAO().getDiscountProductID());
        request.setAttribute("bList", new BrandDAO().getAllByActiveStatus());
        request.setAttribute("numberOfItems", numberOfItems);
        request.setAttribute("numberOfPage", numberOfItems / ItemsOfPage + 1);
        request.setAttribute("pList", MyUtils.getArrayListByPaging(pList, pageNumber, ItemsOfPage));
        request.getRequestDispatcher("Views/Guest/Products.jsp?pageNumber=" + pageNumber).forward(request, response);
    }

    private ArrayList<Product> sort(ArrayList<Product> pList, int sort) {
        switch (sort) {
            case 1 ->
                pList = sortByName(1, pList);
            case 2 ->
                pList = sortByName(2, pList);
            case 3 ->
                pList = sortByPrice(1, pList);
            case 4 ->
                pList = sortByPrice(2, pList);
            default ->
                throw new AssertionError();
        }
        return pList;
    }

    private int calculateSimilarity(String input, String name) {
        // For simplicity, we'll just count the number of matching characters at the start
        input = input.toLowerCase();
        name = name.toLowerCase();

        // Check if the name contains the input as a substring
        if (name.contains(input)) {
            return Integer.MAX_VALUE; // Assign a very high value for exact sequence matches
        }

        int minLength = Math.min(input.length(), name.length());
        int count = 0;
        for (int i = 0; i < minLength; i++) {
            if (input.charAt(i) == name.charAt(i)) {
                count++;
            } else {
                break;
            }
        }
        return count;
    }

// Function to sort the list based on similarity to the input string
    public ArrayList<Product> sortListBySimilarity(String input, ArrayList<Product> list) {
        Collections.sort(list, (Product o1, Product o2) -> {
            int similarity1 = calculateSimilarity(input, o1.getName());
            int similarity2 = calculateSimilarity(input, o2.getName());
            return Integer.compare(similarity2, similarity1); // Descending order
        });
        return list;
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
