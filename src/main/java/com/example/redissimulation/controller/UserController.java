package com.example.redissimulation.controller;


import com.example.redissimulation.model.User;
import com.example.redissimulation.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class UserController {

     @Autowired
     private UserService userService;

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, HttpSession session) {
        // 사용자 인증 로직 (예: DB에서 사용자 조회)
        User user = userService.authenticate(username, password);
        if (user != null) {
            // 세션에 사용자 정보 저장
            session.setAttribute("user", user);
            return "Login successful!";
        } else {
            return "Login failed!";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // 세션 무효화
        session.invalidate();
        return "Logout successful!";
    }
}
