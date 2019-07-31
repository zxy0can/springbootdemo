package com.aaa.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface GoodsDao {
    @Select("select * from goods g join goodstype gt on g.typenumber=gt.typenumber")
    public List<Map> queryGoods();
}
