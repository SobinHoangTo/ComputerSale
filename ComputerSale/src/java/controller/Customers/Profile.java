package controller.Customers;

import controller.Staff.ManageBrand;
import dal.BrandDAO;
import dal.CustomerDAO;
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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;

@MultipartConfig(maxFileSize = 16 * 1024 * 1024)
public class Profile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        request.setAttribute("listBrand", new BrandDAO().getAll());

        if (action == null) {
            accountProfile(request, response);
        } else {
            switch (action) {
                case "edit" ->
                    editProfile(request, response);
                case "changepassword" ->
                    changePassword(request, response);
                default ->
                    accountProfile(request, response);
            }
        }
    }

    private void accountProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer profile = (Customer) session.getAttribute("currentCustomer");
        request.setAttribute("username", profile.getUsername());
        request.setAttribute("password", profile.getPassword());
        request.setAttribute("email", profile.getEmail());
        request.setAttribute("phone", profile.getPhone());
        request.setAttribute("address", profile.getAddress());
        request.setAttribute("fname", profile.getFirstname());
        request.setAttribute("lname", profile.getLastname());
        request.setAttribute("img", profile.getImg());
        request.setAttribute("reg_date", profile.getReg_date());
        request.getRequestDispatcher("Views/Customers/Profile.jsp").forward(request, response);
    }

    private void editProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer profile = (Customer) session.getAttribute("currentCustomer");
        int id = profile.getId();
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        Part imgPart = request.getPart("img");
        String imgFileName = getFileName(imgPart);

        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath.replace("build\\web", "") + "web" + File.separator + "Image" + File.separator + "Customers";

        if (imgFileName != null && !imgFileName.isEmpty()) {
            File logoFile = new File(uploadPath + File.separator + imgFileName);
            try (InputStream fileContent = imgPart.getInputStream()) {
                Files.copy(fileContent, logoFile.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            imgFileName = request.getParameter("existingImg");
        }

        try {
            Thread.sleep(3000);
        } catch (InterruptedException ex) {
            Logger.getLogger(ManageBrand.class.getName()).log(Level.SEVERE, null, ex);
        }
        boolean status = new CustomerDAO().editProfile(email, phone, address, fname, lname, imgFileName, id);

        if (status) {
            profile.setFirstname(fname);
            profile.setLastname(lname);
            profile.setEmail(email);
            profile.setPhone(phone);
            profile.setAddress(address);
            profile.setImg(imgFileName);
            session.setAttribute("currentCustomer", profile);
        }
        response.sendRedirect("profile?mess=" + (status ? "Edit Success" : "Edit Fail") + "&alertType=" + (status ? "success" : "danger"));
     }

    private void changePassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer profile = (Customer) session.getAttribute("currentCustomer");
        int id = profile.getId();
        String oldPassword = request.getParameter("old_password");
        String newPassword = request.getParameter("new_password");
        String confirmPassword = request.getParameter("confirm_password");

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("profile?mess=Failed to confirm Password.&alertType=danger");
            return;
        }

        if (new CustomerDAO().checkPassWord(oldPassword, id)) {
            if (oldPassword.equals(newPassword)) {
                response.sendRedirect("profile?mess=New password are current password.&alertType=danger");
                return;
            }
            new CustomerDAO().changePassword(id, newPassword);
            response.sendRedirect("profile?mess=Password is changed.&alertType=success");
        } else {
            response.sendRedirect("profile?mess=Wrong Password.&alertType=danger");
        }
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
