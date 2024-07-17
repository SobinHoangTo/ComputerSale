/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Customer;
import util.MyUtils;

/**
 *
 * @author vdqvi
 */
public class CustomerDAO extends DBContext {

    protected  static Customer getByRS(ResultSet rs) throws SQLException {
        return new Customer(rs.getInt("id"),
                rs.getString("username"),
                rs.getString("password"),
                rs.getString("email"),
                rs.getString("phone"),
                rs.getString("address"),
                rs.getString("firstname"),
                rs.getString("lastname"),
                rs.getString("img"),
                rs.getString("reg_date"));
    }

    private ArrayList<Customer> get(String value) {
        ArrayList<Customer> list = new ArrayList<>();
        try {
            String sql = "select * from customer";
            if(value!=null&&!value.isBlank()){
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

    public ArrayList<Customer> getAll() {
        return get(null);
    }
    public Customer getById(int id){
        return get("id = " + id).get(0);
    }
    public Customer checkLogin(String username, String password) {
        ArrayList<Customer> temp = get("username like '" + username + "' and password like '" + new MyUtils().getMd5(password) + "'");
        return temp.isEmpty() ? null : temp.get(0);
    }

    public boolean checkSignUp(String username, String email) {
        return get("username like '" + username + "' or email like '" + email + "'").isEmpty();
    }

    public boolean add(String username, String email, String password, String phone, String address, String firstname, String lastname) {
        try {
            String sql = "insert into customer(username,password,email,phone,address,firstname,lastname,reg_date) values(?,?,?,?,?,?,?,?)";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, username);
            pt.setString(2, new MyUtils().getMd5(password));
            pt.setString(3, email);
            pt.setString(4, phone);
            pt.setString(5, address);
            pt.setString(6, firstname);
            pt.setString(7, lastname);
            pt.setString(8, LocalDate.now().toString());
            pt.executeUpdate();
            pt.close();
        } catch (Exception a) {
            System.out.println(a.getMessage());
            return false;
        }
        return true;
    }

    public int getID(String username, String password) {
        int id = checkLogin(username, password).getId();
        return id;
    }

    public Customer getProfile(int id) {
        try {
            String sql = "select * from customer where id=?";
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

    public boolean editProfile(String email, String phone, String address, String firstname, String lastname, String img, int id) {
        try {
            String sql = "UPDATE [dbo].[customer]\n"
                    + "   SET [email] = ?\n"
                    + "      ,[phone] = ?\n"
                    + "      ,[address] = ?\n"
                    + "      ,[firstname] = ?\n"
                    + "      ,[lastname] = ?\n"
                    + "      ,[img] = ?\n"
                    + " WHERE [id] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, phone);
            st.setString(3, address);
            st.setString(4, firstname);
            st.setString(5, lastname);
            st.setString(6, img);
            st.setInt(7, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

public boolean checkPassWord(String oldPassword, int id) {
    try {
        String sql = "SELECT password FROM [dbo].[customer] WHERE id = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            String currentPassword = rs.getString("password");
            return currentPassword.equals(new MyUtils().getMd5(oldPassword));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}

    
    public boolean changePassword(int id, String newPassword) {
        try {
            String sql = "UPDATE [dbo].[customer] SET [password] = ? WHERE [id] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, new MyUtils().getMd5(newPassword));
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    public static void main(String[] args) {
        System.out.println(new CustomerDAO().editProfile("user1@example.com", "123456789", "123 ABC, City, Country", "Johnn", "Cenaaa", "Screenshot 2024-06-25 214629.png",1));
}
}
