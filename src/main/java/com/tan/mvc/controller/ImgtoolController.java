package com.tan.mvc.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/imgdeal")
public class ImgtoolController {
    private static Logger log = LoggerFactory.getLogger(ImgtoolController.class);


    @RequestMapping("/main")
    public String imgmain() {
        return "imgjcrop/imgmain";
    }



}