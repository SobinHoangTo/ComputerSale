package model;

public class Brand {

    private int id;
    private String name;
    private String logo;
    private String link;
    private int created_by;
    private String created_on;
    private int modified_by;
    private String modified_on;
    private int status;

    public Brand() {
    }

    public Brand(int id, String name, String logo, String link, int created_by, String created_on, int modified_by, String modified_on, int status) {
        this.id = id;
        this.name = name;
        this.logo = logo;
        this.link = link;
        this.created_by = created_by;
        this.created_on = created_on;
        this.modified_by = modified_by;
        this.modified_on = modified_on;
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

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int created_by) {
        this.created_by = created_by;
    }

    public String getCreated_on() {
        return created_on;
    }

    public void setCreated_on(String created_on) {
        this.created_on = created_on;
    }

    public int getModified_by() {
        return modified_by;
    }

    public void setModified_by(int modified_by) {
        this.modified_by = modified_by;
    }

    public String getModified_on() {
        return modified_on;
    }

    public void setModified_on(String modified_on) {
        this.modified_on = modified_on;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Brand{" + "id=" + id + ", name=" + name + ", logo=" + logo + ", link=" + link + ", created_by=" + created_by + ", created_on=" + created_on + ", modified_by=" + modified_by + ", modified_on=" + modified_on + ", status=" + status + '}';
    }

}
