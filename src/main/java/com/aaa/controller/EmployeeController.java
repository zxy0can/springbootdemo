package com.aaa.controller;

import com.aaa.entity.Employee;
import com.aaa.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class EmployeeController {
    @Resource
    private EmployeeService employeeService;

    @RequestMapping("/toBackIndex")
    public String toBackIndex(){
        return"houtai/backIndex";
    }

    @RequestMapping("/login")
    @ResponseBody
    public String login(Employee employee, HttpSession session){
        Employee employee1=employeeService.login(employee);
        if(employee1!=null){
            session.setAttribute("userName",employee1);
            return "true";
        }else
            return "false";
    }
    @RequestMapping("/Employee")
    public String Employee(){
        return "houtai/Employee";
    }
    @RequestMapping("/getEmployee")
    @ResponseBody
    public List<Map> getEmployee() {
        return employeeService.getEmployee();
    }

     @RequestMapping("/addEmployee")
     @ResponseBody
    public String addEmployee(Employee employee){
        employeeService.addEmployee(employee);
         System.out.println(employee);
        return "true";
    }
    @RequestMapping("/updateEmployee")
    @ResponseBody
    public String updateEmployee(Employee employee){
        employeeService.updateEmployee(employee);
        return  "true";
    }
    @RequestMapping("/deleteEmployee")
    @ResponseBody
    public String deleteEmployee(int employeeid){
        employeeService.deleteEmployee(employeeid);
        return "true";
    }

}
