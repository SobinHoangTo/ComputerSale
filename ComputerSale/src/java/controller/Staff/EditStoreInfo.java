package controller.Staff;

import dal.NewsDAO;
import dal.News_categoryDAO;
import model.News;
import model.Employee;
import util.MyUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;

public class EditStoreInfo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetch the categories
        request.setAttribute("categoryList", new News_categoryDAO().getAll());

        // Fetch news if editing
        String newsId = request.getParameter("newsid");
        if (newsId != null) {
            try {
                News news = new NewsDAO().getNewsByID(Integer.parseInt(newsId));
                if (news != null) {
                    // Assuming news details are stored in a single string
                    String newsDetail = news.getNews_detail(); // Get the full news details as a single string

                    // Parse the details to extract address, phone, and email
                    String address = "";
                    String phone = "";
                    String email = "";

                    // Assuming the details are stored in the following format:
                    // "Store Address: <address><br>Phone: <phone><br>Email: <email>"
                    if (newsDetail != null && !newsDetail.isEmpty()) {
                        String[] detailsArray = newsDetail.split("<br>");
                        for (String detail : detailsArray) {
                            if (detail.startsWith("Store Address: ")) {
                                address = detail.substring("Store Address: ".length());
                            } else if (detail.startsWith("Phone: ")) {
                                phone = detail.substring("Phone: ".length());
                            } else if (detail.startsWith("Email: ")) {
                                email = detail.substring("Email: ".length());
                            }
                        }
                    }

                    request.setAttribute("address", address);
                    request.setAttribute("phone", phone);
                    request.setAttribute("email", email);
                    request.setAttribute("news", news);
                } else {
                    request.setAttribute("alertMessage", "News item not found.");
                    request.setAttribute("alertType", "danger");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("alertMessage", "Invalid news ID format.");
                request.setAttribute("alertType", "danger");
            }
        }

        request.getRequestDispatcher("Views/Employ/Staff/EditStoreDetails.jsp?newsid=" + newsId).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action_raw = request.getParameter("action");
        boolean status = false;
        int action = Integer.parseInt(action_raw);
        News news = parseParameter(request, response);
        if (action == 1) {
            status = new NewsDAO().updateNews(news);
        }
        MyUtils.setAlertAttributes(request, status, "update store infomation");

        doGet(request, response);
    }

    private News parseParameter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String title = "Store information";
        String shortDescription = "Contains email, phone and address";
        HttpSession session = request.getSession();
        Employee currentE = (Employee) session.getAttribute("currentEmployee");

        int id = Integer.parseInt(idStr);
        int newsCategoryId = 2;
        int status = 1;

        // Use newsDetail to store the store information
        String fullNewsDetail = "Store Address: " + request.getParameter("address") + "<br>"
                + "Phone: " + request.getParameter("phone") + "<br>"
                + "Email: " + request.getParameter("email");

        return new News(id, title, shortDescription, LocalDate.now().toString(), currentE.getId(), fullNewsDetail, newsCategoryId, status);
    }
}
