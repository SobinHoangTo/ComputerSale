package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Brand;

public class BrandDAO extends DBContext {

    private Brand getByRS(ResultSet rs) throws SQLException {
        return new Brand(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("logo"),
                rs.getString("link"),
                rs.getInt("created_by"),
                rs.getString("created_on"),
                rs.getInt("modified_by"),
                rs.getString("modified_on"),
                rs.getInt("status"));
    }

    private ArrayList<Brand> get(String value) {
        ArrayList<Brand> list = new ArrayList<>();
        try {
            String sql = "select * from brand";
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

    public ArrayList<Brand> getAll() {
        return get(null);
    }

    public ArrayList<Brand> getAllByActiveStatus() {
        return get("status = 1");
    }
    
    public boolean addBrand(String name, String logo, String link, int created_by) {
        try {
            String sql = "INSERT INTO [dbo].[brand] "
                    + "([name], [logo], [link], [created_by], [created_on]) "
                    + "VALUES (?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, logo);
            st.setString(3, link);
            st.setInt(4, created_by);
            st.setString(5, LocalDate.now().toString());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean editBrandById(String name, String logo, String link, int modified_by, int id) {
        try {
            String sql = "UPDATE [dbo].[brand]\n"
                    + "   SET [name] = ?\n"
                    + "      ,[logo] = ?\n"
                    + "      ,[link] = ?\n"
                    + "      ,[modified_by] = ?\n"
                    + "      ,[modified_on] = ?\n"
                    + " WHERE [id] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, logo);
            st.setString(3, link);
            st.setInt(4, modified_by);
            st.setString(5, LocalDate.now().toString());
            st.setInt(6, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean hiddenBrand(int id) {
        try {
            connection.setAutoCommit(false);

            String sqlBrand = "UPDATE [dbo].[brand]\n"
                    + "   SET [status] = 0\n"
                    + " WHERE [id] = ?";
            PreparedStatement stBrand = connection.prepareStatement(sqlBrand);
            stBrand.setInt(1, id);
            stBrand.executeUpdate();

            String sqlProduct = "UPDATE [dbo].[product]\n"
                    + "   SET [status] = 0\n"
                    + " WHERE [brand_id] = ?";
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

    public boolean displayBrand(int id) {
        try {
            // Bắt đầu giao dịch
            connection.setAutoCommit(false);

            // Cập nhật trạng thái của brand
            String sqlBrand = "UPDATE [dbo].[brand]\n"
                    + "   SET [status] = 1\n"
                    + " WHERE [id] = ?";
            PreparedStatement stBrand = connection.prepareStatement(sqlBrand);
            stBrand.setInt(1, id);
            stBrand.executeUpdate();

            // Cập nhật trạng thái của các sản phẩm liên quan
            String sqlProduct = """
                                UPDATE product 
                                SET status = 1 
                                WHERE id IN (
                                    SELECT p.id 
                                    FROM product p 
                                    JOIN category c ON c.id = p.category_id
                                    WHERE c.status = 1
                                ) and [brand_id] = ?""";
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

    public Brand getById(int id) {
        try {
            String sql = "select * from brand where id=?";
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

    public ArrayList<Brand> searchBrandByKeyWord(String keyword) {
        ArrayList<Brand> listSearch = new ArrayList<>();
        ArrayList<Brand> allBrands = new ArrayList<>();
        try {
            // Lấy toàn bộ thương hiệu từ cơ sở dữ liệu
            String sql = "SELECT * FROM [dbo].[brand]";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                allBrands.add(getByRS(rs));
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
            for (Brand brand : allBrands) {
                for (String key : validKeywords) {
                    if (brand.getName().toLowerCase().contains(key)) {
                        listSearch.add(brand);
                        break;  // Nếu đã tìm thấy từ khóa trong thương hiệu này, chuyển sang thương hiệu tiếp theo
                    }
                }
            }
        } catch (Exception a) {
            System.out.println(a.getMessage());
            return null;
        }
        return listSearch;
    }

    public ArrayList<Brand> searchBrandByKeyWord(String search, int indexPage, int itemPerPage) {
        ArrayList<Brand> listSearch = new ArrayList<>();
        try {
            // Lấy toàn bộ thương hiệu từ cơ sở dữ liệu
            String sql = "with [page] as (select ROW_NUMBER() over (order by created_on desc) as [row],\n"
                    + "* from brand where name like ?) select * from [page] where [row] between ?*?-(?-1) and ?*?";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, "%" + search + "%");
            pt.setInt(2, indexPage);
            pt.setInt(3, itemPerPage);
            pt.setInt(4, itemPerPage);
            pt.setInt(5, indexPage);
            pt.setInt(6, itemPerPage);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                listSearch.add(getByRS(rs));
            }
            rs.close();
            pt.close();
        } catch (Exception a) {
            System.out.println(a.getMessage());
            return null;
        }
        return listSearch;
    }

    public int getNumberOfBrand() {
        try {
            String sql = "select COUNT(id) as NumberOfBrand from brand";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            if (rs.next()) {
                return rs.getInt("NumberOfBrand");
            }
            rs.close();
            pt.close();
        } catch (Exception a) {
            System.out.println(a.getMessage());
            return 0;
        }
        return 0;
    }

    public List<Brand> getBrandByPage(int page, int itemsPerPage) {
        List<Brand> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM brand ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
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

    public int getNumBrandBySearch(String search) {
        try {
            String sql = "SELECT COUNT(*) from brand where [name] like ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
        return 0;
    }

    public static void main(String[] args) {
        System.out.println(new BrandDAO().getAll());
    }
}
