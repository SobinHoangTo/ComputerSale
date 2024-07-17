package controller.Staff;

import dal.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Employee;
import model.Product;
import model.Product_image;

@MultipartConfig(maxFileSize = 16 * 1024 * 1024)
public class ManageProducts extends HttpServlet {

    private final int ItemsOfPage = 10;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("listBrand", new BrandDAO().getAll());
        request.setAttribute("listCategory", new CategoryDAO().getAll());
        String action = request.getParameter("action");

        if (action == null) {
            listProduct(request, response);
        } else {
            switch (action) {
                case "add" ->
                    addProduct(request, response);
                case "edit" ->
                    editProduct(request, response);
                case "delete" ->
                    deleteProduct(request, response);
                case "search" ->
                    searchProduct(request, response);
                case "categoryfilter" ->
                    categoryFilter(request, response);
                case "hidden" ->
                    hiddenProduct(request, response);
                case "display" ->
                    displayProduct(request, response);
                default ->
                    listProduct(request, response);
            }
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        int page = 1;
        int itemsPerPage = ItemsOfPage;

        String pageParam = request.getParameter("pageNumber");
        if (pageParam != null && !pageParam.isEmpty()) {
            page = Integer.parseInt(pageParam);
        }

        int totalProducts = productDAO.getTotalProducts();
        int numberOfPages = (int) Math.ceil((double) totalProducts / itemsPerPage);

        List<Product> listProduct = productDAO.getProductsByPage(page, itemsPerPage);
        Product_imageDAO productImageDAO = new Product_imageDAO();
        List<Product_image> listImage = productImageDAO.getAll();

        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listImage", listImage);
        request.setAttribute("numberOfPages", numberOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("currentKeyword", request.getParameter("search"));
        request.setAttribute("currentCategoryId", request.getParameter("category"));

        request.getRequestDispatcher("Views/Employ/Staff/ManageProduct.jsp").forward(request, response);
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String CPU = request.getParameter("CPU");
        String GPU = request.getParameter("GPU");
        String RAM = request.getParameter("RAM");
        String ROM = request.getParameter("ROM");
        String monitor = request.getParameter("monitor");
        String OS = request.getParameter("OS");
        int price = Integer.parseInt(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Part representImage = request.getPart("representImage");
        String description = request.getParameter("description");
        int brand_id = Integer.parseInt(request.getParameter("brand"));
        int category_id = Integer.parseInt(request.getParameter("category"));
        HttpSession session = request.getSession();
        Employee currentE = (Employee) session.getAttribute("currentEmployee");
        String imageName = getFileName(representImage);

        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath.replace("build\\web", "") + "web" + File.separator + "Image" + File.separator + "Products";
        File file = new File(uploadPath + File.separator + imageName);

        try (InputStream fileContent = representImage.getInputStream()) {
            Files.copy(fileContent, file.toPath());
        }

        try {
            Thread.sleep(3000);
        } catch (InterruptedException ex) {
            Logger.getLogger(ManageBrand.class.getName()).log(Level.SEVERE, null, ex);
        }
//        new ProductDAO().addProduct(name, CPU, GPU, RAM, ROM, monitor, OS, price, description, brand_id, category_id, quantity, imageName, currentE.getId());

        ProductDAO productDAO = new ProductDAO();
        boolean success = productDAO.addProduct(name, CPU, GPU, RAM, ROM, monitor, OS, price, description, brand_id, category_id, quantity, imageName, currentE.getId());

        if (success) {
            int productId = productDAO.getLastInsertedProductId(); // Get the last inserted product ID

            // Handle additional images
            ArrayList<String> detailImageNames = new ArrayList<>();
            for (Part part : request.getParts()) {
                if (part.getName().equals("detailImages")) {
                    String detailImageName = getFileName(part);
                    detailImageNames.add(detailImageName);
                    String applicationRealPath = getServletContext().getRealPath("");
                    String uploadPathListImage = applicationRealPath.replace("build\\web", "") + "web" + File.separator + "Image" + File.separator + "Products" + File.separator + "ImgList";
                    File detailImageFile = new File(uploadPathListImage + File.separator + detailImageName);
                    try (InputStream detailFileContent = part.getInputStream()) {
                        Files.copy(detailFileContent, detailImageFile.toPath());
                    }
                }
            }
            try {
                Thread.sleep(3000);
            } catch (InterruptedException ex) {
                Logger.getLogger(ManageBrand.class.getName()).log(Level.SEVERE, null, ex);
            }
            Product_imageDAO productImageDAO = new Product_imageDAO();
            for (String detailImageName : detailImageNames) {
                productImageDAO.addProductImage(productId, detailImageName);
            }
        }
        request.setAttribute("listImage", new Product_imageDAO().getAll());
        response.sendRedirect("manageproducts");
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String CPU = request.getParameter("CPU");
        String GPU = request.getParameter("GPU");
        String RAM = request.getParameter("RAM");
        String ROM = request.getParameter("ROM");
        String monitor = request.getParameter("monitor");
        String OS = request.getParameter("OS");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        int brand_id = Integer.parseInt(request.getParameter("brand"));
        int category_id = Integer.parseInt(request.getParameter("category"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Part representImage = request.getPart("representImage");
        HttpSession session = request.getSession();
        Employee currentE = (Employee) session.getAttribute("currentEmployee");
        int id = Integer.parseInt(request.getParameter("id"));

        String imageFileName = getFileName(representImage);

        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath.replace("build\\web", "") + "web" + File.separator + "Image" + File.separator + "Products";

        if (imageFileName != null && !imageFileName.isEmpty()) {
            File logoFile = new File(uploadPath + File.separator + imageFileName);
            try (InputStream fileContent = representImage.getInputStream()) {
                Files.copy(fileContent, logoFile.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            imageFileName = request.getParameter("existingImage");
        }

        try {
            Thread.sleep(3000);
        } catch (InterruptedException ex) {
            Logger.getLogger(ManageBrand.class.getName()).log(Level.SEVERE, null, ex);
        }
        new ProductDAO().editProductById(name, CPU, GPU, RAM, ROM,
                monitor, OS, price, description, brand_id, category_id, quantity, imageFileName, currentE.getId(), id);
        response.sendRedirect("manageproducts");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        new ProductDAO().deleteProductByID(Integer.parseInt(request.getParameter("id")));
        response.sendRedirect("manageproducts");
    }

    private void hiddenProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        new ProductDAO().hiddenProduct(Integer.parseInt(request.getParameter("id")));
        response.sendRedirect("manageproducts");
    }

    private void displayProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        new ProductDAO().displayProduct(Integer.parseInt(request.getParameter("id")));
        response.sendRedirect("manageproducts");
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("search").trim().replaceAll("\\s+", " ");
        ProductDAO productDAO = new ProductDAO();
        int page = 1;
        int itemsPerPage = ItemsOfPage;
        String pageParam = request.getParameter("pageNumber");
        if (pageParam != null && !pageParam.isEmpty()) {
            page = Integer.parseInt(pageParam);
        }
        int totalProducts = productDAO.getTotalProducts();
        int numberOfPages = (int) Math.ceil((double) totalProducts / itemsPerPage);
        List<Product> listProduct = productDAO.searchProductByKeyWord(keyword, page, itemsPerPage);
        List<Product_image> listImage = new Product_imageDAO().getAll();
        
        request.setAttribute("listImage", listImage);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("numberOfPages", numberOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("currentKeyword", keyword);
        request.getRequestDispatcher("Views/Employ/Staff/ManageProduct.jsp").forward(request, response);
    }

    private void categoryFilter(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("productcate"));
        if (categoryId == 0) {
            listProduct(request, response);
        } else {
            ProductDAO productDAO = new ProductDAO();
            int page = 1;
            int itemsPerPage = ItemsOfPage;
            String pageParam = request.getParameter("pageNumber");
            if (pageParam != null && !pageParam.isEmpty()) {
                page = Integer.parseInt(pageParam);
            }
            int totalProducts = productDAO.getTotalProductsByCategory(categoryId);
            int numberOfPages = (int) Math.ceil((double) totalProducts / itemsPerPage);
            List<Product> listProduct = productDAO.getProductsByCategoryAndPage(categoryId, page, itemsPerPage);
            List<Product_image> listImage = new Product_imageDAO().getAll();
            
            request.setAttribute("listImage", listImage);
            request.setAttribute("listProduct", listProduct);
            request.setAttribute("numberOfPages", numberOfPages);
            request.setAttribute("currentPage", page);
            request.setAttribute("currentCategoryId", categoryId);
        }
        request.getRequestDispatcher("Views/Employ/Staff/ManageProduct.jsp").forward(request, response);
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String content : contentDisposition.split(";")) {
            if (content.trim().startsWith("filename")) {
                return Paths.get(content.substring(content.indexOf('=') + 1).trim().replace("\"", "")).getFileName().toString();
            }
        }
        return null;
    }
}
