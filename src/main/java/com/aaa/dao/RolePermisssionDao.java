package com.aaa.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
@Mapper
public interface RolePermisssionDao {
    @Select("select * from permission p\n" +
            "\n" +
            "join rolepermission rp on p.perid=rp.periid\n" +
            "join role r on r.roleid=rp.roleid\n" +
            "join employee e on e.roleid=r.roleid where e.employeeid=#{employeeid}")
    public List<Map> query(Integer employeeid);

}
