package controller.Staff;

import dal.BrandDAO;
import dal.EmployeeDAO;
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
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import javax.imageio.ImageIO;
import model.Employee;

@MultipartConfig(maxFileSize = 16 * 1024 * 1024)
public class EmployeeProfile extends HttpServlet {

    private static final Pattern NAME_PATTERN = Pattern.compile("^[A-Za-z]{2,20}$");
    private static final Pattern PHONE_PATTERN = Pattern.compile("^(09|03|07|08)\\d{8,9}$");
    private static final Pattern ADDRESS_PATTERN = Pattern.compile("^.{10,80}$");
    private static final Pattern PASSWORD_PATTERN = Pattern.compile("^(?=.*[A-Z])(?=.*[!@#$&*]).\\S{8,}$");

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
        Employee employeeprofile = (Employee) session.getAttribute("currentEmployee");
        request.setAttribute("username", employeeprofile.getUsername());
        request.setAttribute("password", employeeprofile.getPassword());
        request.setAttribute("email", employeeprofile.getEmail());
        request.setAttribute("phone", employeeprofile.getPhone());
        request.setAttribute("address", employeeprofile.getAddress());
        request.setAttribute("fname", employeeprofile.getFirstname());
        request.setAttribute("lname", employeeprofile.getLastname());
        request.setAttribute("img", employeeprofile.getImg());
        request.setAttribute("reg_date", employeeprofile.getReg_date());
        request.getRequestDispatcher("Views/Employ/Staff/EmployeeProfile.jsp").forward(request, response);
    }

    private void editProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Employee employeeprofile = (Employee) session.getAttribute("currentEmployee");
        int id = employeeprofile.getId();
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        Part imgPart = request.getPart("img");
        String imgFileName = getFileName(imgPart);

        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath.replace("build\\web", "") + "web" + File.separator + "Image" + File.separator + "Avatar" + File.separator + "Employee";

        // Tạo thư mục nếu không tồn tại
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) 
            uploadDir.mkdirs();
        
        if (imgFileName != null && !imgFileName.isEmpty()) {
            // Xác thực tệp tin hình ảnh
            try (InputStream fileContent = imgPart.getInputStream()) {
                if (ImageIO.read(fileContent) == null) {
                    response.sendRedirect("employeeprofile?mess=Invalid image file.&alertType=danger");
                    return;
                }
                imgPart = request.getPart("img");
            }

            File imgFile = new File(uploadPath + File.separator + imgFileName);

            // Đổi tên tệp nếu đã tồn tại
            if (imgFile.exists()) {
                String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
                String fileExtension = imgFileName.substring(imgFileName.lastIndexOf("."));
                String fileNameWithoutExtension = imgFileName.substring(0, imgFileName.lastIndexOf("."));
                imgFileName = fileNameWithoutExtension + "_" + timestamp + fileExtension;
                imgFile = new File(uploadPath + File.separator + imgFileName);
            }

            try (InputStream fileContent = imgPart.getInputStream()) {
                Files.copy(fileContent, imgFile.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            imgFileName = request.getParameter("existingImg");
        }

        try {
            Thread.sleep(6000);
        } catch (InterruptedException ex) {
            Logger.getLogger(EmployeeProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String errorMessage = null;
        if (!NAME_PATTERN.matcher(fname).matches()) {
            errorMessage = "First name must be 2-20 characters long and contain only text.";
        } else if (!NAME_PATTERN.matcher(lname).matches()) {
            errorMessage = "Last name must be 2-20 characters long and contain only text.";
        }else if (!PHONE_PATTERN.matcher(phone).matches()) {
            if (!phone.startsWith("09") && !phone.startsWith("03") && !phone.startsWith("07") && !phone.startsWith("08")) {
                errorMessage = "Phone number does not start with 09, 03, 07, or 08.";
            } else {
                errorMessage = "Phone number must be 10-11 digits long.";
            }
        } else if (!ADDRESS_PATTERN.matcher(address).matches()) {
            errorMessage = "Address must be 10-80 characters long.";
        }

        if (errorMessage != null) {
            response.sendRedirect("employeeprofile?mess=" + errorMessage + "&alertType=danger");
            return;
        }

        boolean status = new EmployeeDAO().editProfile(phone, address, fname, lname, imgFileName, id);
        
        if (status) {
            employeeprofile.setFirstname(fname);
            employeeprofile.setLastname(lname);
            employeeprofile.setPhone(phone);
            employeeprofile.setAddress(address);
            employeeprofile.setImg(imgFileName);
            session.setAttribute("currentEmployee", employeeprofile);
            response.sendRedirect("employeeprofile?mess=Change success&alertType=success");
        } else {
            response.sendRedirect("employeeprofile?mess=Edit Fail&alertType=danger");
        }
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Employee employeeprofile = (Employee) session.getAttribute("currentEmployee");
        int id = employeeprofile.getId();
        String oldPassword = request.getParameter("old_password");
        String newPassword = request.getParameter("new_password");
        String confirmPassword = request.getParameter("confirm_password");

        String errorMessage = null;
        if (!new EmployeeDAO().checkPassWord(oldPassword, id)) {
            errorMessage = "Wrong Password.";
        } else if (oldPassword.equals(newPassword)) {
            errorMessage = "New password is the same as the current password.";
        } else if (newPassword.length() < 8) {
            errorMessage = "Password is too short";
        } else if (!PASSWORD_PATTERN.matcher(newPassword).matches()) {
            errorMessage = "Pass must contain at least one uppercase letter and one special character.";
        } else if (!newPassword.equals(confirmPassword)) {
            errorMessage = "Failed to confirm Password.";
        }

        if (errorMessage != null) {
            response.sendRedirect("employeeprofile?mess=" + errorMessage + "&alertType=danger");
        } else {
            new EmployeeDAO().changePassword(id, newPassword);
            response.sendRedirect("employeeprofile?mess=Password is changed.&alertType=success");
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
