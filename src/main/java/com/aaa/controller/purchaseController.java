package com.aaa.controller;

import com.aaa.service.PurchaseService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class purchaseController {
     @Resource
    private PurchaseService purchaseService;
     //申请采购
    @RequestMapping("/purchase")
    public String purchase(){
        return "houtai/purchase";
    }
    //采购审核
    @RequestMapping("/review")
    public String review(){
        return "houtai/review";
    }
     //自动加载订单号
    @RequestMapping("/getNo")
    @ResponseBody
    public String getNo(){
        String orderid=null;
        int count=  purchaseService.getCount();
        System.out.println(count);
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
        if(count==0){
            orderid="NO"+sdf.format(new Date())+"001";
        }else
        if(count<10){
            count++;
            orderid="NO"+sdf.format(new Date())+"00"+count;
        }else if(count<100){
            count++;
            orderid="NO"+sdf.format(new Date())+"0"+count+1;
        }else{
            count++;
            orderid="NO"+sdf.format(new Date())+count+1;
        }
        return  orderid;
    }
    //采购提交
    @RequestMapping("/applyOrder")
    @ResponseBody//向客户端响应一个json数据
    public String applyOrder(@RequestBody Map map){//从客户端接收一个数据
        boolean flag=purchaseService.addApplyOrder(map);
        if(flag)
            return "true";
        else
            return "false";
    }
    @RequestMapping("/getPurchase")
    @ResponseBody
    public List<Map> getPurchase(){
        System.out.println("aaaaaaaaaa");
        return purchaseService.getPurchase();
    }
    @RequestMapping("/getPurchaseDetail")
    @ResponseBody
    public List<Map> getPurchaseDetail(String purordernumber){
        return purchaseService.getPurchaseDetail(purordernumber);
    }
}
