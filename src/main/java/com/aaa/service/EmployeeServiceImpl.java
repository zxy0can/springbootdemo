package com.aaa.service;

import com.aaa.dao.EmployeeDao;
import com.aaa.entity.Employee;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class EmployeeServiceImpl implements  EmployeeService {
    @Resource
    public EmployeeDao employeeDao;
    @Override
    public Employee login(Employee employee) {
        return employeeDao.login(employee);
    }

    @Override
    public List<Map> getEmployee() {
        return employeeDao.getEmployee();
    }

    @Override
    public void addEmployee(Employee employee) {
        employeeDao.addEmployee(employee);
    }

    @Override
    public void updateEmployee(Employee employee) {
        employeeDao.updateEmployee(employee);
    }

    @Override
    public void deleteEmployee(int employeeid) {
        employeeDao.deleteEmployee(employeeid);

    }
}
