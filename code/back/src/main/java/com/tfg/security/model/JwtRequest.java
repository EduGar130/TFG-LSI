package com.tfg.security.model;

import lombok.Data;

@Data
public class JwtRequest {
    private String username;
    private String password;
}
