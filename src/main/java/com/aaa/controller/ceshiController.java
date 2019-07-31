package com.aaa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ceshiController {
    @RequestMapping("/show")
    public String show(){
        return "show";
    }
}
