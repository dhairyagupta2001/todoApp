package com.in28minutes.springboot.myfirstwebapp.todo;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class TodoService {
	private static int CountTodo=0;
	
	private static List<Todo> todos=new ArrayList<>();
	static {
		todos.add(new Todo(++CountTodo, "Dhairya Gupta", "Learn AWS", LocalDate.now().plusYears(1), false));
		todos.add(new Todo(++CountTodo, "Dhairya Gupta", "Learn 	Devops", LocalDate.now().plusYears(2), false));
		todos.add(new Todo(++CountTodo, "Dhairya Gupta", "SpringBoots", LocalDate.now().plusYears(3), false));
	}

	public List<Todo> findByUsername(String username) {
		return todos;
	}
	
	public void addTodo(String username, String task, LocalDate date, boolean done) {
	    if (username == null || username.isEmpty() || task == null || task.isEmpty() || date == null) {
	        throw new IllegalArgumentException("Invalid input parameters");
	    }
	    Todo todo = new Todo(++CountTodo, username, task, date, done);
	    todos.add(todo);
	}

}
