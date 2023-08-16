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
    private Date appoinment_end_date;

    public Booking() {
    }

    public Booking(int user_id, int staff_id, int care_package_id, String type_of_tree, String care_package, String appointment_start_time, Date appointment_start_date, String appointment_note, String status, Date appoinment_end_date) {
        this.user_id = user_id;
        this.staff_id = staff_id;
        this.care_package_id = care_package_id;
        this.type_of_tree = type_of_tree;
        this.care_package = care_package;
        this.appointment_start_time = appointment_start_time;
        this.appointment_start_date = appointment_start_date;
        this.appointment_note = appointment_note;
        this.status = status;
        this.appoinment_end_date = appoinment_end_date;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public int getCare_package_id() {
        return care_package_id;
    }

    public void setCare_package_id(int care_package_id) {
        this.care_package_id = care_package_id;
    }

    public String getType_of_tree() {
        return type_of_tree;
    }

    public void setType_of_tree(String type_of_tree) {
        this.type_of_tree = type_of_tree;
    }

    public String getCare_package() {
        return care_package;
    }

    public void setCare_package(String care_package) {
        this.care_package = care_package;
    }

    public String getAppointment_start_time() {
        return appointment_start_time;
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

    public String getAppointment_note() {
        return appointment_note;
    }

    public void setAppointment_note(String appointment_note) {
        this.appointment_note = appointment_note;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getAppoinment_end_date() {
        return appoinment_end_date;
    }

    public void setAppoinment_end_date(Date appoinment_end_date) {
        this.appoinment_end_date = appoinment_end_date;
    }

    @Override
    public String toString() {
        return "Booking{" + "user_id=" + user_id + ", staff_id=" + staff_id + ", care_package_id=" + care_package_id + ", type_of_tree=" + type_of_tree + ", care_package=" + care_package + ", appointment_start_time=" + appointment_start_time + ", appointment_start_date=" + appointment_start_date + ", appointment_note=" + appointment_note + ", status=" + status + ", appoinment_end_date=" + appoinment_end_date + '}';
    }
    
    
}
