<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Todo List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f9;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        .todo-container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #2575fc;
            color: #fff;
        }

        tr:nth-child(even) {
            background: #f9f9f9;
        }

        tr:hover {
            background: #f1f1f1;
        }

        .completed {
            text-decoration: line-through;
            color: #888;
        }

        .action-btn {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: #fff;
        }

        .complete-btn {
            background: #28a745;
        }

        .delete-btn {
            background: #dc3545;
        }

        .add-btn {
            background: #007bff;
            margin-bottom: 20px;
            display: block;
            text-align: center;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            max-width: 400px;
            width: 100%;
        }

        .modal-header {
            font-size: 18px;
            margin-bottom: 15px;
        }

        .modal-actions {
            text-align: right;
            margin-top: 15px;
        }

        .modal-actions button {
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <h1>Your Todo List</h1>
    <div class="todo-container">
        <a href='add-todo' class="btn btn-success mb-3">Add Task</a>
        
        <c:choose>
            <c:when test="${not empty todos}">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Description</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="todo" items="${todos}">
                            <tr class="${todo.done ? 'completed' : ''}">
                                <td>${todo.id}</td>
                                <td>${todo.username}</td>
                                <td>${todo.description}</td>
                                <td>${todo.date}</td>
                                <td>${todo.done ? 'Completed' : 'Pending'}</td>
                                <td>
                                    <button class="action-btn complete-btn" onclick="markComplete(${todo.id})">Complete</button>
                                    <button class="action-btn delete-btn" onclick="deleteTask(${todo.id})">Delete</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p style="text-align: center; color: #888;">No tasks to display!</p>
            </c:otherwise>
        </c:choose>
    </div>

   <script>
    function redirectToAddTask() {
        window.location.href = "todo.jsp"; // Redirect to addTask.jsp
    }
</script>

    <script>
        function openModal() {
            document.getElementById('addTaskModal').style.display = 'flex';
        }

        function closeModal() {
            document.getElementById('addTaskModal').style.display = 'none';
        }

        function markComplete(id) {
            alert(`Marking task with ID ${id} as complete.`);
            // Add AJAX or redirection logic here for marking a task as completed.
        }

        function deleteTask(id) {
            const confirmDelete = confirm(`Are you sure you want to delete task with ID ${id}?`);
            if (confirmDelete) {
                alert(`Deleting task with ID ${id}.`);
                // Add AJAX or redirection logic here for deleting a task.
            }
        }
    </script>
</body>
</html>
