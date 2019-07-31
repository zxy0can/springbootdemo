package com.aaa.controller;

import com.aaa.entity.Customer;
import com.aaa.service.CustomerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
public class CustomerController {
    @Resource
    private CustomerService customerServices;

    @RequestMapping("/toShowCustomer")
    public String toShowCus(){
        return "houtai/showCustomer";

    }

    @RequestMapping("/selectCustomer")
    @ResponseBody
    public List<Map> selectCustomer(){
        return  customerServices.selectCustomers();
    }


    @RequestMapping("/addCustomerSucess")
    @ResponseBody
    public String addCustomer(Customer customer){
        //调用service添加
        customerServices.addCustomer(customer);
        return "添加成功！";

    }

    @RequestMapping(value = "/delCustomerSucess")
    @ResponseBody
    public String del(@RequestParam("customerid") int customerid, ModelAndView mv) {
        customerServices.delCustomer(customerid);
        return "true";
    }

    @RequestMapping("/updateCustomer")
    @ResponseBody
    public String updateCustomer(Customer customer){
        customerServices.updateCustomer(customer);
        return "true";
    }
}
