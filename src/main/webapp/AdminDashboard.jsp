<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="models.Users,models.Task,java.util.*" %>
<!DOCTYPE html>
<html>

<head>
    <link href="https://fonts.googleapis.com/css?family=Rethink+Sans&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Outfit&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .main {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 80%;
            max-width: 900px;
        }

        .employee {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .title {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }

        .empn {
            display: flex;
            flex-direction: column;
        }

        .namee {
            font-size: 24px;
            font-weight: bold;
        }

        .empid {
            font-size: 14px;
            color: #666;
        }

        .logout {
            background: #9b59b6;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .logout:hover {
            background: #7159e6;
        }

        .btn {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }

        .btn button {
            background: #9b59b6;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.3s ease;
            display: flex;
            align-items: center;
        }

        .btn button:hover {
            background: #7159e6;
        }

        .btn span {
            margin-right: 10px;
        }

        .stats, .charts {
            margin-bottom: 20px;
        }

        .stats h1, .charts h1 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .stats form, .charts form {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .stats input[type="text"] {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
            box-sizing: border-box;
        }

        .sub {
            background: #9b59b6;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .sub:hover {
            background: #7159e6;
        }
    </style>

    <title>Employee Time Tracker</title>
</head>

<body>

    <%
        Users user = (Users) session.getAttribute("Admin");
    %>
    <div class="main">

        <div class="employee">
            <div class="title">
                <div class="empn">
                    <p class="namee">Welcome back, <b><%=user.getUsername() %></b></p>
                    <span class="empid">EmpId:<%= user.getUserId() %></span>
                </div>
                <form action="LogoutServlet"><button class="logout" type="submit">Logout</button></form>
            </div>
        </div>
        
        <div class="btn">
            <button class="view" onclick="location.href='ViewTask.jsp';"><span class="material-symbols-outlined">visibility</span>View Task</button>
            <button class="atsk" onclick="location.href='AddTask.jsp';"><span class="material-symbols-outlined">add</span>Add Task</button>
        </div>
        
        <div class="stats">
            <h1>Employee Stats</h1>
            <form action="TaskListServletAdmin">
                <input type="text" name="user_id" required>
                <button type="submit" class="sub">Submit</button>
            </form>
        </div>
        
        <div class="charts">
            <h1>Employee overall stats</h1>
            <form action="ChartsAdmin">
                <button type="submit" class="sub">Get overall stats</button>
            </form>
        </div>
    </div>
</body>

</html>
