/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author DELL
 */
public class Staff {

    private int staff_id;
    private String full_name;
    private String phone;

    public Staff() {
    }

    public Staff(int staff_id, String full_name, String phone) {
        this.staff_id = staff_id;
        this.full_name = full_name;
        this.phone = phone;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Staff{" + "staff_id=" + staff_id + ", full_name=" + full_name + ", phone=" + phone + '}';
    }

}
