package com.vishakha.chatmates.Controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.Map;

@CrossOrigin(origins = "*") // Optional: Allows cross-origin for frontend
@Controller
public class ChatController {

    @MessageMapping("/send") // matches /app/send from frontend
    @SendTo("/topic/messages") // all clients subscribed here will receive it
    public Map<String, String> sendMessage(Map<String, String> message) {
        return message; // echo back or process/save to DB
    }
}
