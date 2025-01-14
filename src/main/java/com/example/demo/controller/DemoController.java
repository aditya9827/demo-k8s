package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path="/v1")
public class DemoController {

    @GetMapping(path="hello")
    public String testHello(){
        return "hello world";
    }
}
