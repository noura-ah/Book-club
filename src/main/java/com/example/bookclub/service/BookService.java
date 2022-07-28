package com.example.bookclub.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.bookclub.models.Book;
import com.example.bookclub.repository.BookRepository;

@Service
public class BookService {
	private final BookRepository bookRepository;

	public BookService(BookRepository bookRepository) {
		this.bookRepository = bookRepository;
	}
	
	public List<Book> allBooks() {
        	return  bookRepository.findAll();
    	}
	
	public Book createBook(Book b) {
		return  bookRepository.save(b);
	    }
	
	public Book findBook(Long id) {
	    Optional<Book> optionalBook =  bookRepository.findById(id);
	    return optionalBook.isPresent()?  optionalBook.get() : null;
	}
	
	public Book updateBook(Book book) {
		return  bookRepository.save(book);
	    }
	
	public void deleteBook(Long id) {
		 bookRepository.deleteById(id);
    }
}
