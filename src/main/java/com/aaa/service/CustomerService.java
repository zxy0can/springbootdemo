package com.aaa.service;

import com.aaa.entity.Customer;

import java.util.List;
import java.util.Map;

public interface CustomerService {
    public List<Map> selectCustomers();
    public void addCustomer(Customer customer);
    public void delCustomer(int customerid);
    public void updateCustomer(Customer customer);
}
