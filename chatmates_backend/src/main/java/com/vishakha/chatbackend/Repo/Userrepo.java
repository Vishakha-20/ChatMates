package com.vishakha.chatmates.Repo;

import com.vishakha.chatmates.Models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface Userrepo extends JpaRepository<User, Long> {

    Optional<Object> findByUsername(String username);
}
