/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author DELL
 */
public class OrderInfo {

    private int stt;
    private String customerName;
    private String productName;
    private String saleDate;
    private double unitPrice;
    private int quantity;
    private double totalPrice;

    public OrderInfo() {
    }

   

    public OrderInfo(int stt, String customerName, String productName, String saleDate, double unitPrice, int quantity, double totalPrice) {
        this.stt = stt;
        this.customerName = customerName;
        this.productName = productName;
        this.saleDate = saleDate;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
    }

    public int getStt() {
        return stt;
    }

    public void setStt(int stt) {
        this.stt = stt;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(String saleDate) {
        this.saleDate = saleDate;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "OrderInfo{" + "stt=" + stt + ", customerName=" + customerName + ", productName=" + productName + ", saleDate=" + saleDate + ", unitPrice=" + unitPrice + ", quantity=" + quantity + ", totalPrice=" + totalPrice + '}';
    }

}
