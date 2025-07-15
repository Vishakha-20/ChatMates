package com.vishakha.chatmates.Models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

import java.time.LocalDateTime;

//ok so jyare first pela to user message nakhvo hase to aa vaprse ok
@Entity
public class Message {
    @Id
    @GeneratedValue
    private Long id;
    private String sender;
    private String content;
    private LocalDateTime timestamp;

    public void setTimestamp(LocalDateTime now) {
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }
}
