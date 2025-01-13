<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #00c6ff, #0072ff); /* Bluish gradient */
            color: #333;
            margin: 0;
            padding: 0;
        }

        header {
            background: linear-gradient(90deg, #4c9aff, #4c6ef5); /* Bluish gradient for header */
            color: white;
            padding: 40px 20px;
            text-align: center;
            font-size: 2.5rem;
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-bottom: 5px solid #4c9aff;
        }

        .welcome-message {
            font-size: 2.5rem;
            font-weight: bold;
            color: #ff7e5f; /* Warm color for the welcome message */
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
            margin-bottom: 30px;
            animation: fadeIn 1s ease-out;
        }

        main {
            flex: 1;
            padding: 40px 20px;
            max-width: 900px;
            margin: 80px auto 50px;
            text-align: center;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            transform: translateY(-10px); /* Slightly lifted effect */
        }

        .user-info {
            background-color: #f9f9f9;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .user-info:hover {
            transform: scale(1.03);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        }

        .user-info div {
            margin-bottom: 15px;
            font-size: 1.1rem;
            text-align: left;
            color: #0072ff; /* Blue color for name and password */
        }

        .user-info strong {
            color: #ff7e5f; /* Different color for strong labels */
        }

        .manage-link {
            display: inline-block;
            background: linear-gradient(90deg, #4c9aff, #4c6ef5); /* Bluish gradient for button */
            color: white;
            padding: 14px 35px;
            font-size: 1.2rem;
            font-weight: bold;
            border-radius: 10px;
            text-decoration: none;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, background 0.3s ease;
        }

        .manage-link:hover {
            transform: translateY(-4px);
            background: linear-gradient(90deg, #4c6ef5, #4c9aff);
        }

        footer {
            text-align: center;
            padding: 20px;
            margin-top: 30px;
            background-color: #4c9aff; /* Bluish footer color */
            color: white;
            font-size: 0.9rem;
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
        }

        footer a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        footer a:hover {
            color: #4c6ef5;
        }

        @media (max-width: 768px) {
            .welcome-message {
                font-size: 2rem;
            }

            .user-info div {
                font-size: 1rem;
            }

            .manage-link {
                font-size: 1rem;
                padding: 12px 25px;
            }

            main {
                padding: 20px;
            }
        }

        /* Keyframe animation for the welcome message */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }

            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>

<body>
    <!-- Navigation bar -->
    <%@include file="Common/navigation.jspf"%>

   <div> <!-- Main Content -->
    <main>
        <div class="welcome-message">Welcome to <span style="color: #ff7e5f;">${name}</span>!</div>

        <div class="user-info">
            <div>
                <strong>Name:</strong> ${name}
            </div>
            <div>
                <strong>Password:</strong> ${password}
            </div>
        </div>

        <div>
            <a href="todo-list" class="manage-link">Manage Your Todos</a>
        </div>
    </main>
</div>
    <%@include file="Common/footer.jspf"%>
</body>

</html>
