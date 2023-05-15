
package com.ecommerce.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int pId;
    @Column(length = 200)
    private String pName;
    @Column(length = 5000)
    private String pDescription;
    @Column(length = 1500)
    private String pPic;
    @Column(length = 100)
    private int pPrice;
    @Column(length = 100)
    private int pDiscount;
    @Column(length = 100)
    private int pQuantity;
    @ManyToOne
    @JoinColumn(name="category_categoryId",nullable=false)
    private Category category;

    public Product(int pId, String pName, String pDescription, String pPic, int pPrice, int pDiscount, int pQuantity) {
        this.pId = pId;
        this.pName = pName;
        this.pDescription = pDescription;
        this.pPic = pPic;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
    }

    public Product() {
    }

    public Product(String pName, String pDescription, String pPic, int pPrice, int pDiscount, int pQuantity,Category category) {
        this.pName = pName;
        this.pDescription = pDescription;
        this.pPic = pPic;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.category=category;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDescription() {
        return pDescription;
    }

    public void setpDescription(String pDescription) {
        this.pDescription = pDescription;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getpDiscount() {
        return pDiscount;
    }

    public void setpDiscount(int pDiscount) {
        this.pDiscount = pDiscount;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    

    @Override
    public String toString() {
        return "Product{" + "pId=" + pId + ", pName=" + pName + ", pDescription=" + pDescription + ", pPic=" + pPic + ", pPrice=" + pPrice + ", pDiscount=" + pDiscount + ", pQuantity=" + pQuantity + '}';
    }
    
    

}
