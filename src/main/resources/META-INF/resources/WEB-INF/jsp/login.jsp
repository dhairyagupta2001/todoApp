<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TodoApp - Login</title>
<style>
/* General styles */
body {
    font-family: 'Poppins', Arial, sans-serif;
    background: linear-gradient(135deg, #ff9966, #ff5e62);
    color: #fff;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    overflow: hidden;
}

/* Stylish TodoApp branding */
.brand {
    font-size: 36px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #fff;
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
}
.brand span {
    background: linear-gradient(90deg, #ff9966, #ff5e62);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    animation: glow 2s infinite alternate;
}

/* Glow animation for branding */
@keyframes glow {
    from {
        text-shadow: 0 0 5px #ff9966, 0 0 10px #ff5e62, 0 0 20px #ff5e62;
    }
    to {
        text-shadow: 0 0 10px #ff9966, 0 0 20px #ff5e62, 0 0 30px #ff5e62;
    }
}

/* Login container */
.login-container {
    background: #fff;
    color: #333;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
    width: 400px;
    text-align: center;
    animation: slideIn 1s ease-out;
}

/* Slide-in animation for the container */
@keyframes slideIn {
    from {
        transform: translateY(-50px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}

h1 {
    font-size: 28px;
    margin-bottom: 20px;
}

/* Input fields */
.input-group {
    margin-bottom: 20px;
    text-align: left;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
    color: #555;
}

input {
    width: calc(100% - 20px);
    padding: 12px 10px;
    border: 1px solid #ddd;
    border-radius: 8px;
    font-size: 16px;
    box-sizing: border-box;
    outline: none;
    transition: border-color 0.3s ease;
}

input:focus {
    border-color: #ff5e62;
}

/* Button styles */
button {
    background: linear-gradient(90deg, #ff9966, #ff5e62);
    color: #fff;
    border: none;
    padding: 12px 20px;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
    transition: background 0.3s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}

button:hover {
    background: linear-gradient(90deg, #ff5e62, #ff9966);
    box-shadow: 0 6px 10px rgba(0, 0, 0, 0.3);
}

.error-message {
    color: red;
    font-size: 14px;
    margin-top: 10px;
}

/* Responsive design */
@media (max-width: 480px) {
    .login-container {
        width: 90%;
        padding: 20px;
    }
}
</style>
</head>
<body>
    <div class="login-container">
        <div class="brand">
            Welcome to <span>TodoApp</span>
        </div>
        <h1>Login</h1>
        <form method="post" onsubmit="return validateForm();">
            <div class="input-group">
                <label for="name">Username</label>
                <input type="text" id="name" name="name" placeholder="Enter your username">
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password">
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
    <%@include file="Common/footer.jspf"%>
</body>
</html>
