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
public class BookingStaff {

    private int appointmentSchedule_id;
    private String care_package_name;
    private String type_of_tree;
    private Date appointment_start_date;
    private String appointment_start_time;
    private String customer_name;
    private String customer_phone;
    private String status;
    private double price;
    private String appointment_note;

    public BookingStaff(int appointmentSchedule_id, String care_package_name, String type_of_tree, Date appointment_start_date, String appointment_start_time, String customer_name, String customer_phone, String status, double price, String appointment_note) {
        this.appointmentSchedule_id = appointmentSchedule_id;
        this.care_package_name = care_package_name;
        this.type_of_tree = type_of_tree;
        this.appointment_start_date = appointment_start_date;
        this.appointment_start_time = appointment_start_time;
        this.customer_name = customer_name;
        this.customer_phone = customer_phone;
        this.status = status;
        this.price = price;
        this.appointment_note = appointment_note;
    }

    public BookingStaff(String status) {
        this.status = status;
    }

    public int getAppointmentSchedule_id() {
        return appointmentSchedule_id;
    }

    public void setAppointmentSchedule_id(int appointmentSchedule_id) {
        this.appointmentSchedule_id = appointmentSchedule_id;
    }

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

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getCustomer_phone() {
        return customer_phone;
    }

    public void setCustomer_phone(String customer_phone) {
        this.customer_phone = customer_phone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getAppointment_note() {
        return appointment_note;
    }

    public void setAppointment_note(String appointment_note) {
        this.appointment_note = appointment_note;
    }

    @Override
    public String toString() {
        return "BookingStaff{" + "appointmentSchedule_id=" + appointmentSchedule_id + ", care_package_name=" + care_package_name + ", type_of_tree=" + type_of_tree + ", appointment_start_date=" + appointment_start_date + ", appointment_start_time=" + appointment_start_time + ", customer_name=" + customer_name + ", customer_phone=" + customer_phone + ", status=" + status + ", price=" + price + ", appointment_note=" + appointment_note + '}';
    }


}