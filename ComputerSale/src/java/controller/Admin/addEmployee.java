package controller.Admin;

import dal.EmployeeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Employee;

public class addEmployee extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/Employ/Manager/AddEmployee.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String page = request.getParameter("page");
        String username = request.getParameter("addusername");
        String password = "123";  // This should be hashed and managed securely in a real application
        String email = request.getParameter("addemail");
        String phone = request.getParameter("addphone");
        String address = request.getParameter("addaddress");
        String dob = request.getParameter("adddob"); // Assuming date of birth is a required field

        EmployeeDAO employeeDAO = new EmployeeDAO();

        if (employeeDAO.checkSignUp(username, email)) {//default role account ==3, staff
            Employee newEmployee = new Employee(0, username, password, email, phone, address, "", "", "", email, 3, 1);
            boolean status = employeeDAO.addEmployee(newEmployee);
            request.setAttribute("alertMessage", status ? "Added successfully." : "An error occurred while adding the employee.");
            request.setAttribute("alertType", status ? "success" : "danger");

        } else {
            request.setAttribute("alertMessage", "Username or email already exists. Add failed!");
            request.setAttribute("alertType", "danger");
        }

        if (page == null || page.isEmpty()) {
            doGet(request, response);
        } else {
            request.getRequestDispatcher("manageaccount").forward(request, response);
        }
    }
}
