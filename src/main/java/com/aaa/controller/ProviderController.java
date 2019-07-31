package com.aaa.controller;

import com.aaa.entity.Message;
import com.aaa.entity.Provider;
import com.aaa.service.ProviderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
public class ProviderController {
    @Resource
    public ProviderService providerService;
    @RequestMapping("/provider")
    public String Provider(){
        return "houtai/provider";
    }
    @RequestMapping("/getProvider")
    @ResponseBody
    public List<Map> getProvider(){
        return providerService.getProvider();
    }
    @RequestMapping("/addProvider")
    @ResponseBody
    public String addProvider(Provider provider){
        providerService.addProvider(provider);
        return "true";
    }
    @RequestMapping("/updateProvider")
    @ResponseBody
    public String updateProvider(Provider provider){
        providerService.updateProvider(provider);
        return  "true";
    }
    @RequestMapping("/deleteProvider")
    @ResponseBody
    public Message deleteProvider(int providerid){
        providerService.deleteProvider(providerid);
        Message mes=new Message("true");
        return mes;
    }
}
