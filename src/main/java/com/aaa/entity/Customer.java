package com.aaa.entity;

public class Customer {
    private Integer customerid;
    private Integer number;
    private String contacts;
    private Integer telphone;
    private String address;
    private String email;
    private String bank;
    private String bankaccount;

    public Customer() {
    }

    public Customer(Integer customerid, Integer number, String contacts, Integer telphone, String address, String email, String bank, String bankaccount) {
        this.customerid = customerid;
        this.number = number;
        this.contacts = contacts;
        this.telphone = telphone;
        this.address = address;
        this.email = email;
        this.bank = bank;
        this.bankaccount = bankaccount;
    }

    public Integer getCustomerid() {
        return customerid;
    }

    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public Integer getTelphone() {
        return telphone;
    }

    public void setTelphone(Integer telphone) {
        this.telphone = telphone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getBankaccount() {
        return bankaccount;
    }

    public void setBankaccount(String bankaccount) {
        this.bankaccount = bankaccount;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "customerid=" + customerid +
                ", number=" + number +
                ", contacts='" + contacts + '\'' +
                ", telphone=" + telphone +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", bank='" + bank + '\'' +
                ", bankaccount='" + bankaccount + '\'' +
                '}';
    }
}
