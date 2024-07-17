/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Product {

    private int id;
    private String name;
    private String CPU;
    private String GPU;
    private String RAM;
    private String ROM;
    private String monitor;
    private String OS;
    private int price;
    private String description;
    private int brand_id;
    private int category_id;
    private int quantity;
    private String representImage;
    private int created_by;
    private String created_on;
    private int modified_by;
    private String modified_on;
    private int status;

    public Product() {
    }

    public Product(int id, String name, String CPU, String GPU, String RAM, String ROM, String monitor, String OS, int price, String description, int brand_id, int category_id, int quantity, String representImage, int created_by, String created_on, int modified_by, String modified_on, int status) {
        this.id = id;
        this.name = name;
        this.CPU = CPU;
        this.GPU = GPU;
        this.RAM = RAM;
        this.ROM = ROM;
        this.monitor = monitor;
        this.OS = OS;
        this.price = price;
        this.description = description;
        this.brand_id = brand_id;
        this.category_id = category_id;
        this.quantity = quantity;
        this.representImage = representImage;
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

    public String getCPU() {
        return CPU;
    }

    public void setCPU(String CPU) {
        this.CPU = CPU;
    }

    public String getGPU() {
        return GPU;
    }

    public void setGPU(String GPU) {
        this.GPU = GPU;
    }

    public String getRAM() {
        return RAM;
    }

    public void setRAM(String RAM) {
        this.RAM = RAM;
    }

    public String getROM() {
        return ROM;
    }

    public void setROM(String ROM) {
        this.ROM = ROM;
    }

    public String getMonitor() {
        return monitor;
    }

    public void setMonitor(String monitor) {
        this.monitor = monitor;
    }

    public String getOS() {
        return OS;
    }

    public void setOS(String OS) {
        this.OS = OS;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getRepresentImage() {
        return representImage;
    }

    public void setRepresentImage(String representImage) {
        this.representImage = representImage;
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
        return "Product{" + "id=" + id + ", name=" + name + ", CPU=" + CPU + ", GPU=" + GPU + ", RAM=" + RAM + ", ROM=" + ROM + ", monitor=" + monitor + ", OS=" + OS + ", price=" + price + ", description=" + description + ", brand_id=" + brand_id + ", category_id=" + category_id + ", quantity=" + quantity + ", representImage=" + representImage + ", created_by=" + created_by + ", created_on=" + created_on + ", modified_by=" + modified_by + ", modified_on=" + modified_on + ", status=" + status + '}';
    }

}
