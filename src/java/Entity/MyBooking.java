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
public class MyBooking {
    private int appointmentSchedule_id;
        private String care_package_name;
    private int user_id;
    private String type_of_tree;
    private Date appointment_start_date;
    private String appointment_start_time;
    private String staff_name;
    private String staff_phone;
    private String status;
private int staff_id;
private int care_package_id;
private String appointment_note;

    public String getCare_package_name() {
        return care_package_name;
    }

    public void setCare_package_name(String care_package_name) {
        this.care_package_name = care_package_name;
    }

    public String getType_of_tree() {
        return type_of_tree;
    }

    public void setType_of_tree(String type_of_tree) {
        this.type_of_tree = type_of_tree;
    }

    public Date getAppointment_start_date() {
        return appointment_start_date;
    }

    public void setAppointment_start_date(Date appointment_start_date) {
        this.appointment_start_date = appointment_start_date;
    }



    public String getAppointment_start_time() {
        return appointment_start_time;
    }

    public void setAppointment_start_time(String appointment_start_time) {
        this.appointment_start_time = appointment_start_time;
    }

    public String getStaff_name() {
        return staff_name;
    }

    public void setStaff_name(String staff_name) {
        this.staff_name = staff_name;
    }

    public String getStaff_phone() {
        return staff_phone;
    }

    public void setStaff_phone(String staff_phone) {
        this.staff_phone = staff_phone;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getAppointmentSchedule_id() {
        return appointmentSchedule_id;
    }

    public void setAppointmentSchedule_id(int appointmentSchedule_id) {
        this.appointmentSchedule_id = appointmentSchedule_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    public String getAppointment_note() {
        return appointment_note;
    }

    public void setAppointment_note(String appointment_note) {
        this.appointment_note = appointment_note;
    }

    public MyBooking(int appointmentSchedule_id, String care_package_name, int user_id, String type_of_tree, Date appointment_start_date, String appointment_start_time, String staff_name, String staff_phone, String status, int staff_id, int care_package_id, String appointment_note) {
        this.appointmentSchedule_id = appointmentSchedule_id;
        this.care_package_name = care_package_name;
        this.user_id = user_id;
        this.type_of_tree = type_of_tree;
        this.appointment_start_date = appointment_start_date;
        this.appointment_start_time = appointment_start_time;
        this.staff_name = staff_name;
        this.staff_phone = staff_phone;
        this.status = status;
        this.staff_id = staff_id;
        this.care_package_id = care_package_id;
        this.appointment_note = appointment_note;
    }

    public MyBooking(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "MyBooking{" + "appointmentSchedule_id=" + appointmentSchedule_id + ", care_package_name=" + care_package_name + ", user_id=" + user_id + ", type_of_tree=" + type_of_tree + ", appointment_start_date=" + appointment_start_date + ", appointment_start_time=" + appointment_start_time + ", staff_name=" + staff_name + ", staff_phone=" + staff_phone + ", status=" + status + ", staff_id=" + staff_id + ", care_package_id=" + care_package_id + ", appointment_note=" + appointment_note + '}';
    }











}