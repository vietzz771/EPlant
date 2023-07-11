/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author DELL
 */
public class CarePackage {

    private int care_package_id;
    private String package_name;
    private Double price;

    public int getCare_package_id() {
        return care_package_id;
    }

    public void setCare_package_id(int care_package_id) {
        this.care_package_id = care_package_id;
    }

    public String getPackage_name() {
        return package_name;
    }

    public void setPackage_name(String package_name) {
        this.package_name = package_name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public CarePackage(int care_package_id, String package_name, Double price) {
        this.care_package_id = care_package_id;
        this.package_name = package_name;
        this.price = price;
    }

    @Override
    public String toString() {
        return "CarePackage{" + "care_package_id=" + care_package_id + ", package_name=" + package_name + ", price=" + price + '}';
    }

}
