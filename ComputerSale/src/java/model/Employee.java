package model;

public class Employee {
    private int id;
    private String username;
    private String password;
    private String email;
    private String phone;
    private String address;
    private String firstname;
    private String lastname;
    private String img;
    private String reg_date;
    private int role_id;
    private int status;

    public Employee() {
    }

    public Employee(int id, String username, String password, String email, String phone, String address, String firstname, String lastname, String img, String reg_date, int role_id, int status) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.firstname = firstname;
        this.lastname = lastname;
        this.img = img;
        this.reg_date = reg_date;
        this.role_id = role_id;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getReg_date() {
        return reg_date;
    }

    public void setReg_date(String reg_date) {
        this.reg_date = reg_date;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Employee{" + "id=" + id + ", username=" + username + ", password=" + password + ", email=" + email + ", phone=" + phone + ", address=" + address + ", firstname=" + firstname + ", lastname=" + lastname + ", img=" + img + ", reg_date=" + reg_date + ", role_id=" + role_id + ", status=" + status + '}';
    }

   
    
}
