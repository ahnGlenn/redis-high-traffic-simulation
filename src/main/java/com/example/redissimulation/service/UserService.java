package com.example.redissimulation.service;

import com.example.redissimulation.model.User;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    public User authenticate(String username, String password) {
        // 사용자 인증 로직 구현 (DB 조회 등)
        // 예제에서는 간단한 하드코딩을 사용
        if ("admin".equals(username) && "password".equals(password)) {
            return new User(username);
        }
        return null; // 인증 실패
    }
}
