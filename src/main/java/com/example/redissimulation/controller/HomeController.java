package com.example.redissimulation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String index() {
        return "index"; // JSP 경로 (prefix와 suffix를 자동으로 적용)
    }
}