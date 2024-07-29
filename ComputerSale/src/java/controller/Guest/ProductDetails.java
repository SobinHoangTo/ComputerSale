package controller.Guest;

import dal.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import model.Discount;
import model.Product_image;

public class ProductDetails extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id_raw = request.getParameter("id");
            int id = Integer.parseInt(id_raw);
            Map<Integer, Discount> discount = new DiscountDAO().getAllMapKeyProductId();
            request.setAttribute("discount", discount.get(id) == null ? null : discount.get(id).getValue());
            request.setAttribute("product", new ProductDAO().getById(id));
            request.setAttribute("news", new ProductDAO().getById(id));
            request.setAttribute("comment", new RateDAO().getCommentByID(id));
            pushNew(request, response);

            request.setAttribute("relatedProducts", new ProductDAO().getRelatedProducts(id));
            Product_imageDAO productImageDAO = new Product_imageDAO();
            List<Product_image> listImage = productImageDAO.getAll();
            request.setAttribute("listImage", listImage);
            request.getRequestDispatcher("/Views/Guest/ProductDetails.jsp").forward(request, response);
            return;
        } catch (Exception e) {
        }

        String pathInfo = request.getPathInfo();
        if (pathInfo != null) {
            System.out.println(pathInfo);
            String[] pathInfoDetails = pathInfo.split("/");
            if (pathInfoDetails.length >= 1) {
                String id_raw = pathInfoDetails[pathInfoDetails.length - 1].split("-")[0];
                try {
                    int id = Integer.parseInt(id_raw);
                    Map<Integer, Discount> discount = new DiscountDAO().getAllMapKeyProductId();
                    request.setAttribute("id", id);
                    request.setAttribute("discount", discount.get(id) == null ? null : discount.get(id).getValue());
                    request.setAttribute("product", new ProductDAO().getById(id));
                    request.setAttribute("news", new ProductDAO().getById(id));
                    request.setAttribute("comment", new RateDAO().getCommentByID(id));
                    request.setAttribute("relatedProducts", new ProductDAO().getRelatedProducts(id));
                    pushNew(request, response);

                    request.setAttribute("newsHeaderName", new News_categoryDAO().getByIdActive(1));
                    request.setAttribute("newsHeader", new NewsDAO().getNewsByCategoryID(1));
                    request.setAttribute("brandHeader", new BrandDAO().getAllByActiveStatus());

                    Product_imageDAO productImageDAO = new Product_imageDAO();
                    List<Product_image> listImage = productImageDAO.getAll();
                    request.setAttribute("listImage", listImage);
                    request.getRequestDispatcher("/Views/Guest/ProductDetails.jsp").forward(request, response);
                    return;
                } catch (Exception e) {
                    System.out.println("ProductDetails error: " + e.getMessage());
                }
            }
        }
        response.sendRedirect(request.getContextPath());
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
