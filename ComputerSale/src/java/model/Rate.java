/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Rate {
    private int id;
    private int order_detail_id;
    private int star_rate;
    private String feedback;
    private int status;

    public Rate() {
    }

    public Rate(int id, int order_detail_id, int star_rate, String feedback, int status) {
        this.id = id;
        this.order_detail_id = order_detail_id;
        this.star_rate = star_rate;
        this.feedback = feedback;
        this.status = status;
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

    public int getStar_rate() {
        return star_rate;
    }

    public void setStar_rate(int star_rate) {
        this.star_rate = star_rate;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Rate{" + "id=" + id + ", order_detail_id=" + order_detail_id + ", star_rate=" + star_rate + ", feedback=" + feedback + ", status=" + status + '}';
    }

    

}
