package com.aaa.dao;

import com.aaa.entity.Employee;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface EmployeeDao {

    @Select("select * from employee where employeenumber=#{employeenumber} and password=#{password}")
    public Employee login(Employee employee);

    @Select("select * from employee e join role r on e.roleid=r.roleid ")
    public List<Map> getEmployee();
    @Insert("insert into employee( roleid, employeenumber,name,sex,telphone,email, address, origo, nation , education , graduation, bank, bankaccount, password)" +
            " values(#{roleid},#{employeenumber},#{name},#{sex},#{telphone},#{email},#{address},#{origo},#{nation},#{education},#{graduation},#{bank},#{bankaccount},#{password})")
    public void addEmployee(Employee employee);
    @Update("update employee set roleid=#{roleid},sex=#{sex},address=#{address},origo=#{origo},nation=#{nation},education=#{education},graduation=#{graduation},employeeid=#{employeeid}, employeenumber=#{employeenumber}, name=#{name}, " +
            "telphone=#{telphone}, address=#{address}, email=#{email}, bank=#{bank}, bankaccount=#{bankaccount}" +
            " where employeeid=#{employeeid} ")
    public void updateEmployee(Employee employee);
    @Delete("delete from employee where employeeid=#{employeeid} ")
    public void deleteEmployee(int employeeid);
}
