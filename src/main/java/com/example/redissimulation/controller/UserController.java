package com.example.redissimulation.controller;


import com.example.redissimulation.dto.LoginRequest;
import com.example.redissimulation.model.User;
import com.example.redissimulation.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public ResponseEntity<Map<String, String>> login(@RequestBody LoginRequest loginRequest, HttpSession session) {
        String email = loginRequest.getEmail();
        String password = loginRequest.getPassword();

        // 사용자 인증 로직 (예: DB에서 사용자 조회)
        User user = userService.authenticate(email, password);
        Map<String, String> response = new HashMap<>();
        if (user != null) {
            // session.setAttribute("user", user); // 여기선 레디스에 쌓을거라 주석처리.
            response.put("message", "Login successful!");
            response.put("userEmail", user.getEmail());
            return ResponseEntity.ok(response);
        } else {
            response.put("message", "Login failed!");
            return ResponseEntity.status(401).body(response);
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // 세션 무효화
        session.invalidate();
        return "Logout successful!";
    }
}
