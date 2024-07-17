package controller.Staff;

import dal.BrandDAO;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brand;
import model.Employee;

@MultipartConfig(maxFileSize = 16 * 1024 * 1024)
public class ManageBrand extends HttpServlet {

    private final int ItemsOfPage = 5;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            listBrand(request, response);
        } else {
            switch (action) {
                case "add" ->
                    addBrand(request, response);
                case "edit" ->
                    editBrand(request, response);
                case "delete" ->
                    deleteBrand(request, response);
                case "search" ->
                    searchBrand(request, response);
                case "hidden" ->
                    hiddenBrand(request, response);
                case "display" ->
                    displayBrand(request, response);
                default ->
                    listBrand(request, response);
            }
        }
    }

    private void listBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int page = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            page = Integer.parseInt(pageParam);
        }
        int totalBrand = new BrandDAO().getNumberOfBrand();
        int numberOfPages = (int) Math.ceil((double) totalBrand / ItemsOfPage);
        List<Brand> listBrand = new BrandDAO().getBrandByPage(page, ItemsOfPage);
        request.setAttribute("listBrand", listBrand);
        request.setAttribute("endPage", numberOfPages);
        request.setAttribute("currentPage", page);
        request.getRequestDispatcher("Views/Employ/Staff/ManageBrand.jsp").forward(request, response);
    }

    private void addBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        Part logoPart = request.getPart("logo");
        String link = request.getParameter("link");
        HttpSession session = request.getSession();
        Employee currentE = (Employee) session.getAttribute("currentEmployee");
        String logoFileName = getFileName(logoPart);

        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath.replace("build\\web", "") + "web" + File.separator + "Image" + File.separator + "Brands";
        File logoFile = new File(uploadPath + File.separator + logoFileName);

        try (InputStream fileContent = logoPart.getInputStream()) {
            Files.copy(fileContent, logoFile.toPath());
        }

        try {
            Thread.sleep(3000);
        } catch (InterruptedException ex) {
            Logger.getLogger(ManageBrand.class.getName()).log(Level.SEVERE, null, ex);
        }
        new BrandDAO().addBrand(name, logoFileName, link, currentE.getId());
        response.sendRedirect("managebrand");
    }

    private void editBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        Part logoPart = request.getPart("logo");
        String link = request.getParameter("link");
        HttpSession session = request.getSession();
        Employee currentE = (Employee) session.getAttribute("currentEmployee");
        int id = Integer.parseInt(request.getParameter("id"));

        String logoFileName = getFileName(logoPart);

        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath.replace("build\\web", "") + "web" + File.separator + "Image" + File.separator + "Brands";

        if (logoFileName != null && !logoFileName.isEmpty()) {
            File logoFile = new File(uploadPath + File.separator + logoFileName);
            try (InputStream fileContent = logoPart.getInputStream()) {
                Files.copy(fileContent, logoFile.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            logoFileName = request.getParameter("existingLogo");
        }

        try {
            Thread.sleep(3000);
        } catch (InterruptedException ex) {
            Logger.getLogger(ManageBrand.class.getName()).log(Level.SEVERE, null, ex);
        }
        new BrandDAO().editBrandById(name, logoFileName, link, currentE.getId(), id);
        response.sendRedirect("managebrand");
    }

    private void deleteBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        new BrandDAO().deleteBrand(id);
        response.sendRedirect("managebrand");
    }

    private void hiddenBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        new BrandDAO().hiddenBrand(Integer.parseInt(request.getParameter("id")));
        response.sendRedirect("managebrand");
//        request.getRequestDispatcher("Views/Employ/Staff/ProductsLists.jsp").forward(request, response);
    }

    private void displayBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        new BrandDAO().displayBrand(Integer.parseInt(request.getParameter("id")));
        response.sendRedirect("managebrand");
//        request.getRequestDispatcher("Views/Employ/Staff/ProductsLists.jsp").forward(request, response);
    }

    private void searchBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pageParam = request.getParameter("page");
        String keyword = request.getParameter("keyword");
//                .trim().replaceAll("\\s+", " ");
        int page = Integer.parseInt(pageParam);

        int totalBrand = new BrandDAO().getNumBrandBySearch(keyword);
        int numberOfPageSearch = (int) Math.ceil((double) totalBrand / ItemsOfPage);


        //        request.setAttribute("listBrand", new BrandDAO().searchBrandByKeyWord(keyword));
        List<Brand> listSearch = new BrandDAO().searchBrandByKeyWord(keyword, page, ItemsOfPage);
        request.setAttribute("keyword", keyword);
        request.setAttribute("endPage", numberOfPageSearch);
        request.setAttribute("listBrand", listSearch);
        request.setAttribute("currentPage", page);
        request.getRequestDispatcher("Views/Employ/Staff/ManageBrand.jsp").forward(request, response);
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
