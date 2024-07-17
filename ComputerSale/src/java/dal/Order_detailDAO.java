package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import model.Order_detail;
import model.Product;

public class Order_detailDAO extends DBContext {

    private ArrayList<Order_detail> get(String value) {
        ArrayList<Order_detail> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [order_detail]";
            if (value != null && !value.isBlank()) {
                sql += " WHERE " + value;
            }
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                list.add(getByRS(rs));
            }
            rs.close();
            pt.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
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
            String sql = "SELECT od.id AS order_detail_id, p.* FROM order_detail od JOIN product p ON od.product_id = p.id";
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
            return null;
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
                Order_detail od = getByRS(rs);
                int orderId = od.getOrder_id();
                ArrayList<Order_detail> orderDetails = orderDetailMap.getOrDefault(orderId, new ArrayList<>());
                orderDetails.add(od);
                orderDetailMap.put(orderId, orderDetails);
            }
            rs.close();
            pt.close();
        } catch (SQLException e) {
            System.out.println("Error fetching order details: " + e.getMessage());
            return null;
        }
        return orderDetailMap;
    }

    public ArrayList<Order_detail> getAllOrderDetail() {
        return get(null);
    }

    public void add(int serialNumberID, int orderID, int productID, int price) {
        try {
            String sql = "INSERT INTO order_detail(serial_number_id, order_id, product_id, price) VALUES(?, ?, ?, ?)";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, serialNumberID);
            pt.setInt(2, orderID);
            pt.setInt(3, productID);
            pt.setInt(4, price);
            pt.executeUpdate();
            pt.close();
        } catch (SQLException e) {
            System.out.println("Error adding order details: " + e.getMessage());
        }
    }

    public Order_detail getById(int id) {
        ArrayList<Order_detail> temp = get("id=" + id);
        return temp.isEmpty() ? null : temp.get(0);
    }

    public ArrayList<Order_detail> getByOrderID(int orderid) {
        return get("order_id =" + orderid);
    }
}
