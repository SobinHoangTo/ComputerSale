/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class News {

    private int id;
    private String title;
    private String short_description;
    private String create_date;
    private int author;
    private String news_detail;
    private int news_category_id;
    private int status;

    public News() {
    }

    public News(int id, String title, String short_description, String create_date, int author, String news_detail, int news_category_id, int status) {
        this.id = id;
        this.title = title;
        this.short_description = short_description;
        this.create_date = create_date;
        this.author = author;
        this.news_detail = news_detail;
        this.news_category_id = news_category_id;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getShort_description() {
        return short_description;
    }

    public void setShort_description(String short_description) {
        this.short_description = short_description;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public int getAuthor() {
        return author;
    }

    public void setAuthor(int author) {
        this.author = author;
    }

    public String getNews_detail() {
        return news_detail;
    }

    public void setNews_detail(String news_detail) {
        this.news_detail = news_detail;
    }

    public int getNews_category_id() {
        return news_category_id;
    }

    public void setNews_category_id(int news_category_id) {
        this.news_category_id = news_category_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "News{" + "id=" + id + ", title=" + title + ", short_description=" + short_description + ", create_date=" + create_date + ", author=" + author + ", news_detail=" + news_detail + ", news_category_id=" + news_category_id + ", status=" + status + '}';
    }

}
