<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Todo List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.classic-header {
    font-family: 'Georgia', serif; /* Classic serif font */
    font-size: 40px;
    font-weight: 700;
    color: #333;  /* Dark, classic text color */
    text-align: center; /* Center alignment for a balanced look */
    text-transform: uppercase; /* Uppercase for more formality */
    letter-spacing: 2px; /* Increased letter spacing for elegance */
    margin-bottom: 40px; /* Add more space beneath the header */
    text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
}
 body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #00c6ff, #0072ff); /* Bluish gradient */
            color: #333;
            margin: 0;
            padding: 0;
        }

h1 {
	color: #333;
	text-align: center;
	margin-bottom: 30px;
}

.todo-container {
	max-width: 1000px;
	margin: 20px auto;
	padding: 20px;
	background: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	overflow-x: auto;
}

.status-badge {
	padding: 6px 12px;
	border-radius: 20px;
	font-weight: 500;
	cursor: pointer;
	transition: all 0.3s ease;
}

.status-pending {
	background-color: #ffeeba;
	color: #856404;
}

.status-completed {
	background-color: #d4edda;
	color: #155724;
}

.completed-row {
	background-color: #f8f9fa !important;
	color: #6c757d;
}

.completed-row td {
	text-decoration: line-through;
}

.completed-row td:last-child, .completed-row td.status-cell {
	text-decoration: none;
}

.action-buttons {
	display: flex;
	gap: 5px;
}

.toast-container {
	position: fixed;
	top: 20px;
	right: 20px;
	z-index: 1050;
}

.custom-toast {
	background: white;
	border-radius: 8px;
	padding: 15px;
	margin-bottom: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
	animation: slideIn 0.5s ease-out;
}

@
keyframes slideIn {from { transform:translateX(100%);
	opacity: 0;
}

to {
	transform: translateX(0);
	opacity: 1;
}

}
@media ( max-width : 768px) {
	.action-buttons {
		flex-direction: column;
		gap: 3px;
	}
	.action-btn {
		width: 100%;
		text-align: center;
	}
}
</style>
</head>
<body>


	<div class="toast-container"></div>
	<%@include file="Common/navigation.jspf"%>
	<div class="container mt-5 pt-5">
		<h1 class="classic-header">Your Todo List</h1>
		<div class="todo-container">
			<a href='add-todo' class="btn btn-success mb-3">Add Task</a>

			<c:if test="${not empty successMessage}">
				<div class="alert alert-success alert-dismissible fade show"
					role="alert">
					${successMessage}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>

			<c:if test="${not empty errorMessage}">
				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">
					${errorMessage}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>

			<c:choose>
				<c:when test="${not empty todos}">
					<table class="table table-hover">
						<thead class="table-primary">
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
								<tr id="todo-row-${todo.id}"
									class="${todo.done ? 'completed-row' : ''}">
									<td>${todo.id}</td>
									<td>${todo.username}</td>
									<td>${todo.description}</td>
									<td>${todo.date}</td>
									<td class="status-cell"><span
										class="status-badge ${todo.done ? 'status-completed' : 'status-pending'}"
										onclick="toggleStatus(${todo.id}, ${todo.done})">
											${todo.done ? 'Completed' : 'Pending'} </span></td>
									<td>
										<div class="action-buttons">
											<a href="Complete-todo?id=${todo.id}"
												onclick="toggleStatus(${todo.id}, ${todo.done})"
												class="btn ${todo.done ? 'btn-warning' : 'btn-success'} btn-sm">
												${todo.done ? 'Mark Pending' : 'Complete'} </a> <a
												href="update-todo?id=${todo.id}"
												class="btn btn-primary btn-sm">Update</a> <a
												href="delete-todo?id=${todo.id}"
												class="btn btn-danger btn-sm">Delete</a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<div class="text-center text-muted">No tasks to display!</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	
	function showToast(message, type) {
	    const toastContainer = document.querySelector('.toast-container');
	    const toast = document.createElement('div');
	    
	    // Use standard JavaScript for class assignment instead of JSP EL
	    toast.className = 'custom-toast text-white ' + (type === 'success' ? 'bg-success' : 'bg-danger');
	    toast.innerHTML = message;
	    
	    toastContainer.appendChild(toast);
	    
	    setTimeout(() => {
	        toast.style.animation = 'fadeOut 0.5s ease-out';
	        setTimeout(() => toastContainer.removeChild(toast), 500);
	    }, 3000);
	}

        function toggleStatus(id, currentStatus) {
            const newStatus = !currentStatus;
            const row = document.getElementById(`todo-row-${todo.id}`);
            const statusBadge = row.querySelector('.status-badge');
            
            fetch(`Complete-todo?id=${todo.id}`)
                .then(response => {
                    if (response.ok) {
                        if (newStatus) {
                            row.classList.add('completed-row');
                            statusBadge.classList.remove('status-pending');
                            statusBadge.classList.add('status-completed');
                            statusBadge.textContent = 'Completed';
                            showToast('Task marked as complete!');
                        } else {
                            row.classList.remove('completed-row');
                            statusBadge.classList.remove('status-completed');
                            statusBadge.classList.add('status-pending');
                            statusBadge.textContent = 'Pending';
                            showToast('Task marked as pending!');
                        }
                    } else {
                        showToast('Failed to update task status', 'error');
                    }
                })
                .catch(error => {
                    showToast('Error updating task status', 'error');
                    console.error('Error:', error);
                });
        }




    </script>
    <%@include file="Common/footer.jspf"%>
</body>
</html>