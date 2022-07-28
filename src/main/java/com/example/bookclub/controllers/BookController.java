package com.example.bookclub.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.bookclub.models.Book;
import com.example.bookclub.models.User;
import com.example.bookclub.service.BookService;
import com.example.bookclub.service.UserService;

@Controller
@RequestMapping("/books")
public class BookController {
	private final BookService bookService;
	private final UserService userService;

	public BookController(BookService bookService,  UserService userService) {
		this.bookService = bookService;
		this.userService = userService;
	}



	@GetMapping("")
	public String home(Model model,HttpSession session, RedirectAttributes redirectAttributes) { 
		
		if(session.getAttribute("user_id") == null) {
			redirectAttributes.addFlashAttribute("error", "you need to login/register first");
			return "redirect:/";
		}
		Long id= (Long) session.getAttribute("user_id");
		User user = userService.findUser(id);
		model.addAttribute("username",user.getUsername());
		List<Book> books = bookService.allBooks();
		model.addAttribute("books",books);
		return "/books.jsp";
	}
	
	// show form page to add a new book 
	@GetMapping(value="/new")
	public String add(Model model,
			RedirectAttributes redirectAttributes,
			HttpSession session) {
		if(session.getAttribute("user_id") == null) {
			redirectAttributes.addFlashAttribute("error", "you need to login/register first");
			return "redirect:/";
		}
		if (!model.containsAttribute("book")) {
			model.addAttribute("book",new Book());
		}
		return "/new.jsp";
	}
		
	// add new book
	@PostMapping(value="/new")
	public String add(Model model, @Valid @ModelAttribute("book") Book book, 
			BindingResult result, 
			RedirectAttributes redirectAttributes,
			HttpSession session
			) {
		if (result.hasErrors()) {
			redirectAttributes.addFlashAttribute("book",book);
			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.book",result);
			return "redirect:./new";
        } 
		
		Long id= (Long) session.getAttribute("user_id");
		User user = userService.findUser(id);
		book.setUser(user);
		bookService.createBook(book);
    	redirectAttributes.addFlashAttribute("success", "Book was created successfully");
        return "redirect:./";
	        
		}
	// show book details
	@RequestMapping("/{id}")
	public String show(@PathVariable(value="id") Long id, Model model, HttpSession session) {
		
		Book book = bookService.findBook(id);
	    model.addAttribute("book", book);
		return "/show_book.jsp";
	}
	
	// show the edit form page 
	@RequestMapping("/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		if (!model.containsAttribute("book")) {
			Book book = bookService.findBook(id);
			model.addAttribute("book", book);
		}
	    return "/edit.jsp";
	}
	    
	// edit 
	@PutMapping(value="/{id}")
	public String update(@Valid @ModelAttribute("book") Book book , BindingResult result, RedirectAttributes redirectAttributes, HttpSession session) {
		if (result.hasErrors()) {
			redirectAttributes.addFlashAttribute("book",book);
			redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.book",result);
			return "redirect:./"+book.getId()+"/edit";
		}
		Long id= (Long) session.getAttribute("user_id");
		User user = userService.findUser(id);
		book.setUser(user);
		bookService.updateBook(book);
		redirectAttributes.addFlashAttribute("success", "Book was edited successfully");
		return "redirect:./";
		}
}
