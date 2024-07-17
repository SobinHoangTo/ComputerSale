package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Category;

public class CategoryDAO extends DBContext {

    private Category getByRS(ResultSet rs) throws SQLException {
        return new Category(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getInt("created_by"),
                rs.getString("created_on"),
                rs.getInt("modified_by"),
                rs.getString("modified_on"),
                rs.getInt("status"));
    }

    private ArrayList<Category> get(String value) {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String sql = "select * from category";
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

    public ArrayList<Category> getAll() {
        return get(null);
    }

    public boolean addCategory(String name, int created_by) {
        try {
            String sql = "INSERT INTO [dbo].[category] "
                    + "([name], [created_by], [created_on]) "
                    + "VALUES (?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, created_by);
            st.setString(3, LocalDate.now().toString());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean editCategory(String name, int modified_by, int id) {
        try {
            String sql = "UPDATE [dbo].[category]\n"
                    + "   SET [name] = ?\n"
                    + "      ,[modified_by] = ?\n"
                    + "      ,[modified_on] = ?\n"
                    + " WHERE [id] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, modified_by);
            st.setString(3, LocalDate.now().toString());
            st.setInt(4, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean deleteCategory(int id) {
        try {
            connection.setAutoCommit(false); // Bắt đầu giao dịch

            // Xóa các bản ghi trong bảng product_image liên quan đến các sản phẩm thuộc category sẽ bị xóa
            String sql1 = "DELETE pi FROM [dbo].[product_image] pi "
                    + "JOIN [dbo].[product] p ON pi.product_id = p.id "
                    + "WHERE p.category_id = ?";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, id);
            st1.executeUpdate();

            // Xóa các bản ghi trong bảng discount liên quan đến các sản phẩm thuộc category sẽ bị xóa
            String sql2 = "DELETE d FROM [dbo].[discount] d "
                    + "JOIN [dbo].[product] p ON d.product_id = p.id "
                    + "WHERE p.category_id = ?";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, id);
            st2.executeUpdate();

            // Xóa các bản ghi trong bảng serial_number liên quan đến các sản phẩm thuộc category sẽ bị xóa
            String sql3 = "DELETE sn FROM [dbo].[serial_number] sn "
                    + "JOIN [dbo].[product] p ON sn.product_id = p.id "
                    + "WHERE p.category_id = ?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            st3.setInt(1, id);
            st3.executeUpdate();

            // Xóa các bản ghi trong bảng order_detail liên quan đến các sản phẩm thuộc category sẽ bị xóa
            String sql4 = "DELETE od FROM [dbo].[order_detail] od "
                    + "JOIN [dbo].[product] p ON od.product_id = p.id "
                    + "WHERE p.category_id = ?";
            PreparedStatement st4 = connection.prepareStatement(sql4);
            st4.setInt(1, id);
            st4.executeUpdate();

            // Xóa các sản phẩm chứa category sẽ bị xóa
            String sql5 = "DELETE FROM [dbo].[product] WHERE category_id = ?";
            PreparedStatement st5 = connection.prepareStatement(sql5);
            st5.setInt(1, id);
            st5.executeUpdate();

            // Cuối cùng, xóa category
            String sql6 = "DELETE FROM [dbo].[category] WHERE id = ?";
            PreparedStatement st6 = connection.prepareStatement(sql6);
            st6.setInt(1, id);
            st6.executeUpdate();

            connection.commit(); // Kết thúc giao dịch
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.rollback(); // Rollback giao dịch nếu có lỗi xảy ra
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            return false;
        } finally {
            try {
                connection.setAutoCommit(true); // Đặt lại chế độ tự động commit
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public boolean hiddenCategory(int id) {
        try {
            connection.setAutoCommit(false);

            String sqlCategory = "UPDATE [dbo].[category]\n"
                    + "   SET [status] = 0\n"
                    + " WHERE [id] = ?";
            PreparedStatement stCategory = connection.prepareStatement(sqlCategory);
            stCategory.setInt(1, id);
            stCategory.executeUpdate();

            String sqlProduct = "UPDATE [dbo].[product]\n"
                    + "   SET [status] = 0\n"
                    + " WHERE [category_id] = ?";
            PreparedStatement stProduct = connection.prepareStatement(sqlProduct);
            stProduct.setInt(1, id);
            stProduct.executeUpdate();

            connection.commit();
            connection.setAutoCommit(true);

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.rollback(); // Rollback nếu có lỗi xảy ra
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return false;
        }
    }

    public boolean displayCategory(int id) {
        try {
            connection.setAutoCommit(false);

            String sqlCategory = "UPDATE [dbo].[category]\n"
                    + "   SET [status] = 1\n"
                    + " WHERE [id] = ?";
            PreparedStatement stCategory = connection.prepareStatement(sqlCategory);
            stCategory.setInt(1, id);
            stCategory.executeUpdate();

            String sqlProduct = "UPDATE [dbo].[product]\n"
                    + "   SET [status] = 1\n"
                    + " WHERE [category_id] = ?";
            PreparedStatement stProduct = connection.prepareStatement(sqlProduct);
            stProduct.setInt(1, id);
            stProduct.executeUpdate();

            // Hoàn tất giao dịch
            connection.commit();
            connection.setAutoCommit(true);

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.rollback(); // Rollback nếu có lỗi xảy ra
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return false;
        }
    }

    public Category getById(int id) {
        try {
            String sql = "select * from category where id=?";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();
            if (rs.next()) {
                return getByRS(rs);
            }
            rs.close();
            pt.close();
        } catch (Exception a) {
            System.out.println(a.getMessage());
            return null;
        }
        return null;
    }

//    public ArrayList<Category> searchCategoryByKeyWord(String keyword) {
//    ArrayList<Category> listSearch = new ArrayList<>();
//    try {
//        // Tách chuỗi input thành các từ khóa
//        String[] keywords = keyword.split("\\s+");
//        
//        // Xây dựng câu truy vấn SQL
//        StringBuilder sql = new StringBuilder("SELECT * FROM [dbo].[category] WHERE ");
//        for (int i = 0; i < keywords.length; i++) {
//            sql.append("[name] LIKE ?");
//            if (i < keywords.length - 1) {
//                sql.append(" OR ");
//            }
//        }
//        
//        PreparedStatement pt = connection.prepareStatement(sql.toString());
//        
//        // Đặt giá trị cho các từ khóa trong câu truy vấn
//        for (int i = 0; i < keywords.length; i++) {
//            pt.setObject(i + 1, "%" + keywords[i] + "%");
//        }
//        
//        ResultSet rs = pt.executeQuery();
//        while (rs.next()) {
//            listSearch.add(getByRS(rs));
//        }
//        rs.close();
//        pt.close();
//    } catch (Exception a) {
//        System.out.println(a.getMessage());
//        return null;
//    }
//    return listSearch;
//}

    
    public ArrayList<Category> searchCategoryByKeyWord(String keyword) {
    ArrayList<Category> listSearch = new ArrayList<>();
    ArrayList<Category> allCategories = new ArrayList<>();
    try {
        // Lấy toàn bộ danh mục từ cơ sở dữ liệu
        String sql = "SELECT * FROM [dbo].[category]";
        PreparedStatement pt = connection.prepareStatement(sql);
        ResultSet rs = pt.executeQuery();
        while (rs.next()) {
            allCategories.add(getByRS(rs));
        }
        rs.close();
        pt.close();

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
        for (Category category : allCategories) {
            for (String key : validKeywords) {
                if (category.getName().toLowerCase().contains(key)) {
                    listSearch.add(category);
                    break;  // Nếu đã tìm thấy từ khóa trong danh mục này, chuyển sang danh mục tiếp theo
                }
            }
        }
    } catch (Exception a) {
        System.out.println(a.getMessage());
        return null;
    }
    return listSearch;
}


    public static void main(String[] args) {
        System.out.println(new CategoryDAO().getAll());
    }
}
