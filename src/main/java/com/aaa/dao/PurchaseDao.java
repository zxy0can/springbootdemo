package com.aaa.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface PurchaseDao {
  @Select("select count(purorderid) from purchasorderslist")
    public int getCount();
    //向总表进行添加
    @Insert("insert into purchasorderslist(purordernumber,purchasetime,purchaser,applydepartment,prices,state,createTime,stateid)" +
            "values(#{purordernumber},now(),#{purchaser},#{applydepartment},#{prices},null,now(),1)")
    public int addPurchaseMaster(Map map);
    //向详情表中进行添加
    @Insert("<script>insert into purchasedetail(purordernumber,goodsnumber,purnumber,subtotal,createtime) values" +
            "<foreach collection=\"list\" item=\"item\" separator=\",\">" +
            "(#{item.purordernumber},#{item.goodsnumber},#{item.purnumber},#{item.subtotal},now())" +
            "</foreach></script>")
    public int addPurchaseDetail(@Param(value = "list") List<Map> list);
    //获得采购列表以待审核
    @Select("Select * from purchasorderslist p join reviewstate r on p.stateid=r.stateid ")
    public List<Map> getPurchase();
  @Select("Select * from purchasedetail where purordernumber=#{purordernumber}")
  public List<Map> getPurchaseDetail(String purordernumber);

}
