package com.in28minutes.springboot.myfirstwebapp.todo;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;

import org.springframework.stereotype.Service;

import jakarta.validation.Valid;

@Service
public class TodoService {
	private static int CountTodo = 0;

	private static List<Todo> todos = new ArrayList<>();
	static {
		todos.add(new Todo(++CountTodo, "Dhairya Gupta", "Learn AWS", LocalDate.now().plusYears(1), false));
		todos.add(new Todo(++CountTodo, "Dhairya Gupta", "Learn 	Devops", LocalDate.now().plusYears(2), false));
		todos.add(new Todo(++CountTodo, "Dhairya Gupta", "SpringBoots", LocalDate.now().plusYears(3), false));
	}

	public List<Todo> findByUsername(String username) {
		Predicate<? super Todo> predicate = todos->todos.getUsername().equalsIgnoreCase(username);
		return todos.stream().filter(predicate).toList();
	}

	public Todo findById(int id) {
		return todos.stream().filter(todo -> todo.getId() == id).findFirst().orElse(null);
	}

	public void addTodo(String username, String task, LocalDate date, boolean done) {
		if (username == null || username.isEmpty() || task == null || task.isEmpty() || date == null) {
			throw new IllegalArgumentException("Invalid input parameters");
		}
		
		Todo todo = new Todo(++CountTodo, username, task, date, done);
		todos.add(todo);
	}

	public void deleteTodo(int id) {
		for (int i = 0; i < todos.size(); i++) {
			if (id == todos.get(i).getId()) {
				todos.remove(i);
			}
		}
	}

	public void rearrangeTodoIds() {
		CountTodo = 0;
		for (Todo todo : todos) {
			todo.setId(++CountTodo);
		}
	}

	// Add this method to your TodoService class
	public void markTodoAsComplete(int id) {
	    Todo todo = findById(id);
	    if (todo != null) {
	        todo.setDone(!todo.isDone());
	    }
	}
	public void updateTodo(@Valid Todo updatedTodo) {
		deleteTodo(updatedTodo.getId());
		addTodo(updatedTodo.getUsername(),updatedTodo.getDescription(),updatedTodo.getDate(),updatedTodo.isDone());
	}
}
