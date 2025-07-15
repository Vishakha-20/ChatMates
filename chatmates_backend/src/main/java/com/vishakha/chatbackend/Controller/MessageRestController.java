package com.vishakha.chatmates.Controller;

import com.vishakha.chatmates.Models.Message;
import com.vishakha.chatmates.Repo.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/messages")
public class MessageRestController {

    @Autowired
    private MessageRepository messageRepository;

    @PostMapping
    public Message saveMessage(@RequestBody Message message) {
        message.setTimestamp(LocalDateTime.now());
        return messageRepository.save(message);
    }

    @GetMapping
    public List<Message> getMessages() {
        return messageRepository.findAll();
    }
}
