/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Serial_number {
    private int id;
    private String sn;
    private int product_id;
    private int sn_status;

    public Serial_number() {
    }

    public Serial_number(int id, String sn, int product_id, int sn_status) {
        this.id = id;
        this.sn = sn;
        this.product_id = product_id;
        this.sn_status = sn_status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getSn_status() {
        return sn_status;
    }

    public void setSn_status(int sn_status) {
        this.sn_status = sn_status;
    }

    @Override
    public String toString() {
        return "Serial_number{" + "id=" + id + ", sn=" + sn + ", product_id=" + product_id + ", sn_status=" + sn_status + '}';
    }

}
