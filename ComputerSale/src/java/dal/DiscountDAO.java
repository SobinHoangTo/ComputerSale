package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import model.*;
import util.MyUtils;

public class DiscountDAO extends DBContext {

    private Discount getByRS(ResultSet rs) throws SQLException {
        return new Discount(
                rs.getInt("id"),
                rs.getInt("product_id"),
                rs.getInt("quantity"),
                rs.getInt("value"),
                rs.getString("start_date"),
                rs.getString("exp_date"),
                rs.getInt("created_by"),
                rs.getInt("status"));
    }

    private ArrayList<Discount> get(String value) {
        ArrayList<Discount> list = new ArrayList<>();
        try {
            String sql = "select * from discount ";
            if (value != null || !value.isBlank()) {
                sql += "where " + value;
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

    public ArrayList<Discount> getAll() {
        return get(null);
    }

    public ArrayList<Discount> getDiscountsOnGoing() {
        String date = LocalDate.now().toString();
        return get(" (start_date <" + date+" OR start_date ="+ date + ") and exp_date > " + date);
    }
    public Map<Integer, Discount> getAllMapKeyProductId() {
        Map<Integer, Discount> discountProductMap = new HashMap<>();
        try {
            String sql = "SELECT * FROM discount where (start_date < ? or start_date = ?) and exp_date > ?";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, LocalDate.now().toString());
            pt.setString(2, LocalDate.now().toString());
            pt.setString(3, LocalDate.now().toString());
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Discount discount = new DiscountDAO().getByRS(rs);
                discountProductMap.put(discount.getProduct_id(), discount);
            }
            rs.close();
            pt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return discountProductMap;
    }

    public ArrayList<Product> getTop3ProductsByDiscount() {
        ArrayList<Product> topProducts = new ArrayList<>();
        try {
            String sql = "Select top 3 P.*, D.value From product P join discount D on P.id = D.product_id order by D.value DESC";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Product product = new ProductDAO().getByRS(rs);
                topProducts.add(product);
            }
            rs.close();
            pt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return topProducts;
    }

    public Map<Discount, Product> getAllWithDiscount() {
        Map<Discount, Product> discountProductMap = new HashMap<>();
        try {
            String sql = "SELECT * FROM discount D JOIN product P ON D.product_id = P.id";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Discount discount = new DiscountDAO().getByRS(rs);
                Product product = new ProductDAO().getByRS(rs);
                discountProductMap.put(discount, product);
            }
            rs.close();
            pt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return discountProductMap;
    }

    public Map<Integer, Integer> getDiscountProductID() {
        Map<Integer, Integer> discountProductMap = new HashMap<>();
        try {
            String sql = "SELECT * FROM discount where (start_date < ? or start_date = ?) and exp_date > ?";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, LocalDate.now().toString());
            pt.setString(2, LocalDate.now().toString());
            pt.setString(3, LocalDate.now().toString());
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Discount discount = new DiscountDAO().getByRS(rs);
                discountProductMap.put(discount.getId(), discount.getValue());
            }
            rs.close();
            pt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return discountProductMap;
    }
private ArrayList<Product> searchProductsByString(ArrayList<Product> list, String keyword) {
        ArrayList<Product> result = new ArrayList<>();
        String[] keywords = MyUtils.convertKeywords(keyword);

        for (Product p : list) {
            if (MyUtils.containsKeywords(p.getName(), keywords)) {
                result.add(p);
            }
        }
        return result;
    }
    public Map<Discount, Product> searchByProductNameOrUser(String search) {
        Map<Discount, Product> discountProductMap = new HashMap<>();
        try {
            String sql = "SELECT D.*,P.* FROM discount D JOIN product P \n"
                    + "ON D.product_id=P.id JOIN employee E \n"
                    + "ON D.created_by=E.id\n"
                    + "WHERE P.name LIKE ? OR E.username LIKE ?";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, "%" + search + "%");
            pt.setString(2, "%" + search + "%");
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Discount discount = new DiscountDAO().getByRS(rs);
                Product product = new ProductDAO().getByRS(rs);
                discountProductMap.put(discount, product);
            }
            rs.close();
            pt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return discountProductMap;
    }

    public Map<Discount, Product> searchByCreatedBy(int roleID) {
        Map<Discount, Product> discountProductMap = new HashMap<>();
        try {
            String sql = "SELECT D.*,P.* FROM discount D JOIN employee E\n"
                    + "ON D.created_by = E.id JOIN product P \n"
                    + "ON D.product_id=P.id\n"
                    + "WHERE role_id = ?";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, roleID);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                Discount discount = new DiscountDAO().getByRS(rs);
                Product product = new ProductDAO().getByRS(rs);
                discountProductMap.put(discount, product);
            }
            rs.close();
            pt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return discountProductMap;
    }

    public boolean addDiscount(Discount discount) {
        try {
            String sql = "INSERT INTO discount (product_id, quantity, value, start_date, exp_date, created_by) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, discount.getProduct_id());
            pt.setInt(2, discount.getQuantity());
            pt.setInt(3, discount.getValue());
            pt.setString(4, discount.getStart_date());
            pt.setString(5, discount.getExp_date());
            pt.setInt(6, discount.getCreated_by());
            int rowsInserted = pt.executeUpdate();
            pt.close();
            return rowsInserted > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean deleteDiscount(int discountID) {
        try {
            String sql = "DELETE FROM [dbo].[discount] WHERE [id] = ?";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, discountID);
            int rowsInserted = pt.executeUpdate();
            pt.close();
            return rowsInserted > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean updateDiscount(Discount discount) {
        try {
            String sql = "UPDATE [dbo].[discount]\n"
                    + "   SET [product_id] = ?\n"
                    + "      ,[quantity] = ?\n"
                    + "      ,[value] = ?\n"
                    + "      ,[start_date] = ?\n"
                    + "      ,[exp_date] = ?\n"
                    + "      ,[created_by] = ?\n"
                    + " WHERE [id] = ?";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, discount.getProduct_id());
            pt.setInt(2, discount.getQuantity());
            pt.setDouble(3, discount.getValue());
            pt.setString(4, discount.getStart_date());
            pt.setString(5, discount.getExp_date());
            pt.setInt(6, discount.getCreated_by());
            pt.setInt(7, discount.getId());

            int rowsUpdated = pt.executeUpdate();
            pt.close();
            return rowsUpdated > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public static void main(String[] args) {
        // Assume DiscountDAO().getAllWithDiscount() returns a Map<Discount, Product>
        // Example usage
        System.out.println(new DiscountDAO().getDiscountProductID());


    }
}
