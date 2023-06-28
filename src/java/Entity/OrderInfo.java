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
        private final String customerName;
        private final String productName;
        private final String saleDate;
        private final double unitPrice;
        private final int quantity;
        private final double totalPrice;

        public OrderInfo(String customerName, String productName, String saleDate, double unitPrice, int quantity, double totalPrice) {
            this.customerName = customerName;
            this.productName = productName;
            this.saleDate = saleDate;
            this.unitPrice = unitPrice;
            this.quantity = quantity;
            this.totalPrice = totalPrice;
        }

        // Định nghĩa các phương thức getter để truy cập thông tin

        public String getCustomerName() {
            return customerName;
        }

        public String getProductName() {
            return productName;
        }

        public String getSaleDate() {
            return saleDate;
        }

        public double getUnitPrice() {
            return unitPrice;
        }

        public int getQuantity() {
            return quantity;
        }

        public double getTotalPrice() {
            return totalPrice;
        }

    @Override
    public String toString() {
        return "OrderInfo{" + "customerName=" + customerName + ", productName=" + productName + ", saleDate=" + saleDate + ", unitPrice=" + unitPrice + ", quantity=" + quantity + ", totalPrice=" + totalPrice + '}';
    }
        
    }

