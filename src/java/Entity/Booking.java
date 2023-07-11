/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author DELL
 */
public class Booking {

    private int user_id;
    private int staff_id;
    private int care_package_id;
    private String type_of_tree;
    private String care_package;
    private String appointment_start_time;
    private Date appointment_start_date;
    private String appointment_note;
    private String status;

    public Booking(int user_id, int staff_id, int care_package_id, String type_of_tree, String care_package, String appointment_start_time, Date appointment_start_date, String appointment_note, String status) {
        this.user_id = user_id;
        this.staff_id = staff_id;
        this.care_package_id = care_package_id;
        this.type_of_tree = type_of_tree;
        this.care_package = care_package;
        this.appointment_start_time = appointment_start_time;
        this.appointment_start_date = appointment_start_date;
        this.appointment_note = appointment_note;
        this.status = status;

    }

    public Booking() {
    }

    public int getCare_package_id() {
        return care_package_id;
    }

    public void setCare_package_id(int care_package_id) {
        this.care_package_id = care_package_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String Status) {
        this.status = Status;
    }

    public int getUser_id() {
        return user_id;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public String getType_of_tree() {
        return type_of_tree;
    }

    public String getCare_package() {
        return care_package;
    }

    public String getAppointment_start_time() {
        return appointment_start_time;
    }

    public String getAppointment_note() {
        return appointment_note;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public void setType_of_tree(String type_of_tree) {
        this.type_of_tree = type_of_tree;
    }

    public void setCare_package(String care_package) {
        this.care_package = care_package;
    }

    public void setAppointment_start_time(String appointment_start_time) {
        this.appointment_start_time = appointment_start_time;
    }

    public Date getAppointment_start_date() {
        return appointment_start_date;
    }

    public void setAppointment_start_date(Date appointment_start_date) {
        this.appointment_start_date = appointment_start_date;
    }

    public void setAppointment_note(String appointment_note) {
        this.appointment_note = appointment_note;
    }

    @Override
    public String toString() {
        return "Booking{" + "user_id=" + user_id + ", staff_id=" + staff_id + ", care_package_id=" + care_package_id + ", type_of_tree=" + type_of_tree + ", care_package=" + care_package + ", appointment_start_time=" + appointment_start_time + ", appointment_start_date=" + appointment_start_date + ", appointment_note=" + appointment_note + ", Status=" + status + '}';
    }

}
