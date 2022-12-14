package com.example.bookclub.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.bookclub.models.Book;

public interface BookRepository extends CrudRepository<Book, Long>{
	List<Book> findAll();
}
