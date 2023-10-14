package com.example.devopsintegration.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ResourceController {

    @GetMapping("/message")
    private ResponseEntity<?> message(){
        return ResponseEntity.ok("Hello world");
    }
}
