package com.example.bookclub.repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.example.bookclub.models.User;

public interface UserRepository extends CrudRepository<User, Long>{
	Optional<User> findByEmail(String email);
	
}
