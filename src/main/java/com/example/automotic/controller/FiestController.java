package com.example.automotic.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController

public class FiestController {
    @RequestMapping("hello")
    public String Hello() {
        return "hello";
    }


    @RequestMapping("sayhello")
    public String SayHello() {
        return "say hello~";
    }
}
