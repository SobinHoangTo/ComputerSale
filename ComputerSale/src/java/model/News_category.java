package model;

public class News_category {
    private int id; 
    private String name;
    private int status;

    public News_category() {
    }

    public News_category(int id, String name, int status) {
        this.id = id;
        this.name = name;
        this.status = status;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "News_category{" + "id=" + id + ", name=" + name + '}';
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
