package com.aaa.dao;

import com.aaa.entity.Provider;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface ProviderDao {
      @Select("select * from provider")
      public List<Map> getProvider();
      @Insert("Insert into provider (providernumber, providername, contacts, telphone, address, email, bank, bankaccount) " +
              "values(#{providernumber},#{providername},#{contacts},#{telphone},#{address},#{email},#{bank},#{bankaccount})")
      public void addProvider(Provider provider);
      @Update("update provider set providernumber=#{providernumber}, providername=#{providername}, contacts=#{contacts}, " +
              "telphone=#{telphone}, address=#{address}, email=#{email}, bank=#{bank}, bankaccount=#{bankaccount}" +
              " where providerid=#{providerid} ")
      public void updateProvider(Provider provider);
      @Delete("delete from provider where providerid=#{providerid} ")
      public void deleteProvider(int providerid);

}
