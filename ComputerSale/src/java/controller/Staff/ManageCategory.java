package controller.Staff;

import dal.CategoryDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Employee;

public class ManageCategory extends HttpServlet {

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
            listCategory(request, response);
        } else {
            switch (action) {
                case "add" ->
                    addCategory(request, response);
                case "edit" ->
                    editCategory(request, response);
                case "delete" ->
                    deleteCategory(request, response);
                case "search" ->
                    searchCategory(request, response);
                case "hidden" ->
                    hiddenCategory(request, response);
                case "display" ->
                    displayCategory(request, response);
                default ->
                    listCategory(request, response);
            }
        }
    }

    private void listCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("listCategory", new CategoryDAO().getAll());
        request.getRequestDispatcher("Views/Employ/Staff/ManageCategory.jsp").forward(request, response);
    }

    private void addCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Employee currentE = (Employee) session.getAttribute("currentEmployee");
        String name = request.getParameter("name");
        new CategoryDAO().addCategory(name, currentE.getId());
        response.sendRedirect("managecategory");
    }

    private void editCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Employee currentE = (Employee) session.getAttribute("currentEmployee");
        String name = request.getParameter("name");
        int id = Integer.parseInt(request.getParameter("id"));
        new CategoryDAO().editCategory(name, currentE.getId(), id);
        response.sendRedirect("managecategory");
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        new CategoryDAO().deleteCategory(Integer.parseInt(request.getParameter("id")));
        response.sendRedirect("managecategory");
    }

    private void hiddenCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        new CategoryDAO().hiddenCategory(Integer.parseInt(request.getParameter("id")));
        response.sendRedirect("managecategory");
//        request.getRequestDispatcher("Views/Employ/Staff/ProductsLists.jsp").forward(request, response);
    }
    
    private void displayCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        new CategoryDAO().displayCategory(Integer.parseInt(request.getParameter("id")));
        response.sendRedirect("managecategory");
//        request.getRequestDispatcher("Views/Employ/Staff/ProductsLists.jsp").forward(request, response);
    }

    private void searchCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("search").trim().replaceAll("\\s+", " ");
        request.setAttribute("listCategory", new CategoryDAO().searchCategoryByKeyWord(keyword));
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("Views/Employ/Staff/ManageCategory.jsp").forward(request, response);
    }
}
