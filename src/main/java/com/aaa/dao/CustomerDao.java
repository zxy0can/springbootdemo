package com.aaa.dao;

import com.aaa.entity.Customer;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface CustomerDao {
    @Select(" select * from customer ")
    public List<Map> selectCustomers();

    @Insert("insert into customer values(#{customerid},#{number},#{contacts},#{telphone},#{address},#{email},#{bank},#{bankaccount})")
    public void addCustomer(Customer customer);


    @Delete("delete from customer where customerid=#{customerid}")
    public void delCustomer(int customerid);

    @Update("update customer set number=#{number},contacts=#{contacts},telphone=#{telphone},address=#{address},email=#{email},bank=#{bank},bankaccount=#{bankaccount} where customerid=#{customerid}")
    public void updateCustomer(Customer customer);
}
