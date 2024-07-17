/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Order {
    private int id;
    private int customer_id;
    private String note;
    private String address;
    private String phone;
    private String order_date;
    private String paid_date;
    private int order_status;
    private int verified_by;
    private String verified_on;

    public Order() {
    }

    public Order(int id, int customer_id, String note, String address, String phone, String order_date, String paid_date, int order_status, int verified_by, String verified_on) {
        this.id = id;
        this.customer_id = customer_id;
        this.note = note;
        this.address = address;
        this.phone = phone;
        this.order_date = order_date;
        this.paid_date = paid_date;
        this.order_status = order_status;
        this.verified_by = verified_by;
        this.verified_on = verified_on;
    }

    public Order(int i, String string) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public String getPaid_date() {
        return paid_date;
    }

    public void setPaid_date(String paid_date) {
        this.paid_date = paid_date;
    }

    public int getOrder_status() {
        return order_status;
    }

    public void setOrder_status(int order_status) {
        this.order_status = order_status;
    }

    public int getVerified_by() {
        return verified_by;
    }

    public void setVerified_by(int verified_by) {
        this.verified_by = verified_by;
    }

    public String getVerified_on() {
        return verified_on;
    }

    public void setVerified_on(String verified_on) {
        this.verified_on = verified_on;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", customer_id=" + customer_id + ", note=" + note + ", address=" + address + ", phone=" + phone + ", order_date=" + order_date + ", paid_date=" + paid_date + ", order_status=" + order_status + ", verified_by=" + verified_by + ", verified_on=" + verified_on + '}';
    }
    
    
}
