/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Admin;

import dal.CategoryDAO;
import dal.DAOJoin;
import dal.OrderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import model.Category;

/**
 *
 * @author Admin
 */
public class AdminDashboard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int totalSale = new OrderDAO().getTotalSales();
        ArrayList<String> last10Day = new ArrayList<>();
        ArrayList<Integer> lineData = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            LocalDate temp = LocalDate.now().minusDays(9 - i);
            int todaySale = new OrderDAO().getTotalSalesByDay(temp.toString());
            System.out.println(todaySale);
            lineData.add(todaySale);
            String day = temp.getDayOfMonth() < 10 ? "0" + temp.getDayOfMonth() : "" + temp.getDayOfMonth();
            String month = temp.getMonthValue() < 10 ? "0" + temp.getMonthValue() : "" + temp.getMonthValue();
            last10Day.add("'" + day + "/" + month + "'");
        }
        HashMap<String, Integer> chart = new HashMap<>();
        int otherData = 0;
        for (Category i : new CategoryDAO().getAll()) {
            if (chart.size() < 4) {
                chart.put("'" + i.getName() + "'", new DAOJoin().getNumberOfProductsSoldByCategory(i.getId()));
            } else {
                otherData += new DAOJoin().getNumberOfProductsSoldByCategory(i.getId());
            }
        }
        HashMap<String,Integer> newChart = sortValues(chart);
        newChart.put("'Other'", otherData);
        request.setAttribute("category", newChart.keySet());
        request.setAttribute("chartData", newChart.values());
        request.setAttribute("productRateList", new DAOJoin().getProductRate());
        request.setAttribute("orderList", new DAOJoin().getOrderAdminStatistic());
        request.setAttribute("todaySold", new DAOJoin().getNumberProductSoldByDay(LocalDate.now().toString()));
        request.setAttribute("totalSold", new DAOJoin().getTotalNumberProductSold());
        request.setAttribute("totalSale", totalSale);
        request.setAttribute("lineData", lineData);
        request.setAttribute("last10Day", last10Day);
        
        
        int type = request.getParameter("type")==null?1:Integer.parseInt(request.getParameter("type"));
        request.setAttribute("productQualityList", new DAOJoin().getProductQuality(type));
        
        
        request.getRequestDispatcher("Views/Employ/Admin/Viewstatistic.jsp").forward(request, response);
    }

    private static HashMap sortValues(HashMap map) {
        List list = new LinkedList(map.entrySet());
//Custom Comparator  
        Collections.sort(list, (Object o1, Object o2) -> ((Comparable) ((Map.Entry) (o2)).getValue()).compareTo(((Map.Entry) (o1)).getValue()));
//copying the sorted list in HashMap to preserve the iteration order  
        HashMap sortedHashMap = new LinkedHashMap();
        for (Iterator it = list.iterator(); it.hasNext();) {
            Map.Entry entry = (Map.Entry) it.next();
            sortedHashMap.put(entry.getKey(), entry.getValue());
        }
        return sortedHashMap;
    }

}
