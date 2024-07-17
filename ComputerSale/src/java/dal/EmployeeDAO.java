package dal;

import java.util.ArrayList;
import model.Employee;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import util.MyUtils;

public class EmployeeDAO extends DBContext {

    protected Employee getByRS(ResultSet rs) throws SQLException {
        return new Employee(
                rs.getInt("id"),
                rs.getString("username"),
                rs.getString("password"),
                rs.getString("email"),
                rs.getString("phone"),
                rs.getString("address"),
                rs.getString("firstname"),
                rs.getString("lastname"),
                rs.getString("reg_date"),
                rs.getInt("role_id"));
    }

    private ArrayList<Employee> get(String value) {
        ArrayList<Employee> list = new ArrayList<>();
        try {
            String sql = "select * from employee ";
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

    public ArrayList<Employee> getAll() {
        return get(null);
    }

    public Employee getById(int id) {
        return get("id=" + id).get(0);
    }

    public ArrayList<Employee> searchByNameOrEmail(String searchQuery) {
        return get(" username LIKE '%" + searchQuery + "%' OR email LIKE '%" + searchQuery + "%'");
    }

    public ArrayList<Employee> searchByRole(int searchQuery) {
        return get("role_id = " + searchQuery);
    }

    public Employee checkLogin(String username, String password) {
        ArrayList<Employee> temp = get("username like '" + username + "' and password like '" + new MyUtils().getMd5(password) + "'");
        return temp.isEmpty() ? null : temp.get(0);
    }

    public boolean checkSignUp(String username, String email) {
        return get("username like '" + username + "' or email like '" + email + "'").isEmpty();
    }

    public ArrayList<Employee> getAllPaging(int pageNumber, int itemsPerPage) {
        ArrayList<Employee> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM employee ORDER BY (SELECT NULL) OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, (pageNumber - 1) * itemsPerPage);
            pt.setInt(2, itemsPerPage);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                list.add(getByRS(rs));
            }
            rs.close();
            pt.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        return list;
    }

    public boolean updateEmployeeRole(int id, int roleId) {
        try {
            String sql = "UPDATE employee SET role_id = ? WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, roleId);
            ps.setInt(2, id);
            return (ps.executeUpdate() > 0);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean addEmployee(Employee e) {
        try {
            String sql = "INSERT INTO [dbo].[employee]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[email]\n"
                    + "           ,[phone]\n"
                    + "           ,[address]\n"
                    + "           ,[firstname]\n"
                    + "           ,[lastname]\n"
                    + "           ,[reg_date]\n"
                    + "           ,[role_id])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?,?,?)";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, e.getUsername());
            st.setString(2, e.getPassword()); // Assuming MyUtils has a secure hashPassword method
            st.setString(3, e.getEmail());
            st.setString(4, e.getPhone());
            st.setString(5, e.getAddress());
            st.setString(6, e.getFirstname());
            st.setString(7, e.getLastname());
            st.setString(8, LocalDate.now().toString()); // Ensure date format matches SQL Server's date format
            st.setInt(9, 3); // Assuming role_id is hardcoded to 3 for staff

            int rowsInserted = st.executeUpdate();
            if (rowsInserted > 0) {
                return true;
            }
        } catch (SQLException ex) {
            // Log the exception or handle it as needed
            ex.printStackTrace(); // Example of logging the exception
        }
        return false;
    }

    public static void main(String[] args) {
        for (Employee employee : new EmployeeDAO().getAll()) {
            System.out.println(employee.toString().contains("linh"));
        }
    }
}
