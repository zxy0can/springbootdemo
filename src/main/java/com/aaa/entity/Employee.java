package com.aaa.entity;

public class Employee {
    private int employeeid ;
    private String employeenumber;
    private String name;
    private String password;
    private String sex;
    private String telphone;
    private String email;
    private String address;
    private String origo;
    private String nation ;
    private String education ;
    private String graduation;
    private String bank;
    private String bankaccount;
    private int roleid;

    public Employee() {
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRoleid() {
        return roleid;
    }

    public void setRoleid(int roleid) {
        this.roleid = roleid;
    }

    public int getEmployeeid() {
        return employeeid;
    }

    public void setEmployeeid(int eemployeeid) {
        this.employeeid = eemployeeid;
    }

    public String getEmployeenumber() {
        return employeenumber;
    }

    public void setEmployeenumber(String employeenumber) {
        this.employeenumber = employeenumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOrigo() {
        return origo;
    }

    public void setOrigo(String origo) {
        this.origo = origo;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getGraduation() {
        return graduation;
    }

    public void setGraduation(String graduation) {
        this.graduation = graduation;
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
        return "Employee{" +
                "employeeid=" + employeeid +
                ", employeenumber='" + employeenumber + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", telphone='" + telphone + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", origo='" + origo + '\'' +
                ", nation='" + nation + '\'' +
                ", education='" + education + '\'' +
                ", graduation='" + graduation + '\'' +
                ", bank='" + bank + '\'' +
                ", bankaccount='" + bankaccount + '\'' +
                ", roleid=" + roleid +
                '}';
    }
}
