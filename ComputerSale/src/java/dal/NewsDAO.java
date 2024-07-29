package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import model.*;

/**
 *
 * @author admin
 */
public class NewsDAO extends DBContext {

    protected News getByRS(ResultSet rs) throws SQLException {
        return new News(
                rs.getInt("id"),
                rs.getString("title"),
                rs.getString("short_description"),
                rs.getString("create_date"),
                rs.getInt("author"),
                rs.getString("news_detail"),
                rs.getInt("news_category_id"),
                rs.getInt("status")
        );
    }

    public ArrayList<News> get(String value) {
        ArrayList<News> newsList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM news";
            if (value != null && !value.isBlank()) {
                sql += " where " + value;
            }
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                newsList.add(getByRS(rs));
            }
            rs.close();
            pt.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return newsList;
    }

    public ArrayList<News> getAllNews() {
        return get(null);
    }

    public ArrayList<News> getHomeNews() {
        ArrayList<News> newsList = new ArrayList<>();
        try {
            String sql = "SELECT top 3 * FROM news where news_category_id =3 order by create_date";

            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                newsList.add(getByRS(rs));
            }
            rs.close();
            pt.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return newsList;
    }

    public ArrayList<News> getManageNews() {
        ArrayList<News> newsList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM news ORDER BY id desc, create_date DESC";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                newsList.add(getByRS(rs));
            }
            rs.close();
            pt.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return newsList;
    }

    public ArrayList<News> getNewsByCategoryID(int id) {
        ArrayList<News> newsList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM news where news_category_id = ? order by create_date";

            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                newsList.add(getByRS(rs));
            }
            rs.close();
            pt.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return newsList;
    }

    public News getNewsByID(int id) {
        try {
            String sql = "SELECT * FROM news where id = ?";

            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                return getByRS(rs);
            }
            rs.close();
            pt.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public ArrayList<News> searchByNewString(String search) {
        return get("title LIKE '%" + search
                + "%' or author = (select id from employee where username like '%" + search
                + "%' or firstname like '%" + search + "%'  or lastname like '%" + search + "%' )");
    }

    public ArrayList<News> searchByNewsCategory(int search) {
        return get(" news_category_id = " + search);
    }

    public Map<String, News> getAuthorNews(int id) {
        Map<String, News> newsEmployeeMap = new HashMap<>();
        try {
            String sql = "select CONCAT(e.firstname, ' ', e.lastname) as authorName,n.* from employee e join news n on e.[id] = n.author where n.id = ?";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                String author = rs.getString("authorName");
                News news = getByRS(rs);
                newsEmployeeMap.put(author, news);
            }
            rs.close();
            pt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newsEmployeeMap;
    }

//    public Map<News, Employee> getNewsCategoryMap(int id) {
//        Map<News, Employee> newsEmployeeMap = new HashMap<>();
//        try {
//            String sql = "SELECT n.*, e.* FROM employee e \n"
//                    + "INNER JOIN news n ON e.id = n.author\n"
//                    + "where news_category_id = ?";
//            PreparedStatement pt = connection.prepareStatement(sql);
//            pt.setInt(1, id);
//            ResultSet rs = pt.executeQuery();
//            while (rs.next()) {
//                News news = getByRS(rs);
//                Employee employee = new EmployeeDAO().getByRS(rs);
//                newsEmployeeMap.put(news, employee);
//            }
//            rs.close();
//            pt.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return newsEmployeeMap;
//    }
    public Map<News, Employee> getNewsEmployeeMap() {
        Map<News, Employee> newsEmployeeMap = new HashMap<>();
        try {
            String sql = "SELECT n.*, e.* FROM employee e \n"
                    + "INNER JOIN news n ON e.id = n.author order by n.create_date desc";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                News news = getByRS(rs);
                Employee employee = new EmployeeDAO().getByRS(rs);
                newsEmployeeMap.put(news, employee);
            }
            rs.close();
            pt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newsEmployeeMap;
    }

    public boolean updateNews(News news) {
        String sql = "UPDATE news SET [title]= ?, short_description = ?,[create_date] = ?, "
                + "news_detail = ? ,[author] = ?,[news_category_id] = ?,[status] = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, news.getTitle());
            ps.setString(2, news.getShort_description());
            ps.setString(3, news.getCreate_date());
            ps.setString(4, news.getNews_detail());
            ps.setInt(5, news.getAuthor());
            ps.setInt(6, news.getNews_category_id());
            ps.setInt(7, news.getStatus());
            ps.setInt(8, news.getId());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean addNews(News news) {
        String sql = "INSERT INTO [dbo].[news]\n"
                + "           ([title]\n"
                + "           ,[short_description]\n"
                + "           ,[create_date]\n"
                + "           ,[news_detail]\n"
                + "           ,[author]\n"
                + "           ,[news_category_id]\n"
                + "           ,[status])"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, news.getTitle());
            ps.setString(2, news.getShort_description());
            ps.setString(3, news.getCreate_date());
            ps.setString(4, news.getNews_detail());
            ps.setInt(5, news.getAuthor());
            ps.setInt(6, news.getNews_category_id());
            ps.setInt(7, news.getStatus());

            int rowsUpdated = ps.executeUpdate();
            return (rowsUpdated > 0);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteNews(int id) {
        String sql = "DELETE FROM [dbo].[news]\n"
                + "      WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        News news = new News(0, "Privacy Policy", "We respect your privacy. We use your data to process orders, improve services, and communicate with you. Your information is never shared without consent, except as required by law."
                ,LocalDate.now().toString(), 1, "At Linh and Associates Store, we respect your privacy and are committed to protecting your personal information. Our privacy policy outlines how we collect, use, and secure your data. We use your information to process orders, improve our services, and communicate with you. Your information is never shared without your consent, except as required by law.", 1, 1);
        new NewsDAO().addNews(news);
    }
}
