/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package email;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.Employee;
import util.MyUtils;

/**
 *
 * @author vdqvi
 */
@WebServlet(name = "SendEmail", urlPatterns = {"/sendmail"})
public class SendEmail extends HttpServlet {

    private final String verifyHeader = "Confirm your email address with the code below";
    private final String forgetPassHeader = "Here is your new password";
    private final String verifySubject = "Confirm email address";
    private final String forgetPassSubject = "New Password";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int type = (Integer) request.getAttribute("type");
        String email = request.getParameter("email");
        String emailContent;
        String message;
        switch (type) {
            case 1:
                emailContent = readEmailTemplate("/Views/FormSendEmail.html");
                String code = MyUtils.genCode(6);
                session = request.getSession();
                session.setAttribute("code", MyUtils.getMd5(code));
                emailContent = emailContent.replace("{Code}", code);
                emailContent = emailContent.replace("{Header}", verifyHeader);
                emailContent = emailContent.replace("{Content}", "Code:");
                message = new EmailUtility().sendMail(email, verifySubject, emailContent, true);
                response.sendRedirect("Views/Account/ConfirmCode.jsp" + "?message=" + message);
                return;
            case 2:
                emailContent = readEmailTemplate("/Views/FormSendEmail.html");
                String newPass = (String)request.getAttribute("newPass");
                emailContent = emailContent.replace("{Code}", newPass);
                emailContent = emailContent.replace("{Header}", forgetPassHeader);
                emailContent = emailContent.replace("{Content}", "Your new password:");
                message = new EmailUtility().sendMail(email, forgetPassSubject, emailContent, true);
                response.sendRedirect("login" + "?message=" + message);
                return;
            case 3:
                Employee e = (Employee)session.getAttribute("currentEmployee");
                ArrayList<String> temp = (ArrayList<String>)request.getAttribute("info");
                emailContent = readEmailTemplate("/Views/FormWarranty.html");
                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                Date date  =new Date(temp.get(0));
                emailContent = emailContent.replace("{warrantyDate}", formatter.format(date));
                emailContent = emailContent.replace("{customerName}", temp.get(1));
                emailContent = emailContent.replace("{customerPhone}", temp.get(2));
                emailContent = emailContent.replace("{employeeName}", e.getFirstname()+" "+e.getLastname());
                emailContent = emailContent.replace("{employeeEmail}", e.getEmail());
                emailContent = emailContent.replace("{expectedDate}", formatter.format(date));
                emailContent = emailContent.replace("{productList}", "<tr>\n"
                        + "                        <td>" + temp.get(3) + "</td>\n"
                        + "                        <td>" + temp.get(4) + "</td>\n"
                        + "                        <td>" + "Nguyên vẹn" + "</td>\n"
                        + "                        <td>" + "" + "</td>\n"
                        + "                        <td>" + 12 + "</td>\n"
                        + "                        <td>" + "Trong thời hạn" + "</td>\n"
                        + "                    </tr>");
                message = new EmailUtility().sendMail(temp.get(5), "Warranty Accepted", emailContent, true);
                return;
            case 4:
                return;
            default:
                break;
        }
        response.sendRedirect("login");
    }

    private String readEmailTemplate(String filePath) throws IOException {
        InputStream inputStream = getServletContext().getResourceAsStream(filePath);
        if (inputStream == null) {
            throw new IOException("File not found: " + filePath);
        }

        StringBuilder content = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                content.append(line).append("\n");
            }
        }
        return content.toString();
    }

}
