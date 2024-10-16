package com.example.redissimulation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String index() {
        return "index"; // JSP 경로 (prefix와 suffix를 자동으로 적용)
    }

    /*
    * 메인 페이지로 이동 
    */
    @GetMapping("/main")
    public String showMainPage() {
        return "main"; // 실제로는 /WEB-INF/views/main.jsp를 렌더링
    }
}