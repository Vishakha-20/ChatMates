package com.example.chatbackend.Repo;

import com.example.chatbackend.Models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface Userrepo extends JpaRepository<User, Long> {

    Optional<Object> findByUsername(String username);
}
