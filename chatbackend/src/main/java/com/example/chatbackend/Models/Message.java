package com.example.chatbackend.Models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

@Entity
public class Message {
    @Id
    @GeneratedValue
    private Long id;
    private String sender;
    private String content;
    private LocalDateTime timestamp;
}
