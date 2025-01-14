package com.in28minutes.springboot.myfirstwebapp.todo;

import java.time.LocalDate;
import java.util.List;

import org.springframework.context.annotation.Description;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
public class TodoController {
	private TodoService todoservice;

	public TodoController(TodoService todoservice) {
		super();
		this.todoservice = todoservice;
	}

	private String getLoggedinUsername() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		return authentication.getName();
	}
	
	@RequestMapping("todo-list")
	public String listAlltools(ModelMap model) {
		String username=getLoggedinUsername();
		List<Todo> todos = todoservice.findByUsername(username);
		model.addAttribute("todos", todos);
		return "listTodos";
	}

	@RequestMapping("Complete-todo")
	public String completeTodo(@RequestParam int id, RedirectAttributes redirectAttributes) {
		try {
			todoservice.markTodoAsComplete(id);
			if (todoservice.findById(id).isDone()) {
				redirectAttributes.addFlashAttribute("successMessage", "Task marked as complete!");
			} else {
				redirectAttributes.addFlashAttribute("successMessage", "Task marked as pending!");
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMessage", "Failed to mark task as complete. Please try again.");
		}
		return "redirect:todo-list";
	}

	@RequestMapping("delete-todo")
	public String deleteTodo(@RequestParam int id, HttpServletRequest request, RedirectAttributes redirectAttributes) {
	    // Prompt user for confirmation
	    String confirmDeletion = request.getParameter("confirm");
	    if (confirmDeletion == null || !confirmDeletion.equals("true")) {
	        // Redirect to a confirmation page or include a confirmation message
	        return "redirect:confirm-delete-todo?id=" + id;
	    }

	    // If confirmed, proceed with deletion
	    todoservice.deleteTodo(id);
	    todoservice.rearrangeTodoIds();
	    redirectAttributes.addFlashAttribute("successMessage", "Task Deleted Sucessfully!");
	    return "redirect:todo-list?message=Task+deleted+successfully";
	}


	@RequestMapping("confirm-delete-todo")
	public String confirmDeleteTodo(@RequestParam int id, Model model) {
		model.addAttribute("id", id);
		return "confirm-delete"; // This renders a confirmation JSP/HTML page
	}

	@RequestMapping(value = "add-todo", method = RequestMethod.GET)
	public String ShowNewTodo(ModelMap model) {
		Todo todo = new Todo(0, "", "", LocalDate.now(), false);
		model.put("todo", todo);
		return "todo";
	}

	@RequestMapping(value = "add-todo", method = RequestMethod.POST)
	public String addNewTodo(@Valid @ModelAttribute("todo") Todo todo, BindingResult results,
			RedirectAttributes redirectAttributes, ModelMap model) {
		if (results.hasErrors()) {
			model.addAttribute("org.springframework.validation.BindingResult.todo", results);
			return "todo";
		}

		try {
			todoservice.addTodo(todo.getUsername(), todo.getDescription(), todo.getDate(), false);
			redirectAttributes.addFlashAttribute("successMessage", "Todo added successfully!");
		} catch (Exception e) {
			// Handle unexpected errors
			redirectAttributes.addFlashAttribute("errorMessage", "Failed to add todo. Please try again.");
		}

		return "redirect:todo-list";
	}

	@RequestMapping(value = "update-todo", method = RequestMethod.GET)
	public String showUpdateTodoForm(@RequestParam int id, ModelMap model) {
		Todo todo = todoservice.findById(id);
		model.put("todo", todo);
		return "todo";
	}

	@RequestMapping(value = "update-todo", method = RequestMethod.POST)
	public String UpdateTodo(@Valid @ModelAttribute("todo") Todo todo, BindingResult results,
			RedirectAttributes redirectAttributes, ModelMap model) {
		if (results.hasErrors()) {
			model.addAttribute("org.springframework.validation.BindingResult.todo", results);
			return "todo";
		}

		try {
			todoservice.updateTodo(todo);
			todoservice.rearrangeTodoIds();
			redirectAttributes.addFlashAttribute("successMessage", "Todo added successfully!");
		} catch (Exception e) {
			// Handle unexpected errors
			redirectAttributes.addFlashAttribute("errorMessage", "Failed to add todo. Please try again.");
		}

		return "redirect:todo-list";
	}
}
