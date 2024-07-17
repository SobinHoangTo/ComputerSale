/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Discount {
    private int id;
    private int product_id;
    private int quantity;
    private int value;
    private String start_date;
    private String exp_date;
    private int created_by;
    private int status;
    
    public Discount() {
    }

    public Discount(int id, int product_id, int quantity, int value, String start_date, String exp_date, int created_by, int status) {
        this.id = id;
        this.product_id = product_id;
        this.quantity = quantity;
        this.value = value;
        this.start_date = start_date;
        this.exp_date = exp_date;
        this.created_by = created_by;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getExp_date() {
        return exp_date;
    }

    public void setExp_date(String exp_date) {
        this.exp_date = exp_date;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int created_by) {
        this.created_by = created_by;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Discount{" + "id=" + id + ", product_id=" + product_id + ", quantity=" + quantity + ", value=" + value + ", start_date=" + start_date + ", exp_date=" + exp_date + ", created_by=" + created_by + ", status=" + status + '}';
    }

}
