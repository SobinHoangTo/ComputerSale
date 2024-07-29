package controller.Staff;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Brand;
import model.Category;
import model.Employee;
import util.MyUtils;

public class ManageCategory extends HttpServlet {

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
            listCategory(request, response);
        } else {
            switch (action) {
                case "add" ->
                    addCategory(request, response);
                case "edit" ->
                    editCategory(request, response);
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
        HttpSession session = request.getSession();
        String act = request.getParameter("act");
        ArrayList<Category> list = (ArrayList<Category>) session.getAttribute("listCategory");
        list = (list == null || act != null) ? new CategoryDAO().getAll() : list;
        session.setAttribute("listCategory", list);
        
        String pageNumberParam = request.getParameter("pageNumber");
        //if pageNumber null then get selected page else return first page
        int pageNumber = pageNumberParam != null ? Integer.parseInt(pageNumberParam) : 1;
        int numberOfPages = (int) Math.ceil((double) list.size() / ItemsOfPage);

        request.setAttribute("numberOfPage", numberOfPages);
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("listCategory", MyUtils.getArrayListByPaging(list, pageNumber, ItemsOfPage));
        request.getRequestDispatcher("Views/Employ/Staff/ManageCategory.jsp").forward(request, response);
    }

    private void addCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Employee currentE = (Employee) session.getAttribute("currentEmployee");
        String name = request.getParameter("name");
        new CategoryDAO().addCategory(name, currentE.getId());
        session.setAttribute("listCategory", new CategoryDAO().getAll());
        response.sendRedirect("managecategory");
    }

    private void editCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Employee currentE = (Employee) session.getAttribute("currentEmployee");
        String name = request.getParameter("name");
        int id = Integer.parseInt(request.getParameter("id"));
        new CategoryDAO().editCategory(name, currentE.getId(), id);
        session.setAttribute("listCategory", new CategoryDAO().getAll());
        response.sendRedirect("managecategory");
    }

    private void hiddenCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        new CategoryDAO().hiddenCategory(Integer.parseInt(request.getParameter("id")));
        HttpSession session = request.getSession();
        session.setAttribute("listCategory", new CategoryDAO().getAll());
        session.setAttribute("listProduct", new ProductDAO().getAll());
        response.sendRedirect("managecategory");
//        request.getRequestDispatcher("Views/Employ/Staff/ProductsLists.jsp").forward(request, response);
    }

    private void displayCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        new CategoryDAO().displayCategory(Integer.parseInt(request.getParameter("id")));
        HttpSession session = request.getSession();
        session.setAttribute("listCategory", new CategoryDAO().getAll());
        session.setAttribute("listProduct", new ProductDAO().getAll());
        response.sendRedirect("managecategory");
//        request.getRequestDispatcher("Views/Employ/Staff/ProductsLists.jsp").forward(request, response);
    }

    private void searchCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("search").trim().replaceAll("\\s+", " ");
        HttpSession session = request.getSession();
        session.removeAttribute("listCategory");
        ArrayList<Category> list = (ArrayList<Category>) session.getAttribute("listCategory");

        ArrayList<Category> result = new CategoryDAO().searchCategoryByKeyWord(keyword);
        //if nothing is found the return to the existed list
        list = (result != null) ? result : list;
        MyUtils.setAlertAttributes(request, !result.isEmpty(), "search " + list.size() + " results for '" + keyword + "'");
        session.setAttribute("listCategory", list);

        String pageNumberParam = request.getParameter("pageNumber");
        //if pageNumber null then get selected page else return first page
        int pageNumber = pageNumberParam != null ? Integer.parseInt(pageNumberParam) : 1;
        int numberOfPages = (int) Math.ceil((double) list.size() / ItemsOfPage);

        request.setAttribute("numberOfPage", numberOfPages);
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("listCategory", MyUtils.getArrayListByPaging(list, pageNumber, ItemsOfPage));
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("Views/Employ/Staff/ManageCategory.jsp").forward(request, response);
    }
}
