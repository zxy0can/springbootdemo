package com.aaa.controller;

import com.aaa.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
public class RoleController {
    @Resource
    private RoleService roleService;

    @RequestMapping("/getRoleName")
    @ResponseBody
    public List<Map> getRoleName(){
        return  roleService.getRoleName();
    }
}
