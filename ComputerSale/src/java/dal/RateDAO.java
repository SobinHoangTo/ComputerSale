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
public class RateDAO extends DBContext {

    public static void main(String[] args) {
        String searchQuery = "user3";
        Map<Rate, Product> list = new RateDAO().getRateProductMap();
        Map<Rate, Product> results = new HashMap<>();
        Map<Integer, Customer> userList = new RateDAO().getCustomerRate();
        for (Map.Entry<Rate, Product> entry : list.entrySet()) {
            Rate key = entry.getKey();
            Product val = entry.getValue();
            //search all 
            if (key.getFeedback().contains(searchQuery) || val.getName().contains(searchQuery)
                    || val.getCPU().contains(searchQuery) || val.getGPU().contains(searchQuery)
                    || val.getOS().contains(searchQuery)) {
                results.put(key, val);
            }
        }
        for (Map.Entry<Integer, Customer> entry1 : userList.entrySet()) {
            int id = entry1.getKey();
            Customer cus = entry1.getValue();
            if (cus.getUsername().contains(searchQuery)) {

            }
        }
// Log the size of the results or handle it appropriately
        System.out.println("Filtered results size: " + results.size());
    }

    public ArrayList<Rate> get(String value) {
        ArrayList<Rate> list = new ArrayList<>();
        try {
            String sql = "select * from rate";
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

    public Map<String, Rate> getCommentByID(int id) {
        Map<String, Rate> list = new HashMap<>();
        try {
            String sql = "select c.username,r.* from rate r join order_detail od\n"
                    + "on r.order_detail_id=od.id join [order] o\n"
                    + "on od.order_id = o.id join customer c\n"
                    + "on o.customer_id=c.id\n"
                    + "where product_id =  ?";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                Rate rate = getByRS(rs);
                list.put(username, rate);
            }
            rs.close();
            pt.close();
        } catch (Exception a) {
            System.out.println(a.getMessage());
            return null;
        }
        return list;
    }

    public Map<Integer, Customer> getCustomerRate() {
        Map<Integer, Customer> list = new HashMap<>();
        try {
            String sql = "select r.id,c.* from rate r join order_detail od\n"
                    + "on r.order_detail_id=od.id join [order] o\n"
                    + "on od.order_id = o.id join customer c\n"
                    + "on o.customer_id=c.id";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("id"));
                Customer customer = CustomerDAO.getByRS(rs);
                list.put(id, customer);
            }
            rs.close();
            pt.close();
        } catch (Exception a) {
            System.out.println(a.getMessage());
            return null;
        }
        return list;
    }

    private Rate getByRS(ResultSet rs) throws SQLException {
        return new Rate(rs.getInt("id"),
                rs.getInt("order_detail_id"),
                rs.getInt("star_rate"),
                rs.getString("feedback"),
                rs.getInt("status"));
    }

    public ArrayList<Rate> getAll() {
        return get(null);
    }

    public Map<Rate, Product> getRateProductMap() {
        Map<Rate, Product> list = new HashMap<>();
        try {
            String sql = "select r.*, p.id from rate  r join order_detail od\n"
                    + "on r.order_detail_id=od.id join product p \n"
                    + "on od.product_id=p.id";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Rate rate = getByRS(rs);
                Product product = new ProductDAO().getById(rs.getInt("id"));

                list.put(rate, product);
            }
            rs.close();
            pt.close();
        } catch (Exception a) {
            System.out.println(a.getMessage());
            return null;
        }
        return list;
    }

    public boolean deleteRateById(int rateId) {
        try {
            String sql = "DELETE FROM rate WHERE id = ?";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, rateId);
            int rowsAffected = pt.executeUpdate();
            pt.close();
            return (rowsAffected > 0);
        } catch (Exception e) {
            System.out.println("Error deleting rate: " + e.getMessage());
            return false;
        }
    }

    public boolean updateFeedback(int id, String message) {
        try {
            String sql = "UPDATE rate SET feedback = ? WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, message);
            ps.setInt(2, id);
            return (ps.executeUpdate() > 0);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean addFeedback(int order_detail_id, int star_rate, String feedback) {
        try {
            String sql = "INSERT INTO [dbo].[rate]\n"
                    + "           ([order_detail_id]\n"
                    + "           ,[star_rate]\n"
                    + "           ,[feedback])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, order_detail_id);
            ps.setInt(2, star_rate);
            ps.setString(3, feedback);
            return (ps.executeUpdate() > 0);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Rate getCommentByOrderDetailId(int orderDetailId) {
        Rate rate = null;
        try {
            String sql = "SELECT * FROM rate WHERE order_detail_id = ?";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, orderDetailId);
            ResultSet rs = pt.executeQuery();

            if (rs.next()) {
                rate = new Rate();
                rate.setId(rs.getInt("id"));
                rate.setOrder_detail_id(rs.getInt("order_detail_id"));
                rate.setStar_rate(rs.getInt("star_rate"));
                rate.setFeedback(rs.getString("feedback"));
                rate.setStatus(rs.getInt("status"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return rate;
    }
}
