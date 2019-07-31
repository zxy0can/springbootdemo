package com.aaa.controller;

import com.aaa.entity.Employee;
import com.aaa.service.RolePermisssionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class RolePermisssionController {
   @Resource
   private RolePermisssionService rolePermisssionService;
    @RequestMapping("/menu")
    @ResponseBody
    public List<Map> query(HttpSession session){
        Employee employee= (Employee) session.getAttribute("userName");
        System.out.println(employee);
        return rolePermisssionService.query(employee.getEmployeeid());
    }
}
