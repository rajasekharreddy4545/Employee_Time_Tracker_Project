<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Helvetica+Neue&display=swap" rel="stylesheet" />
    <style>
        body.page {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            font-family: 'Montserrat', sans-serif;
            margin: 0;
        }

        .form-control {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        .title {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
            font-family: 'Helvetica Neue', sans-serif;
        }

        .input-field {
            position: relative;
            margin-bottom: 30px;
        }

        .input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .input:focus {
            border-color: #9b59b6;
            outline: none;
            box-shadow: 0 0 5px rgba(155, 89, 182, 0.5);
        }

        .label {
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            font-size: 14px;
            color: #999;
            pointer-events: none;
            transition: all 0.3s ease;
        }

        .input:focus + .label,
        .input:not(:placeholder-shown) + .label {
            top: -10px;
            left: 10px;
            font-size: 12px;
            color: #9b59b6;
            background: white;
            padding: 0 5px;
        }

        .forgorp {
            display: block;
            text-align: right;
            margin-bottom: 20px;
            font-size: 12px;
            color: #9b59b6;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .forgorp:hover {
            color: #7159e6;
        }

        .submit-btn {
            background: #9b59b6;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .submit-btn:hover {
            background: #7159e6;
        }
    </style>
    <title>Login</title>
</head>

<body class="page">
    <form class="form-control" action="LoginServlet" method="post">
        <p class="title">Login</p>
        <div class="input-field">
            <input required="" class="input" type="text" name="username" />
            <label class="label" for="input">Enter Username:</label>
        </div>
        <div class="input-field">
            <input required="" class="input" type="password" name="password" />
            <label class="label" for="input">Enter Password</label>
        </div>
        
        <button class="submit-btn" type="submit">Login</button>
    </form>
</body>

</html>
