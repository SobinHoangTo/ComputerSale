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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import model.Employee;
import model.Product;
import model.Product_image;
import util.MyUtils;

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
                case "search" ->
                    searchProduct(request, response);
                case "categoryfilter" ->
                    categoryFilter(request, response);
                case "hidden" ->
                    hiddenProduct(request, response);
                case "display" ->
                    displayProduct(request, response);
            }
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String act = request.getParameter("act");
        ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("listProduct");
        list = (list == null && act != null) ? new ProductDAO().getAll() : list;
        session.setAttribute("listProduct", list);
        Product_imageDAO productImageDAO = new Product_imageDAO();
        List<Product_image> listImage = productImageDAO.getAll();

        String pageNumberParam = request.getParameter("pageNumber");
        int pageNumber = pageNumberParam != null ? Integer.parseInt(pageNumberParam) : 1;
        int numberOfPages = (int) Math.ceil((double) list.size() / ItemsOfPage);

        request.setAttribute("listProduct", MyUtils.getArrayListByPaging(list, pageNumber, ItemsOfPage));
        request.setAttribute("listImage", listImage);
        request.setAttribute("numberOfPage", numberOfPages);
        request.setAttribute("pageNumber", pageNumber);

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

        if (imageName != null && !imageName.isEmpty()) {
            // Xác thực tệp tin hình ảnh
            try (InputStream fileContent = representImage.getInputStream()) {
                if (ImageIO.read(fileContent) == null) {
                    response.sendRedirect("manageproducts?mess=Invalid image file.&alertType=danger");
                    return;
                }
                // Đặt lại InputStream
                representImage = request.getPart("representImage");
            }

            File file = new File(uploadPath + File.separator + imageName);

            // Đổi tên tệp nếu đã tồn tại
            if (file.exists()) {
                String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
                String fileExtension = imageName.substring(imageName.lastIndexOf("."));
                String fileNameWithoutExtension = imageName.substring(0, imageName.lastIndexOf("."));
                imageName = fileNameWithoutExtension + "_" + timestamp + fileExtension;
                file = new File(uploadPath + File.separator + imageName);
            }

            try (InputStream fileContent = representImage.getInputStream()) {
                Files.copy(fileContent, file.toPath());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        try {
            Thread.sleep(3000);
        } catch (InterruptedException ex) {
            Logger.getLogger(ManageProducts.class.getName()).log(Level.SEVERE, null, ex);
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
                    if (detailImageName != null && !detailImageName.isEmpty()) {
                        // Xác thực tệp tin hình ảnh
                        try (InputStream fileContent = part.getInputStream()) {
                            if (ImageIO.read(fileContent) == null) {
                                response.sendRedirect("managebrand?mess=Invalid image file.&alertType=danger");
                                return;
                            }
                            // Đặt lại InputStream
                            part = request.getPart("detailImages");
                        }
                        File detailImageFile = new File(uploadPathListImage + File.separator + detailImageName);

                        // Đổi tên tệp nếu đã tồn tại
                        if (detailImageFile.exists()) {
                            String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
                            String fileExtension = detailImageName.substring(detailImageName.lastIndexOf("."));
                            String fileNameWithoutExtension = detailImageName.substring(0, detailImageName.lastIndexOf("."));
                            detailImageName = fileNameWithoutExtension + "_" + timestamp + fileExtension;
                            detailImageFile = new File(uploadPath + File.separator + detailImageName);
                        }

                        try (InputStream detailFileContent = part.getInputStream()) {
                            Files.copy(detailFileContent, detailImageFile.toPath());
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
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
        session.setAttribute("listProduct", new ProductDAO().getAll());
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
            // Xác thực tệp tin hình ảnh
            try (InputStream fileContent = representImage.getInputStream()) {
                if (ImageIO.read(fileContent) == null) {
                    response.sendRedirect("manageproducts?mess=Invalid image file.&alertType=danger");
                    return;
                }
                // Đặt lại InputStream
                representImage = request.getPart("representImage");
            }

            File file = new File(uploadPath + File.separator + imageFileName);

            // Đổi tên tệp nếu đã tồn tại
            if (file.exists()) {
                String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
                String fileExtension = imageFileName.substring(imageFileName.lastIndexOf("."));
                String fileNameWithoutExtension = imageFileName.substring(0, imageFileName.lastIndexOf("."));
                imageFileName = fileNameWithoutExtension + "_" + timestamp + fileExtension;
                file = new File(uploadPath + File.separator + imageFileName);
            }

            try (InputStream fileContent = representImage.getInputStream()) {
                Files.copy(fileContent, file.toPath());
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

        new ProductDAO().editProductById(name, CPU, GPU, RAM, ROM, monitor, OS, price, description, brand_id, category_id, quantity, imageFileName, currentE.getId(), id);

        // Handle additional images
        Product_imageDAO productImageDAO = new Product_imageDAO();
        ArrayList<String> detailImageNames = new ArrayList<>();
        for (Part part : request.getParts()) {
            if (part.getName().equals("detailImages")) {
                String detailImageName = getFileName(part);
                if (detailImageName != null && !detailImageName.isEmpty()) {
                    detailImageNames.add(detailImageName);
                    String uploadPathListImage = applicationPath.replace("build\\web", "") + "web" + File.separator + "Image" + File.separator + "Products" + File.separator + "ImgList";
                    // Xác thực tệp tin hình ảnh
                    try (InputStream fileContent = part.getInputStream()) {
                        if (ImageIO.read(fileContent) == null) {
                            response.sendRedirect("manageproducts?mess=Invalid image file.&alertType=danger");
                            return;
                        }
                        // Đặt lại InputStream
                        part = request.getPart("detailImages");
                    }

                    File detailImageFile = new File(uploadPathListImage + File.separator + detailImageName);

                    // Đổi tên tệp nếu đã tồn tại
                    if (detailImageFile.exists()) {
                        String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
                        String fileExtension = detailImageName.substring(detailImageName.lastIndexOf("."));
                        String fileNameWithoutExtension = detailImageName.substring(0, detailImageName.lastIndexOf("."));
                        detailImageName = fileNameWithoutExtension + "_" + timestamp + fileExtension;
                        detailImageFile = new File(uploadPath + File.separator + detailImageName);
                    }

                    try (InputStream detailFileContent = part.getInputStream()) {
                        Files.copy(detailFileContent, detailImageFile.toPath());
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        // Save new detail images to the database
        for (String detailImageName : detailImageNames) {
            productImageDAO.addProductImage(id, detailImageName);
        }
        session.setAttribute("listProduct", new ProductDAO().getAll());
        response.sendRedirect("manageproducts");
    }

    private void hiddenProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        new ProductDAO().hiddenProduct(Integer.parseInt(request.getParameter("id")));
        HttpSession session = request.getSession();
        session.setAttribute("listProduct", new ProductDAO().getAll());
        response.sendRedirect("manageproducts");
    }

    private void displayProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        new ProductDAO().displayProduct(Integer.parseInt(request.getParameter("id")));
        HttpSession session = request.getSession();
        session.setAttribute("listProduct", new ProductDAO().getAll());
        response.sendRedirect("manageproducts");
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("search").trim().replaceAll("\\s+", " ");
        HttpSession session = request.getSession();
        session.removeAttribute("listProduct");
        ArrayList<Product> result = searchProductsByString(new ProductDAO().getAll(), keyword);
        MyUtils.setAlertAttributes(request, !result.isEmpty(), "search " + result.size() + " results for '" + keyword + "'");
        //if nothing is found the return to the existed list
        session.setAttribute("listProduct", (result.isEmpty()) ? new ProductDAO().getAll() : result);

        String pageNumberParam = request.getParameter("pageNumber");
        //if pageNumber null then get selected page else return first page
        int pageNumber = pageNumberParam != null ? Integer.parseInt(pageNumberParam) : 1;
        int numberOfPages = (int) Math.ceil((double) result.size() / ItemsOfPage);

        List<Product_image> listImage = new Product_imageDAO().getAll();

        request.setAttribute("listImage", listImage);
        request.setAttribute("listProduct", MyUtils.getArrayListByPaging(result, pageNumber, ItemsOfPage));
        request.setAttribute("numberOfPage", numberOfPages);
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("Views/Employ/Staff/ManageProduct.jsp").forward(request, response);
    }

    private ArrayList<Product> searchProductsByString(ArrayList<Product> list, String keyword) {
        ArrayList<Product> result = new ArrayList<>();
        String[] keywords = MyUtils.convertKeywords(keyword);

        for (Product p : list) {
            if (MyUtils.containsKeywords(p.getName(), keywords)) {
                result.add(p);
            }
        }
        return result;
    }

    private void categoryFilter(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("productcate"));
        HttpSession session = request.getSession();
        ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("listProduct");
        list = (categoryId == 0) ? new ProductDAO().getAll() : new ProductDAO().getAllProductByCategory(categoryId);

        MyUtils.setAlertAttributes(request, !list.isEmpty(), "filter " + list.size() + " result(s)");
        session.setAttribute("listProduct", list);
        List<Product_image> listImage = new Product_imageDAO().getAll();

        String pageNumberParam = request.getParameter("pageNumber");
//if pageNumber null then get selected page else return first page
        int pageNumber = pageNumberParam != null ? Integer.parseInt(pageNumberParam) : 1;
        int numberOfPages = (int) Math.ceil((double) list.size() / ItemsOfPage);

        request.setAttribute("listImage", listImage);
        request.setAttribute("listProduct", MyUtils.getArrayListByPaging(list, pageNumber, ItemsOfPage));
        request.setAttribute("numberOfPage", numberOfPages);
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("currentCategoryId", categoryId);
        request.getRequestDispatcher("Views/Employ/Staff/ManageProduct.jsp?currentCategoryId=" + categoryId).forward(request, response);
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
