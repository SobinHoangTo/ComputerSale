/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author vdqvi
 */
public class DAOJoin extends DBContext {

    public ArrayList<ArrayList<String>> getShoppingHistory(int id) {
        ArrayList<ArrayList<String>> list = new ArrayList<>();
        try {
            String sql = "select p.representImage, sn.sn, od.price, od.product_id, od.id, p.name from [order] o join\n"
                    + "                        order_detail od on o.id=od.order_id join\n"
                    + "                        serial_number sn on od.serial_number_id=sn.id join\n"
                    + "                        product p on p.id=od.product_id\n"
                    + "                        where customer_id = ?";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                ArrayList<String> temp = new ArrayList<>();
                temp.add(rs.getString("representImage"));
                temp.add(rs.getString("sn"));
                temp.add(rs.getString("price"));
                temp.add(rs.getString("product_id"));
                temp.add(rs.getString("id"));
                temp.add(rs.getString("name"));
                list.add(temp);
            }
            rs.close();
            pt.close();
        } catch (Exception a) {
            System.out.println(a.getMessage());
            return null;
        }
        return list;
    }

    public int getNumberOfProductsSoldByCategory(int id) {
        try {
            String sql = """
                        select p.category_id, count(od.id) as NumberOfProductSole from [order] o join
                        order_detail od on o.id = od.order_id join
                        product p on p.id = od.product_id 
                        where p.category_id=? and o.order_status=2
                        group by p.category_id""";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();
            if (rs.next()) {
                return rs.getInt("NumberOfProductSole");
            }
            rs.close();
            pt.close();
        } catch (Exception a) {
            System.out.println(a.getMessage());
            return 0;
        }
        return 0;
    }

    public ArrayList<ArrayList<String>> getOrderAdminStatistic() {
        ArrayList<ArrayList<String>> list = new ArrayList<>();
        try {
            String sql = """
                        select TOP 5 o.order_date, o.id, c.firstname+' '+c.lastname as fullname, sum(od.price) as total, o.paid_date from [order] o join
                        order_detail od on o.id=od.order_id join
                        customer c on o.customer_id=c.id
                        group by o.id, o.order_date, c.firstname, c.lastname, o.paid_date
                        order by o.order_date desc""";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                ArrayList<String> temp = new ArrayList<>();
                temp.add(rs.getString("order_date"));
                temp.add(rs.getString("id"));
                temp.add(rs.getString("fullname"));
                temp.add(rs.getString("total"));
                temp.add(rs.getString("paid_date"));
                list.add(temp);
            }
            rs.close();
            pt.close();
        } catch (Exception a) {
            System.out.println(a.getMessage());
            return null;
        }
        return list;
    }

    public int getNumberProductSoldByDay(String day) {
        try {
            String sql = """
                        select o.order_date , COUNT(od.id) as NumberSold from [order] o join
                        order_detail od on o.id=od.order_id
                        where o.order_status=2 and o.order_date=?
                        group by o.order_date""";
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setString(1, day);
            ResultSet rs = pt.executeQuery();
            if (rs.next()) {
                return rs.getInt("NumberSold");
            }
            rs.close();
            pt.close();
        } catch (Exception a) {
            System.out.println(a.getMessage());
        }
        return 0;
    }

    public int getTotalNumberProductSold() {
        try {
            String sql = """
                        select COUNT(od.id) as NumberSold from [order] o join
                        order_detail od on o.id=od.order_id
                        where o.order_status=2""";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            if (rs.next()) {
                return rs.getInt("NumberSold");
            }
            rs.close();
            pt.close();
        } catch (Exception a) {
            System.out.println(a.getMessage());
        }
        return 0;
    }
    public ArrayList<ArrayList<String>> getProductRate(){
        ArrayList<ArrayList<String>> list = new ArrayList<>();
        try {
            String sql = """
                        select p.name ,ROUND(cast(sum(r.star_rate)as float)/cast(count(r.id) as float),2) as star from product p join
                        order_detail od on od.product_id = p.id join 
                        rate r on r.order_detail_id = od.id
                        group by p.id,p.name
                        order by star desc""";
            PreparedStatement pt = connection.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                ArrayList<String> temp = new ArrayList<>();
                temp.add(rs.getString("name"));
                temp.add(rs.getString("star"));
                list.add(temp);
            }
            rs.close();
            pt.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        return list;
    }
    public ArrayList<ArrayList<String>> getProductQuality(int type) {
        ArrayList<ArrayList<String>> list = new ArrayList<>();
        try {
            String sql = """
                        select Top 5  p.id, p.name,
                        count(wr.id) as NumberOfWarranty, 
                        count(od.id) as TotalUnitsSold, 
                        1-ROUND(CAST(COUNT(wr.id) AS FLOAT) / CAST(COUNT(od.id) AS FLOAT), 2) AS QualityRate
                         from product p left join
                        order_detail od on od.product_id=p.id left join
                        warranty_record wr on wr.order_detail_id = od.id
                        group by p.id, p.name
                        HAVING count(od.id) > 0
                        order by QualityRate""" + (type == 1 ? " desc" : " asc") + ", TotalUnitsSold desc";
            PreparedStatement pt = connection.prepareStatement(sql);

            ResultSet rs = pt.executeQuery();
            while (rs.next()) {
                ArrayList<String> temp = new ArrayList<>();
                temp.add(rs.getString("id"));
                temp.add(rs.getString("name"));
                temp.add(rs.getString("NumberOfWarranty"));
                temp.add(rs.getString("TotalUnitsSold"));
                temp.add(rs.getString("QualityRate"));
                list.add(temp);
            }
            rs.close();
            pt.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        return list;
    }

    public ArrayList<String> getInformationWarranty(int id) {
        ArrayList<String> list = new ArrayList<>();
        try {
            String sql = """
                         select wr.warranty_date, c.firstname+c.lastname as customerName, c.phone, sn.sn, p.name, c.email from warranty_record wr join
                         order_detail od on od.id = wr.order_detail_id join
                         serial_number sn on sn.id = od.serial_number_id join
                         [order] o on o.id = od.order_id join
                         product p on p.id = od.product_id join
                         customer c on c.id = o.customer_id 
                         where wr.id = ?
                        """;
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();
            if (rs.next()) {
                list.add(rs.getString("warranty_date"));
                list.add(rs.getString("customerName"));
                list.add(rs.getString("phone"));
                list.add(rs.getString("sn"));
                list.add(rs.getString("name"));
                list.add(rs.getString("email"));
            }
            rs.close();
            pt.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        return list;
    }

    public static void main(String[] args) {
        System.out.println(new DAOJoin().getProductQuality(2).toString());
    }
}
