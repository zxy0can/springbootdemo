package com.aaa.entity;

public class Provider {
   private Integer  providerid;
    private String providernumber;
    private String providername;
    private String contacts;
    private int telphone;
    private String address;
    private String email;
    private String bank;
    private String bankaccount;

    public Provider() {
    }

    public int getProviderid() {
        return providerid;
    }

    public void setProviderid(int providerid) {
        this.providerid = providerid;
    }

    public String getProvidernumber() {
        return providernumber;
    }

    public void setProvidernumber(String providernumber) {
        this.providernumber = providernumber;
    }

    public String getProvidername() {
        return providername;
    }

    public void setProvidername(String providername) {
        this.providername = providername;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public int getTelphone() {
        return telphone;
    }

    public void setTelphone(int telphone) {
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
        return "Provider{" +
                "providerid=" + providerid +
                ", providernumber='" + providernumber + '\'' +
                ", providername='" + providername + '\'' +
                ", contacts='" + contacts + '\'' +
                ", telphone=" + telphone +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", bank='" + bank + '\'' +
                ", bankaccount='" + bankaccount + '\'' +
                '}';
    }
}
