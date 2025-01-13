package com.in28minutes.springboot.myfirstwebapp.todo;

import java.time.LocalDate;
import jakarta.validation.constraints.Size;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.FutureOrPresent;

public class Todo {
    private int id;
    
    @NotEmpty(message = "Username is required")
    private String username;
    
    @NotEmpty(message = "Description cannot be empty")
    @Size(min = 10, message = "Description should have at least 10 characters!")
    private String description;
    
    @NotNull(message = "Date is required")
    @FutureOrPresent(message = "Date cannot be in the past")
    private LocalDate date;
    
    @NotNull(message = "Task status must be specified")
    private Boolean done;


    // Constructor
    public Todo(int id, String username, String description, LocalDate date, boolean done) {
        this.id = id;
        this.username = username;
        this.description = description;
        this.date = date;
        this.done = done;
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getDescription() {
        return description;
    }

    public LocalDate getDate() {
        return date;
    }

    public boolean isDone() {
        return done;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public void setDone(boolean done) {
        this.done = done;
    }

    @Override
    public String toString() {
        return "Todo [id=" + id + 
               ", username=" + username + 
               ", description=" + description + 
               ", date=" + date + 
               ", done=" + done + "]";
    }
}