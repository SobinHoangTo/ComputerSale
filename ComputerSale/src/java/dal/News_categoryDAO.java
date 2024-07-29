package dal;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.*;

public class News_categoryDAO extends DBContext {

    private News_category getByRS(ResultSet rs) throws SQLException {
        return new News_category(rs.getInt("id"),
                rs.getString("name"), rs.getInt("status"));
    }

    private ArrayList<News_category> get(String value) {
        ArrayList<News_category> list = new ArrayList<>();
        try {
            String sql = "select * from news_category";
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

    public ArrayList<News_category> getAll() {
        return get(null);
    }

    public ArrayList<News_category> searchNewCategoryString(String search) {
        return get("name like '%" + search + "%'");
    }

    public boolean addCategory(String category) {
        try {
            String sql = "INSERT INTO [dbo].[news_category]\n"
                    + "           ([name])\n"
                    + "VALUES (?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, category);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean editCategory(String name, int id) {
        try {
            String sql = "UPDATE [dbo].[news_category]\n"
                    + "   SET [name] = ?\n"
                    + " WHERE [id] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean updateStatus(int status, int id) {
        try {
            String sql = "UPDATE [dbo].[news_category]\n"
                    + "   SET [status] = ?\n"
                    + " WHERE [id] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, id);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteCategory(int id) {
        try {
            String sql = "DELETE FROM news_category\n"
                    + " WHERE [id] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public News_category getById(int id) {
        try {
            String sql = "select * from news_category where id=?";
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
    public News_category getByIdActive(int id) {
        try {
            String sql = "select * from news_category where id=? and status =1";
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

    public static void main(String[] args) {
        System.out.println(new News_categoryDAO().getAll());
    }
}
