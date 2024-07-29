/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import model.*;

/**
 *
 * @author admin
 */
public class Order_detailDAO extends DBContext {

    private ArrayList<Order_detail> get(String value) {
        ArrayList<Order_detail> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [order_detail]  ";
            if (value != null && !value.isBlank()) {
                sql += " where " + value;
            }
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                list.add(getByRS(rs));
            }
            rs.close();
            pt.close();
        } catch (Exception a) {
            System.out.println(a.getMessage());
            return null;
        }
        return list;
    }

    protected Order_detail getByRS(ResultSet rs) throws SQLException {
        return new Order_detail(
                rs.getInt("id"),
                rs.getInt("serial_number_id"),
                rs.getInt("order_id"),
                rs.getInt("product_id"),
                rs.getInt("price")
        );
    }

    public Map<Integer, Product> getOrderProduct() {
        Map<Integer, Product> orderProductMap = new HashMap<>();
        try {
            String sql = "SELECT od.id as order_detail_id, p.* FROM order_detail od JOIN product p ON od.product_id = p.id";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();

            while (rs.next()) {
                int orderDetailId = rs.getInt("order_detail_id");
                Product p = new ProductDAO().getByRS(rs);
                orderProductMap.put(orderDetailId, p);
            }
            rs.close();
            pt.close();
        } catch (SQLException e) {
            System.out.println("Error fetching order details with product: " + e.getMessage());
            return null; // Handle exception gracefully in your application
        }
        return orderProductMap;
    }

    public Map<Integer, ArrayList<Order_detail>> getOrderOrderDetails() {
        Map<Integer, ArrayList<Order_detail>> orderDetailMap = new HashMap<>();
        try {
            String sql = "SELECT * FROM order_detail";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();

            while (rs.next()) {
                Order_detail od = getByRS(rs); // Assuming getByRS(rs) retrieves an Order_detail object
                int orderId = od.getOrder_id(); // Replace with actual method to get order ID

                // Retrieve or initialize the list of order details for the current order ID
                ArrayList<Order_detail> orderDetails = orderDetailMap.getOrDefault(orderId, new ArrayList<>());
                orderDetails.add(od); // Add the current order detail to the list
                orderDetailMap.put(orderId, orderDetails); // Update the map with the list of order details
            }

            rs.close();
            pt.close();
        } catch (SQLException e) {
            System.out.println("Error fetching order details: " + e.getMessage());
            return null; // Handle exception gracefully in your application
        }

        return orderDetailMap;
    }

    public Map<Integer, Integer> getOrderTotal() {
        Map<Integer, Integer> orderDetailMap = new HashMap<>();
        try {
            String sql = "select order_id, sum(price) as sum from order_detail\n"
                    + "group by order_id ";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("order_id");
                int sum = rs.getInt("sum");

                // Retrieve or initialize the list of order details for the current order ID
                orderDetailMap.put(id, sum); // Update the map with the list of order details
            }

            rs.close();
            pt.close();
        } catch (SQLException e) {
            System.out.println("Error fetching order details: " + e.getMessage());
            return null; // Handle exception gracefully in your application
        }

        return orderDetailMap;
    }

    public ArrayList<Order_detail> getAllOrderDetail() {
        return get(null);
    }

    public void add(int serialNumberID, int orderID, int productID, int price) {
        try {
            String sql = "insert into order_detail([serial_number_id],[order_id],[product_id],[price]) values(?,?,?,?)";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, serialNumberID);
            pt.setInt(2, orderID);
            pt.setInt(3, productID);
            pt.setInt(4, price);
            pt.executeUpdate();
            pt.close();
        } catch (SQLException e) {
            System.out.println("Error fetching order details: " + e.getMessage());
        }

    }
    public Order_detail getById(int id) {
        ArrayList<Order_detail> temp = get("id=" + id);
        return temp.isEmpty() ? null : temp.get(0);
    }
    
        public ArrayList<Order_detail> getByOrderID(int orderid) {
        return get("order_id =" + orderid);
    }
    

    public static void main(String[] args) {
//        Map<Integer, ArrayList<Order_detail>> hashMap = new Order_detailDAO().getOrderOrderDetails();
//        for (Map.Entry<Integer, ArrayList<Order_detail>> entry : hashMap.entrySet()) {
//            Object key = entry.getKey();
//           ArrayList<Order_detail> val = entry.getValue();
//            System.out.println(key);
//            for (Order_detail o : val) {
//                System.out.println(o.toString()+"\n");
//            }
//            
//        }
        System.out.println(new Order_detailDAO().getOrderTotal());

    }
}
