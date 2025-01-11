<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            color: #333;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            text-align: center;
        }
        main {
            padding: 20px;
        }
        .welcome-message {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .user-info {
            background-color: #fff;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }
        .user-info div {
            margin-bottom: 10px;
        }
        .manage-link {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            text-decoration: none;
            border-radius: 5px;
        }
        .manage-link:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<header>
    <h1>Welcome to My Web Page</h1>
</header>

<main>
    <div class="welcome-message">Welcome to the page!</div>

    <div class="user-info">
        <div><strong>Name:</strong> ${name}</div>
        <div><strong>Password:</strong> ${password}</div>
    </div>

    <div>
        <a href="todo-list" class="manage-link">Manage Your Todos</a>
    </div>
</main>

</body>
</html>
