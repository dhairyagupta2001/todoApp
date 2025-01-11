<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<style>
/* General styles */
body {
	font-family: Arial, sans-serif;
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	color: #fff;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.login-container {
	background: #fff;
	color: #333;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	width: 350px;
	text-align: center;
}

h1 {
	margin-bottom: 20px;
}

.input-group {
	margin-bottom: 15px;
	text-align: left;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

input {
	width: calc(100% - 20px);
	/* Leaves space for padding inside the container */
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
	box-sizing: border-box;
}

button {
	background: #2575fc;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	transition: background 0.3s ease;
}

button:hover {
	background: #6a11cb;
}

.error-message {
	color: red;
	font-size: 14px;
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="login-container">
		<h1>Login</h1>
		<form method="post" onsubmit="return validateForm();">
			<div class="input-group">
				<label for="name">Username</label> <input type="text"
					id="name" name="name" placeholder="Enter your username">
			</div>
			<div class="input-group">
				<label for="password">Password</label> <input type="password"
					id="password" name="password" placeholder="Enter your password">
			</div>
			<div id="error-message" class="error-message">
				<%
				// Display error messages (if any) from form submission
				String errorMessage = (String) request.getAttribute("errorMessage");
				if (errorMessage != null) {
					out.print(errorMessage);
				}
				%>
			</div>
			<button type="submit">Login</button>
		</form>
	</div>
	<script>
		function validateForm() {
			const username = document.getElementById("name").value.trim();
			const password = document.getElementById("password").value.trim();
			const errorMessage = document.getElementById("error-message");

			// Reset error message
			errorMessage.textContent = "";

			if (!username || !password) {
				errorMessage.textContent = "Both username and password are required.";
				return false;
			}

			return true;
		}
	</script>
</body>
</html>
