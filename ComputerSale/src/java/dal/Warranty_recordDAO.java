package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Warranty_record;

/**
 *
 * @author admin
 */
public class Warranty_recordDAO extends DBContext {
    
    private ArrayList<Warranty_record> get(String value) {
        ArrayList<Warranty_record> list = new ArrayList<>();
        try {
            String sql = "select * from warranty_record ";
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
        } catch (SQLException a) {
            System.out.println(a.getMessage());
            return null;
        }
        return list;
    }
    
    
    private Warranty_record getByRS(ResultSet rs) throws SQLException{
            return new Warranty_record(
                        rs.getInt("id"),
                        rs.getInt("order_detail_id"),
                        rs.getString("warranty_date"),
                        rs.getString("reason"),
                        rs.getString("img"),
                        rs.getInt("warranty_status"),
                        rs.getString("response"),
                        rs.getInt("verified_by"),
                        rs.getString("verified_on"));
    }
    public ArrayList<Warranty_record> getAll(){
        return get(null);
    }
    public ArrayList<Warranty_record> getAllByOrderDetailID(int id){
        return get(" order_detail_id=" + id);
    }
    public ArrayList<ArrayList<String>> getAllToManage(){
        ArrayList<ArrayList<String>> list = new ArrayList<>();
        try {
            String sql = """
                         select wr.id, p.name, sn.sn, wr.reason, wr.warranty_status, wr.response, c.firstname + ' ' + c.lastname as fullname from warranty_record wr join
order_detail od on wr.order_detail_id=od.id join
serial_number sn on od.serial_number_id=sn.id join
product p on p.id = od.product_id join
[order] o on o.id = od.order_id join
customer c on c.id = o.customer_id """;
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                ArrayList<String> temp = new ArrayList<>();
                temp.add(rs.getString("id")); //0
                temp.add(rs.getString("name")); //1
                temp.add(rs.getString("sn")); //2
                temp.add(rs.getString("reason")); //3
                temp.add(rs.getString("warranty_status")); //4
                temp.add(rs.getString("response")==null?"":rs.getString("response")); //5
                temp.add(rs.getString("fullname")); //6
                list.add(temp);
            }
            rs.close();
            pt.close();
        } catch (SQLException a) {
            System.out.println(a.getMessage());
            return null;
        }
        return list;
    }
    public ArrayList<Warranty_record> getAllById(int id) {
        return get("id=" + id);
    }
    public void updateStatus(int id, int status, String res, int employeeID){
        try{
            String sql = "update warranty_record set warranty_status=?, response=?, verified_by=?, verified_on=? where id=?";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, status);
            pt.setString(2, res);
            pt.setInt(3, employeeID);
            pt.setString(4, LocalDate.now().toString());
            pt.setInt(5, id);
            pt.executeUpdate();
            pt.close();
        }catch (SQLException a) {
            System.out.println(a.getMessage());
        }
    }
    public Warranty_record getById(int id){
        return get("id=" + id).get(0);
    }
    public static void main(String[] args) {
        System.out.println(new Warranty_recordDAO().getAllToManage());
    }
}
