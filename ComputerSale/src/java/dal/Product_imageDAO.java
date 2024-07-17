package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.*;

public class Product_imageDAO extends DBContext{
    private Product_image getByRS(ResultSet rs) throws SQLException{
            return new Product_image(
                        rs.getInt("id"), 
                        rs.getInt("product_id"), 
                        rs.getString("img"));
    }
    
    public ArrayList<Product_image> get(String value){
        ArrayList<Product_image> list = new ArrayList<>();
        try {
            String sql = "select * from product_image";
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
    public ArrayList<Product_image> getAll(){
        return get(null);
    }
    public ArrayList<Product_image> getAllByProductID(int id){
        return get("product_id="+id);
    }
    
        public boolean addProductImage(int productId, String imageName) {
        try {
            String sql = "INSERT INTO [dbo].[product_image] (product_id, img) VALUES (?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            st.setString(2, imageName);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }
    
//    public boolean addProductImages(int id){
//        ArrayList<Product_image> list = new ArrayList<>();
//        try {
//            String sql = "\"INSERT INTO [dbo].[brand] \"\n" +
//"                    + \"([name], [logo], [link], [created_by], [created_on]) \"\n" +
//"                    + \"VALUES (?, ?, ?, ?, ?)\";";
//        }catch (Exception a) {
//            System.out.println(a.getMessage());
//            return false;
//    }
//        return true;
//    }
    
    public static void main(String[] args) {
        ArrayList<Product_image> getAllByProductID = new Product_imageDAO().getAllByProductID(2);
        System.out.println(getAllByProductID);
    }
}
