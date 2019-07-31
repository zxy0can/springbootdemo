package com.aaa.service;

import com.aaa.dao.CustomerDao;
import com.aaa.entity.Customer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class CustomerServiceImpl implements CustomerService {
    @Resource
    private CustomerDao customerDao;
    @Override
    public List<Map> selectCustomers() {
        return customerDao.selectCustomers();
    }

    @Override
    public void addCustomer(Customer customer) {
        customerDao.addCustomer(customer);
    }

    @Override
    public void delCustomer(int customerid) {
        customerDao.delCustomer(customerid);
    }

    @Override
    public void updateCustomer(Customer customer) {
        customerDao.updateCustomer(customer);
    }
}
