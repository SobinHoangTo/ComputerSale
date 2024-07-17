/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Order_detail {
    private int id;
    private int serial_number_id;
    private int order_id;
    private int product_id;
    private int price;

    public Order_detail() {
    }

    public Order_detail(int id, int serial_number_id, int order_id, int product_id, int price) {
        this.id = id;
        this.serial_number_id = serial_number_id;
        this.order_id = order_id;
        this.product_id = product_id;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSerial_number_id() {
        return serial_number_id;
    }

    public void setSerial_number_id(int serial_number_id) {
        this.serial_number_id = serial_number_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Order_detail{" + "id=" + id + ", serial_number_id=" + serial_number_id + ", order_id=" + order_id + ", product_id=" + product_id + ", price=" + price + '}';
    }

    
}
