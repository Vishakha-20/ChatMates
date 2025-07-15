package com.vishakha.chatmates.Controller;

import com.vishakha.chatmates.Models.User;
import com.vishakha.chatmates.Repo.Userrepo;
import com.vishakha.chatmates.Services.UserDetailService;
import jdk.jshell.Snippet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.net.ssl.SSLEngineResult;

@RestController
@RequestMapping("/auth")

public class AuthController {
    @Autowired
    private Userrepo userrepo;

    @Autowired
    private UserDetailService userDetailService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostMapping("/register")
    public ResponseEntity<String> register(@RequestBody User user){
      if(userrepo.findByUsername(user.getUsername()).isPresent()){
          return new ResponseEntity<>("already exist", HttpStatus.BAD_REQUEST);
      }
      else {
       user.setPassword(passwordEncoder.encode(user.getPassword()));
     userrepo.save(user);
     return new ResponseEntity<>("user created successfully",HttpStatus.CREATED);
      }
    }

}
