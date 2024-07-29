package controller.Staff;

import dal.BrandDAO;
import dal.ProductDAO;
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import model.Brand;
import model.Employee;
import util.MyUtils;

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
        HttpSession session = request.getSession();
        ArrayList<Brand> list = (ArrayList<Brand>) session.getAttribute("listBrand");
        String act = request.getParameter("act");
        list = (list == null || act != null) ? new BrandDAO().getAll() : list;//if list null then getAll products else keep the existed list
        session.setAttribute("listBrand", list);

        String pageNumberParam = request.getParameter("pageNumber");
//if pageNumber null then get selected page else return first page
        int pageNumber = pageNumberParam != null ? Integer.parseInt(pageNumberParam) : 1;
        int numberOfPages = (int) Math.ceil((double) list.size() / ItemsOfPage);
        request.setAttribute("listBrand", MyUtils.getArrayListByPaging(list, pageNumber, ItemsOfPage));
        request.setAttribute("numberOfPage", numberOfPages);
        request.setAttribute("pageNumber", pageNumber);
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

        if (logoFileName != null && !logoFileName.isEmpty()) {
            // Xác thực tệp tin hình ảnh
            try (InputStream fileContent = logoPart.getInputStream()) {
                if (ImageIO.read(fileContent) == null) {
                    response.sendRedirect("managebrand?mess=Invalid image file.&alertType=danger");
                    return;
                }
                // Đặt lại InputStream
                logoPart = request.getPart("logo");
            }

            File logoFile = new File(uploadPath + File.separator + logoFileName);

            if (logoFile.exists()) {
                String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
                String fileExtension = logoFileName.substring(logoFileName.lastIndexOf("."));
                String fileNameWithoutExtension = logoFileName.substring(0, logoFileName.lastIndexOf("."));
                logoFileName = fileNameWithoutExtension + "_" + timestamp + fileExtension;
                logoFile = new File(uploadPath + File.separator + logoFileName);
            }

            try (InputStream fileContent = logoPart.getInputStream()) {
                Files.copy(fileContent, logoFile.toPath());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            Thread.sleep(3000);
        } catch (InterruptedException ex) {
            Logger.getLogger(ManageBrand.class.getName()).log(Level.SEVERE, null, ex);
        }
        new BrandDAO().addBrand(name, logoFileName, link, currentE.getId());
        session.setAttribute("listBrand", new BrandDAO().getAll());
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
            // Xác thực tệp tin hình ảnh
            try (InputStream fileContent = logoPart.getInputStream()) {
                if (ImageIO.read(fileContent) == null) {
                    response.sendRedirect("managebrand?mess=Invalid image file.&alertType=danger");
                    return;
                }
                // Đặt lại InputStream
                logoPart = request.getPart("logo");
            }
            File logoFile = new File(uploadPath + File.separator + logoFileName);

            // Đổi tên tệp nếu đã tồn tại
            if (logoFile.exists()) {
                String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
                String fileExtension = logoFileName.substring(logoFileName.lastIndexOf("."));
                String fileNameWithoutExtension = logoFileName.substring(0, logoFileName.lastIndexOf("."));
                logoFileName = fileNameWithoutExtension + "_" + timestamp + fileExtension;
                logoFile = new File(uploadPath + File.separator + logoFileName);
            }
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
        session.setAttribute("listBrand", new BrandDAO().getAll());
        response.sendRedirect("managebrand");
    }

    private void hiddenBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        new BrandDAO().hiddenBrand(Integer.parseInt(request.getParameter("id")));
        HttpSession session = request.getSession();
        session.setAttribute("listBrand", new BrandDAO().getAll());
        session.setAttribute("listProduct", new ProductDAO().getAll());
        response.sendRedirect("managebrand");
//        request.getRequestDispatcher("Views/Employ/Staff/ProductsLists.jsp").forward(request, response);
    }

    private void displayBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        new BrandDAO().displayBrand(Integer.parseInt(request.getParameter("id")));
        session.setAttribute("listBrand", new BrandDAO().getAll());
        session.setAttribute("listProduct", new ProductDAO().getAll());
        response.sendRedirect("managebrand");
//        request.getRequestDispatcher("Views/Employ/Staff/ProductsLists.jsp").forward(request, response);
    }

    private void searchBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        HttpSession session = request.getSession();
        session.removeAttribute("listBrand");
        ArrayList<Brand> list = (ArrayList<Brand>) session.getAttribute("listBrand");

        ArrayList<Brand> result = searchBrandByString(new BrandDAO().getAll(), keyword);
        //if nothing is found the return to the existed list
        list = (result != null) ? result : list;
        MyUtils.setAlertAttributes(request, !result.isEmpty(), "search " + list.size() + " results for '" + keyword + "'");
        session.setAttribute("listBrand", list);

        String pageNumberParam = request.getParameter("pageNumber");
        //if pageNumber null then get selected page else return first page
        int pageNumber = pageNumberParam != null ? Integer.parseInt(pageNumberParam) : 1;
        int numberOfPages = (int) Math.ceil((double) list.size() / ItemsOfPage);

        request.setAttribute("keyword", keyword);
        request.setAttribute("numberOfPage", numberOfPages);
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("listBrand", MyUtils.getArrayListByPaging(list, pageNumber, ItemsOfPage));
        request.getRequestDispatcher("Views/Employ/Staff/ManageBrand.jsp").forward(request, response);
    }

    private ArrayList<Brand> searchBrandByString(ArrayList<Brand> list, String keyword) {
        ArrayList<Brand> result = new ArrayList<>();
        String[] keywords = MyUtils.convertKeywords(keyword);

        for (Brand p : list) {
            if (MyUtils.containsKeywords(p.getName(), keywords)) {
                result.add(p);
            }
        }
        return result;
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
