/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Warranty_record {
    private int id;
    private int order_detail_id;
    private String warranty_date;
    private String reason;
    private String img;
    private int warranty_status;
    private String response;
    private int verified_by;
    private String verified_on;

    public Warranty_record() {
    }

    public Warranty_record(int id, int order_detail_id, String warranty_date, String reason, String img, int warranty_status, String response, int verified_by, String verified_on) {
        this.id = id;
        this.order_detail_id = order_detail_id;
        this.warranty_date = warranty_date;
        this.reason = reason;
        this.img = img;
        this.warranty_status = warranty_status;
        this.response = response;
        this.verified_by = verified_by;
        this.verified_on = verified_on;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrder_detail_id() {
        return order_detail_id;
    }

    public void setOrder_detail_id(int order_detail_id) {
        this.order_detail_id = order_detail_id;
    }

    public String getWarranty_date() {
        return warranty_date;
    }

    public void setWarranty_date(String warranty_date) {
        this.warranty_date = warranty_date;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getWarranty_status() {
        return warranty_status;
    }

    public void setWarranty_status(int warranty_status) {
        this.warranty_status = warranty_status;
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
        return "Warranty_record{" + "id=" + id + ", order_detail_id=" + order_detail_id + ", warranty_date=" + warranty_date + ", reason=" + reason + ", img=" + img + ", warranty_status=" + warranty_status + ", response=" + response + ", verified_by=" + verified_by + ", verified_on=" + verified_on + '}';
    }

    
    
    
}
