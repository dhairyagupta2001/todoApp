package com.in28minutes.springboot.myfirstwebapp.todo;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class TodoController {
	private TodoService todoservice;

	public TodoController(TodoService todoservice) {
		super();
		this.todoservice = todoservice;
	}

	@RequestMapping("todo-list")
	public String listAlltools(ModelMap model) {
		List<Todo> todos=todoservice.findByUsername("Dhairya Gupta");
		model.addAttribute("todos",todos);
		return "listTodos";
	}
	
	@RequestMapping(value="add-todo" ,method=RequestMethod.GET)
	public String ShowNewTodo(ModelMap model) {
		Todo todo=new Todo(0,"","",LocalDate.now(),false);
		model.put("todo", todo);
		return "todo";
	}
	
	@RequestMapping(value = "add-todo", method = RequestMethod.POST)
	public String addNewTodo(
	        Todo todo,
	        RedirectAttributes redirectAttributes) {
	    try {
	        LocalDate parsedDate = todo.getDate();
	        todoservice.addTodo(todo.getUsername(), todo.getDescription(), parsedDate, false);
	        redirectAttributes.addFlashAttribute("successMessage", "Todo added successfully!");
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("errorMessage", "Failed to add todo. Invalid date format.");
	    }
	    return "redirect:todo-list";
	}

}
