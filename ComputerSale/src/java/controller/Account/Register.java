package controller.Account;

import dal.CustomerDAO;
import dal.EmployeeDAO;
import java.io.IOException;
import java.util.regex.Pattern;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Register extends HttpServlet {

    private static final Pattern NAME_PATTERN = Pattern.compile("^[A-Za-z]{2,20}$");
    private static final Pattern PHONE_PATTERN = Pattern.compile("^(09|03|07|08)\\d{8}$");
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[\\w\\.-]+@[\\w\\.-]+\\.\\w{2,}$");
    private static final Pattern ADDRESS_PATTERN = Pattern.compile("^.{10,80}$");
    private static final Pattern PASSWORD_PATTERN = Pattern.compile("^(?=.*[A-Z])(?=.*[!@#$&*?])\\S{8,}$");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/Account/Register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String checkPass = request.getParameter("checkPass");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String error = null;

        if (!new CustomerDAO().checkSignUp(username, email) || !new EmployeeDAO().checkSignUp(username, email)) {
            error = "Username or email already exists!";
        } else if (!EMAIL_PATTERN.matcher(email).matches()) {
            error = "Invalid email format.";
        } else if (password.length() < 8) {
            error = "Password is too short";
        } else if (!PASSWORD_PATTERN.matcher(password).matches()) {
            error = "Password cannot contain spaces and must have at least one uppercase letter and one special character!";
        } else if (!password.equals(checkPass)) {
            error = "Failed to confirm password.";
        } else if (!PHONE_PATTERN.matcher(phone).matches()) {
            error = "Phone number must start with 09, 03, 07, or 08 and be 10 digits long.";
        } else if (!ADDRESS_PATTERN.matcher(address).matches()) {
            error = "Address must be 10-80 characters long.";
        } else if (!NAME_PATTERN.matcher(firstname).matches()) {
            error = "First name must be 2-20 characters long and contain only letters.";
        } else if (!NAME_PATTERN.matcher(lastname).matches()) {
            error = "Last name must be 2-20 characters long and contain only letters.";
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("email", email);
            session.setAttribute("password", password);
            session.setAttribute("phone", phone);
            session.setAttribute("address", address);
            session.setAttribute("firstname", firstname);
            session.setAttribute("lastname", lastname);
            request.setAttribute("type", 1);
            request.setAttribute("email", email);
            request.getRequestDispatcher("sendmail").forward(request, response);
            return;
        }

        request.setAttribute("error", error);
        request.getRequestDispatcher("Views/Account/Register.jsp").forward(request, response);
    }
}