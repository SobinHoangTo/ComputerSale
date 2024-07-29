package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.*;
import util.MyUtils;

public class OrderDAO extends DBContext {

    private ArrayList<Order> get(String value) {
        ArrayList<Order> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [order]  ";
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

    public Map<Order, Order_detail> getOrderOrderD() {
        Map<Order, Order_detail> list = new HashMap<>();
        try {
            String sql = "select * from [order] o join order_detail od on o.id=od.order_id order by o.id";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Order o = new OrderDAO().getByRS(rs);
                Order_detail od = new Order_detailDAO().getByRS(rs);
                list.put(o, od);
            }
            rs.close();
            pt.close();
        } catch (Exception a) {
            System.out.println(a.getMessage());
            return null;
        }
        return list;
    }

    public Map<Order, List<Order_detail>> searchOrderOrderDetails(int orderID) {
        Map<Order, List<Order_detail>> orderDetailsMap = new HashMap<>();
        try {
            String sql = "select * from [order] o join order_detail od on o.id = od.order_id  where o.id= ?";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, orderID);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Order o = new OrderDAO().getByRS(rs);
                Order_detail od = new Order_detailDAO().getByRS(rs);

                // Check if the order already exists in the map
                if (orderDetailsMap.containsKey(o)) {
                    // If yes, get the list of order details and add the new one
                    List<Order_detail> orderDetailsList = orderDetailsMap.get(o);
                    orderDetailsList.add(od);
                } else {
                    // If no, create a new list and put it in the map
                    List<Order_detail> orderDetailsList = new ArrayList<>();
                    orderDetailsList.add(od);
                    orderDetailsMap.put(o, orderDetailsList);
                }
            }
            rs.close();
            pt.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        return orderDetailsMap;
    }

    private Order getByRS(ResultSet rs) throws SQLException {
        return new Order(rs.getInt("id"),
                rs.getInt("customer_id"),
                rs.getString("note"),
                rs.getString("address"),
                rs.getString("phone"),
                rs.getString("order_date"),
                rs.getString("paid_date"),
                rs.getInt("order_status"),
                rs.getInt("verified_by"),
                rs.getString("verified_on"));
    }

    public boolean updateStatus(int status, int verify_by, int id) {
        try {
            String sql = "UPDATE [dbo].[order]\n"
                    + "	SET [order_status] = ?\n"
                    + "		,[verified_by] = ?\n"
                    + "		,[verified_on] = ?\n"
                    + "	WHERE id=?";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, status);
            pt.setInt(2, verify_by);
            pt.setString(3, LocalDate.now().toString());
            pt.setInt(4, id);
            return (pt.executeUpdate() > 0);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public int getTotalSalesByDay(String day) {
        try {
            String sql = """
                        select SUM(od.price) as price from [order] o join
                                                order_detail od on o.id = od.order_id
                                                where o.order_date = ? and o.order_status>=3""";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, day);
            ResultSet rs = pt.executeQuery();
            if (rs.next()) {
                return rs.getInt("price");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
        return 0;
    }

    public int getTotalSales() {
        try {
            String sql = """
                        select SUM(od.price) as price from [order] o join
                                                order_detail od on o.id = od.order_id
                                                where o.order_status>=3""";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            if (rs.next()) {
                return rs.getInt("price");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
        return 0;
    }

    public int getTotalSales(int orderID) {
        int totalSales = 0;
        try {
            String sql = """
                     select o.id, sum(od.price) as totalPrice from [order] o join
                     order_detail od on o.id = od.order_id
                     where o.id = ?
                     group by o.id""";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, orderID);
            ResultSet rs = pt.executeQuery();

            if (rs.next()) {
                totalSales = rs.getInt("totalPrice");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return totalSales;
    }

    public void updatePaid_date(int id) {
        try {
            String sql = """
                         UPDATE [dbo].[order]
                         SET [paid_date] = ?, verified_on = ?, order_status = 3
                         WHERE id=?""";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, LocalDate.now().toString());
            pt.setString(2, LocalDate.now().toString());
            pt.setInt(3, id);
            pt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<Order> getAllOrders() {
        return get(null);
    }

    public ArrayList<Order> getCustomerOrder(int customerid) {
        return get("[customer_id] = " + customerid);
    }

    public ArrayList<Order> getOrders() { //orders has orders deetails
        return get("paid_date is not null and id in (select od.order_id  from order_detail od) order by id desc");
    }

    public ArrayList<Order> searchByOrderStatus(int order_status) { //orders has orders deetails
        return get("order_status = " + order_status);
    }

    public ArrayList<Order> getAllOrdersSortByDate() {
        return get("order by order_date desc");
    }

    private int getMaxID() {
        try {
            String sql = "select max(id) as id from [order]";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public int addOrder(int customerID, int phone, String adrress, String note) {
        try {
            String sql = "insert into [order](customer_id,phone,address,note,order_date,order_status) values(?,?,?,?,?,?)";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, customerID);
            pt.setInt(2, phone);
            pt.setString(3, adrress);
            pt.setString(4, note);
            pt.setString(5, LocalDate.now().toString());
            pt.setInt(6, 1);
            pt.executeUpdate();
            return getMaxID();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public Order getById(int id) {
        return get("id = " + id).get(0);
    }

    public static void main(String[] args) {

        Map<Order, List<Order_detail>> orderDetailsMap = new OrderDAO().searchOrderOrderDetails(2);
        orderDetailsMap = MyUtils.sortMap(orderDetailsMap, Comparator.comparingInt(Order::getId).reversed());
        if (orderDetailsMap == null) {
            System.out.println("Failed to retrieve order details.");
            return;
        }

        for (Map.Entry<Order, List<Order_detail>> entry : orderDetailsMap.entrySet()) {
            Order order = entry.getKey();
            List<Order_detail> orderDetailsList = entry.getValue();

            System.out.println("Order ID: " + order.getId());
            System.out.println("Order Date: " + order.getOrder_date());
            System.out.println("Customer ID: " + order.getCustomer_id());
            System.out.println("Total Amount: ");

            System.out.println("Order Details:");
            int i = 1;
            for (Order_detail orderDetail : orderDetailsList) {
                System.out.println(i + "\tDetail ID: " + orderDetail.getId());
                System.out.println("\tProduct ID: " + orderDetail.getProduct_id());
                System.out.println("\tQuantity: ");
                System.out.println("\tUnit Price: " + orderDetail.getPrice());
                System.out.println("\tSubtotal: ");
                System.out.println();
                i++;
            }

            System.out.println("----------------------------------------");
        }

    }
}
