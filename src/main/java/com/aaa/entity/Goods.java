package com.aaa.entity;

public class Goods {

    private String goodsnumber;
    private int typenumber;
    private String goodsname;
    private String goodsprice;
    private double purchaseprice;
    private double saleprice;
    private double retailprice;
    private String producer;
    private String measureunit;
    private int repertory;

    public Goods() {
    }

    public String getGoodsnumber() {
        return goodsnumber;
    }

    public void setGoodsnumber(String goodsnumber) {
        this.goodsnumber = goodsnumber;
    }

    public int getTypenumber() {
        return typenumber;
    }

    public void setTypenumber(int typenumber) {
        this.typenumber = typenumber;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public String getGoodsprice() {
        return goodsprice;
    }

    public void setGoodsprice(String goodsprice) {
        this.goodsprice = goodsprice;
    }

    public double getPurchaseprice() {
        return purchaseprice;
    }

    public void setPurchaseprice(double purchaseprice) {
        this.purchaseprice = purchaseprice;
    }

    public double getSaleprice() {
        return saleprice;
    }

    public void setSaleprice(double saleprice) {
        this.saleprice = saleprice;
    }

    public double getRetailprice() {
        return retailprice;
    }

    public void setRetailprice(double retailprice) {
        this.retailprice = retailprice;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    public String getMeasureunit() {
        return measureunit;
    }

    public void setMeasureunit(String measureunit) {
        this.measureunit = measureunit;
    }

    public int getRepertory() {
        return repertory;
    }

    public void setRepertory(int repertory) {
        this.repertory = repertory;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goodsnumber='" + goodsnumber + '\'' +
                ", typenumber=" + typenumber +
                ", goodsname='" + goodsname + '\'' +
                ", goodsprice='" + goodsprice + '\'' +
                ", purchaseprice=" + purchaseprice +
                ", saleprice=" + saleprice +
                ", retailprice=" + retailprice +
                ", producer='" + producer + '\'' +
                ", measureunit='" + measureunit + '\'' +
                ", repertory=" + repertory +
                '}';
    }
}
