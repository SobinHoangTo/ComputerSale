/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Serial_number;

/**
 *
 * @author admin
 */
public class Serial_numberDAO extends DBContext {

    private ArrayList<Serial_number> get(String value) {
        ArrayList<Serial_number> list = new ArrayList<>();
        try {
            String sql = "select * from serial_number";
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

    public ArrayList<Serial_number> getAll() {
        return get(null);
    }

    public void add(Serial_number temp) {
        try {
            String sql = """
                         INSERT INTO [dbo].[serial_number]
                                    ([sn]
                                    ,[product_id]
                                    ,[sn_status])
                              VALUES
                                    (?,?,?)""";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, temp.getSn());
            st.setInt(2, temp.getProduct_id());
            st.setInt(3, 1);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<Serial_number> getAllByProductId(int id) {
        return get("product_id=" + id);
    }

    public ArrayList<Serial_number> getAllByProductIdAndStatus(int id, int status) {
        return get("product_id=" + id + " and sn_status=" + status);
    }

    private Serial_number getByRS(ResultSet rs) throws SQLException {
        return new Serial_number(
                rs.getInt("id"),
                rs.getString("sn"),
                rs.getInt("product_id"),
                rs.getInt("sn_status")
        );
    }

    public void updateStatus(int id, int status) {
        try {
            String sql = "update serial_number set sn_status=? where id=?";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, status);
            pt.setInt(2, id);
            pt.executeUpdate();
            pt.close();
        } catch (Exception a) {
            System.out.println(a.getMessage());
        }
    }

    public ArrayList<Serial_number> getByOrderID(int id) {
        ArrayList<Serial_number> list = new ArrayList<>();
        try {
            String sql = "select sn.id, sn.product_id, sn.sn, sn.sn_status from serial_number sn join order_detail od on sn.id=od.serial_number_id join [order] o on o.id = od.order_id where o.id=?";
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

    public static void main(String[] args) {
        ArrayList<Serial_number> p = new Serial_numberDAO().getAllByProductIdAndStatus(1, 1);
        System.out.println(p);
    }
}
