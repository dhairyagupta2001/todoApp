<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Task</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f9;
            margin: 0;
            padding: 20px;
        }

        .modal-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form div {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-actions {
            display: flex;
            justify-content: space-between;
        }

        .form-actions button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: #fff;
        }

        .cancel-btn {
            background: #dc3545;
        }

        .submit-btn {
            background: #28a745;
        }

        .form-actions button:hover {
            opacity: 0.9;
        }
        
        .red-btn {
        background-color: red;
        color: white;
        text-align: center;
        display: inline-block;
        width: 100px;
        padding: 10px;
        border: none;
        border-radius: 4px;
        text-decoration: none; /* Removes underline */
    }
    .red-btn:hover {
        background-color: darkred; /* Darker shade on hover */
    }
    
    .green-btn {
        background-color: green;
        color: white;
        text-align: center;
        display: inline-block;
        width: 100px;
        padding: 10px;
        border: none;
        border-radius: 4px;
        text-decoration: none;
    }
    .green-btn:hover {
        background-color: darkred; 
    }
    </style>
</head>
<body>
    <div class="modal-container">
        <h1>Add New Task</h1>
        <form:form  method="post" modelAttribute="todo">
            <div>
                <label for="Username">Username:</label>
                <form:input type="text" id="Username" path="Username" required="required" />
            </div>
            <div>
                <label for="description">Description:</label>
                <form:input type="text" id="description" path="description" required="required" />
            </div>
            <div>
                <label for="date">Date:</label>
                <form:input type="date" id="date" path="date" required="required" />
            </div>
            <form:input type="hidden" id="id" path="id"  />
            <form:input type="hidden" id="done" path="done"  />
            <div class="form-actions">
                <a href="todo-list" class="red-btn">Cancel</a>
                <input type="submit" class="green-btn" />
            </div>
        </form:form>
    </div>
</body>
</html>
