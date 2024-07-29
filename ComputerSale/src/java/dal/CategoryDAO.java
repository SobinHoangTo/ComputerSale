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

    public ArrayList<Category> getAvailiable(String value) {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String sql = "select * from category where status=1";
            if (value != null && !value.isBlank()) {
                sql += " and " + value;
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

    public ArrayList<Category> getAllByStatus(int status) {
        return get("status = 1");
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

            String sqlProduct = """
                                UPDATE product 
                                SET status = 1 
                                WHERE id IN (
                                    SELECT p.id 
                                    FROM product p 
                                    JOIN brand b ON b.id=p.brand_id
                                    WHERE b.status = 1
                                ) and [category_id] = ?""";
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
