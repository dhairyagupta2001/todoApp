<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add New Task</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: 'Roboto', sans-serif;
	background: linear-gradient(135deg, #00c6ff, #0072ff);
	/* Bluish gradient */
	color: #333;
	margin: 0;
	padding: 0;
}

.modal-container {
	max-width: 500px;
	margin: 100px auto 50px;
	padding: 30px; /* Increased padding for thicker container */
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

input[type="text"], input[type="date"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

.form-actions {
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 10px;
	padding: 10px;
	/* Optional: adds spacing inside the form-actions container */
}

.form-actions button {
	padding: 10px 30px;
	/* Increased horizontal padding for better text spacing */
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
	text-decoration: none;
}

.red-btn:hover {
	background-color: darkred;
}

.green-btn {
	background-color: green;
	color: white;
	text-align: center;
	display: inline-block;
	width: auto; /* Allows the button width to adjust based on content */
	padding: 10px 20px; /* Adds more horizontal padding */
	border: none;
	border-radius: 4px;
	text-decoration: none;
}

.green-btn:hover {
	background-color: darkgreen;
}

.invalid-feedback {
	display: block;
	width: 100%;
	margin-top: 0.25rem;
	font-size: 0.875em;
	color: #dc3545;
}

.is-invalid {
	border-color: #dc3545;
}
</style>
</head>
<body>
	<%@include file="Common/navigation.jspf"%>
	<div class="modal-container">
		<h1>${todo.id == 0 ? 'Add New Task' : 'Update Task'}</h1>
		<form:form method="post" modelAttribute="todo">
			<div>
				<label for="username">Username:</label>
				<form:input type="text" id="username" path="username"
					class="form-control" />
				<form:errors path="username" cssClass="text-danger fw-bold" />
			</div>

			<div>
				<label for="description">Description:</label>
				<form:input type="text" id="description" path="description"
					class="form-control" />
				<form:errors path="description" cssClass="text-danger fw-bold" />
			</div>

			<div>
				<label for="date">Date:</label>
				<form:input type="date" id="date" path="date"
					value="${todo.date != null ? todo.date : ''}" class="form-control" />
				<form:errors path="date" cssClass="text-danger fw-bold" />
			</div>
			<form:input type="hidden" id="id" path="id" />
			<form:input type="hidden" id="done" path="done" />
			<div class="form-actions">
				<a href="todo-list" class="red-btn">Cancel</a> <input type="submit"
					class="green-btn"
					value="${todo.id == 0 ? 'Add Task' : 'Update Task'}" />
			</div>
		</form:form>
	</div>
	<%@include file="Common/footer.jspf"%>
</body>
</html>
