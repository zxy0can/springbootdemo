package com.aaa.service;

import com.aaa.entity.Employee;

import java.util.List;
import java.util.Map;

public interface EmployeeService {
    public Employee login(Employee employee);
    public List<Map> getEmployee();
    public void addEmployee(Employee employee);
    public void updateEmployee(Employee employee);
    public void deleteEmployee(int employeeid);

}
