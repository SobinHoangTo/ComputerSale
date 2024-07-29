package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import model.*;
import java.util.List;

public class ProductDAO extends DBContext {

    private ArrayList<Product> get(String extend) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            String sql = "select * from product ";
            if (extend != null && !extend.isBlank()) {
                sql += " where " + extend;
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
            list.clear();
            return list;
        }
        return list;
    }

    public ArrayList<Product> getAvailable(String extend) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            String sql = "select * from product where status=1 ";
            if (extend != null && !extend.isBlank()) {
                sql += " and " + extend;
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
            list.clear();
            return list;
        }
        return list;
    }

    public ArrayList<Product> getRelatedProducts(int id) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT top 8 p.* \n"
                    + "FROM product p\n"
                    + "JOIN product p1 ON p.brand_id = p1.brand_id\n"
                    + "WHERE p1.id = ?;";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, id);
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

    public ArrayList<Product> getHomeProduct() {
        ArrayList<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM product \n"
                    + "WHERE id IN (\n"
                    + "SELECT TOP 8 product_id FROM discount\n"
                    + "WHERE (start_date < ? OR start_date= ? ) AND exp_date > ?\n"
                    + "GROUP BY product_id,value,start_date\n"
                    + "ORDER BY [value] )";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, LocalDate.now().toString());
            pt.setString(2, LocalDate.now().toString());
            pt.setString(3, LocalDate.now().toString());
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

    public ArrayList<Product> getAll() {
        return get(null);
    }

    public ArrayList<Product> getAllProductByCategory(int cid) {
        return get("category_id=" + cid);
    }

    public int getNumberOfItems() {
        try {
            String sql = "select COUNT(id) as NumberOfItems from product";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            if (rs.next()) {
                return rs.getInt("NumberOfItems");
            }
            rs.close();
            pt.close();
        } catch (Exception a) {
            System.out.println(a.getMessage());
            return 0;
        }
        return 0;
    }

    public ArrayList<Product> getAllByFilter(String filter) {
        return getAvailable(filter);
    }

    public Product getById(int id) {
        ArrayList<Product> temp = get("id=" + id);
        return temp.isEmpty() ? null : temp.get(0);
    }

    protected Product getByRS(ResultSet rs) throws SQLException {
        return new Product(rs.getInt("id"),
                rs.getString("name"),
                rs.getString("CPU"),
                rs.getString("GPU"),
                rs.getString("RAM"),
                rs.getString("ROM"),
                rs.getString("monitor"),
                rs.getString("OS"),
                rs.getInt("price"),
                rs.getString("description"),
                rs.getInt("brand_id"),
                rs.getInt("category_id"),
                rs.getInt("quantity"),
                rs.getString("representImage"),
                rs.getInt("created_by"),
                rs.getString("created_on"),
                rs.getInt("modified_by"),
                rs.getString("modified_on"),
                rs.getInt("status"));
    }

    public boolean addProduct(String name, String CPU, String GPU, String RAM, String ROM, String monitor, String OS,
            int price, String description, int brand_id, int category_id, int quanitity, String representImage, int create_by) {
        try {
            String sql = "INSERT INTO [dbo].[product]\n"
                    + "           ([name]\n"
                    + "           ,[CPU]\n"
                    + "           ,[GPU]\n"
                    + "           ,[RAM]\n"
                    + "           ,[ROM]\n"
                    + "           ,[monitor]\n"
                    + "           ,[OS]\n"
                    + "           ,[price]\n"
                    + "           ,[quantity]\n"
                    + "           ,[representImage]\n"
                    + "           ,[description]\n"
                    + "           ,[brand_id]\n"
                    + "           ,[category_id]\n"
                    + "           ,[created_by]\n"
                    + "           ,[created_on])\n"
                    + "     VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, CPU);
            st.setString(3, GPU);
            st.setString(4, RAM);
            st.setString(5, ROM);
            st.setString(6, monitor);
            st.setString(7, OS);
            st.setInt(8, price);
            st.setInt(9, quanitity);
            st.setString(10, representImage);
            st.setString(11, description);
            st.setInt(12, brand_id);
            st.setInt(13, category_id);
            st.setInt(14, create_by);
            st.setString(15, LocalDate.now().toString());
            st.executeUpdate();

//            // Lấy ID của sản phẩm vừa thêm vào
//            ResultSet rs = st.getGeneratedKeys();
//            int product_id = 0;
//            if (rs.next()) {
//                product_id = rs.getInt(1);
//            }
//
//            // Thêm các đường dẫn ảnh vào bảng Image
//            String imageSql = "INSERT INTO product_image (product_id, img) VALUES (?, ?)";
//            PreparedStatement imagePs = connection.prepareStatement(imageSql);
//            for (String img : images) {
//                imagePs.setInt(1, product_id);
//                imagePs.setString(2, img);
//                imagePs.addBatch();
//            }
//            imagePs.executeBatch();
//
//            connection.commit();
//        } catch (SQLException e) {
//            e.printStackTrace();
//            try {
//                if (connection != null) {
//                    connection.rollback();
//                }
//            } catch (SQLException ex) {
//                ex.printStackTrace();
//            }
//        } finally {
//            try {
//                if (connection != null) {
//                    connection.close();
//                }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean editProductById(String name, String CPU, String GPU, String RAM, String ROM, String monitor, String OS, int price,
            String description, int brand_id, int category_id, int quantity, String representImage, int modified_by, int id) {
        try {
            String sql = "UPDATE [dbo].[product]\n"
                    + "   SET [name] = ?\n"
                    + "      ,[CPU] = ?\n"
                    + "      ,[GPU] = ?\n"
                    + "      ,[RAM] = ?\n"
                    + "      ,[ROM] = ?\n"
                    + "      ,[monitor] = ?\n"
                    + "      ,[OS] = ?\n"
                    + "      ,[price] = ?\n"
                    + "      ,[description] = ?\n"
                    + "      ,[brand_id] = ?\n"
                    + "      ,[category_id] = ?\n"
                    + "      ,[quantity]= ?\n"
                    + "      ,[representImage]= ?\n"
                    + "      ,[modified_by] = ?\n"
                    + "      ,[modified_on] = ?\n"
                    + "  WHERE [id] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, CPU);
            st.setString(3, GPU);
            st.setString(4, RAM);
            st.setString(5, ROM);
            st.setString(6, monitor);
            st.setString(7, OS);
            st.setInt(8, price);
            st.setString(9, description);
            st.setInt(10, brand_id);
            st.setInt(11, category_id);
            st.setInt(12, quantity);
            st.setString(13, representImage);
            st.setInt(14, modified_by);
            st.setString(15, LocalDate.now().toString());
            st.setInt(16, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean hiddenProduct(int id) {
        try {
            String sql = "UPDATE [dbo].[product]\n"
                    + "   SET [status] = 0\n"
                    + "      WHERE [id] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    public boolean displayProduct(int id) {
        try {
            String sql = "UPDATE [dbo].[product] SET [status] = 1  WHERE [id] = (SELECT p.id \n" +
"    FROM product p \n" +
"    JOIN brand b ON b.id=p.brand_id\n" +
"	Join category c on c.id=p.category_id\n" +
"    WHERE b.status = 1 and c.status=1 and p.id=?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    public ArrayList<Product> searchProductByKeyWord(String keyword) {
        ArrayList<Product> listSearch = new ArrayList<>();
        try {
            // Chuẩn hóa chuỗi input
            String normalizedKeyword = keyword.replaceAll("[^a-zA-Z0-9\\s]", "").toLowerCase();

            // Tách các từ khóa hợp lệ
            String[] keywords = normalizedKeyword.split("\\s+");
            ArrayList<String> validKeywords = new ArrayList<>();
            for (String key : keywords) {
                if (!key.isBlank() && key.length() > 2) { // Bỏ qua các từ khóa ngắn và trống
                    validKeywords.add(key);
                }
            }

            // Tìm kiếm các từ khóa trong danh sách đã tải
            for (Product product : get(null)) {
                for (String key : validKeywords) {
                    if (product.getName().toLowerCase().contains(key)) {
                        listSearch.add(product);
                        break;  // Nếu đã tìm thấy từ khóa trong sản phẩm này, chuyển sang sản phẩm tiếp theo
                    }
                }
            }
        } catch (Exception a) {
            System.out.println(a.getMessage());
            return null;
        }
        return listSearch;
    }

    public List<Product> getProductsByPage(int page, int itemsPerPage) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM product ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (page - 1) * itemsPerPage);
            ps.setInt(2, itemsPerPage);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(getByRS(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

// Method to get the total number of products
    public int getTotalProducts() {
        int total = 0;
        String sql = "SELECT COUNT(*) FROM product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    // Method to get the total number of products by category
    public int getTotalProductsByCategory(int categoryId) {
        int total = 0;
        String sql = "SELECT COUNT(*) FROM product WHERE category_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    // Method to get products by category with pagination
    public List<Product> getProductsByCategoryAndPage(int categoryId, int page, int itemsPerPage) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE category_id = ? ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryId);
            st.setInt(2, (page - 1) * itemsPerPage);
            st.setInt(3, itemsPerPage);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(getByRS(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getLastInsertedProductId() {
        String sql = "SELECT MAX(id) AS id FROM product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // return -1 if there is an error or no rows are found
    }

    public static void main(String[] args) {
        System.out.println(new ProductDAO().getHomeProduct());
    }
}
