package com.example.redissimulation.model;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor  // 기본 생성자 생성
@AllArgsConstructor // 모든 필드를 인자로 받는 생성자 생성
@Builder // 빌더 패턴을 통해 원하는 필드만 설정하여 객체를 생성
public class User implements Serializable {
    private String email;
    private String password;
}