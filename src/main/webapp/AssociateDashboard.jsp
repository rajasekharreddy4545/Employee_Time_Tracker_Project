<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.Users,com.dao.TaskDAO,models.Task,java.util.*" %>
<!DOCTYPE html>
<html>

<head>
    <link href="https://fonts.googleapis.com/css?family=Rethink+Sans&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Outfit&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet" />
    <style>
        /* General Styles */
        body {
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f7fa;
            color: #333;
        }

        .main {
            margin: 20px;
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
        }

        /* Header and Title Styles */
        .employee {
            margin-bottom: 20px;
        }

        .title {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #343a40;
            color: #ffffff;
            padding: 15px;
            border-radius: 8px;
        }

        .namee {
            font-size: 1.5rem;
            margin: 0;
        }

        .empid {
            font-size: 1rem;
            color: #ced4da;
        }

        .logout {
            background-color: #dc3545;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .logout:hover {
            background-color: #c82333;
        }

        /* Stats Button Styles */
        .stats {
            margin-bottom: 20px;
        }

        .adt {
            background-color: #9932CC;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .adt:hover {
            background-color: #0056b3;
        }

        /* Project Section Styles */
        .project {
            background-color: #ffffff;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        .desc {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .projn {
            font-size: 1.5rem;
            margin: 0;
            color: #007bff;
        }

        .projdesc {
            font-size: 1rem;
            color: #6c757d;
        }

        /* Task List Section */
        .tasko {
            font-weight: bold;
            font-size: 1.25rem;
            margin-bottom: 15px;
            color: black;
        }

        .task-1 {
            background-color: #ffffff;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .taskso {
            font-size: 1rem;
        }

        .taskso p {
            font-size: 1.1rem;
            margin: 0;
            color: #343a40;
        }

        .taskso span {
            display: block;
            margin-top: 5px;
            color: #6c757d;
        }

        hr {
            border: 1px solid #dee2e6;
            margin: 20px 0;
        }

        /* Button Styles */
        button {
            cursor: pointer;
            border: none;
            background: none;
            padding: 0;
            font: inherit;
        }

        button:focus {
            outline: none;
        }
    </style>
    <title>Employee Time Tracker</title>
</head>

<body>
<%
    if (session == null || session.getAttribute("Associate") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
    Users user = (Users) session.getAttribute("Associate");
    int user_id = user.getUserId();
    TaskDAO task = new TaskDAO();
    Map<String, List<Task>> tasks = task.getTaskDetailsByAssociate(user_id);
%>
    <div class="main">
        <div class="employee">
            <div class="title">
                <div class="empn">
                    <p class="namee">Welcome back, <b><%= user.getUsername() %></b></p>
                    <span class="empid">EmpId:<%= user.getUserId() %></span>
                </div>
                <form action="LogoutServlet">
                    <button class="logout" type="submit">Logout</button>
                </form>
            </div>
        </div>
        
        <div class="stats">
            <form action="TaskListServlet">
                <button class="adt" type="submit">Stats</button>
            </form>
        </div>
        
        <%
        for (Map.Entry<String, List<Task>> task_ : tasks.entrySet()) {
            String project = task_.getKey();
            List<Task> task1 = task_.getValue();
        %>
        <div class="project">
            <div class="desc">
                <div class="empn">
                    <p class="projn"><%= project %></p>
                    <span class="projdesc"></span>
                </div>
                <button class="adt" onclick="location.href='AddTask.jsp';">Add Task</button>
            </div>
        </div>
        
        <div class="tasko">
            <p>Tasks:</p>
        </div>
        
        <%   
        for (int i = 0; i < task1.size(); i++) {
            Task task2 = task1.get(i);
        %>
        <div class="task-1">
            <div class="taskso">
                <p class="projn">Task ID: <%= task2.getTaskId() %></p>
                <span class="projdesc"><%= task2.getTaskDate() %> <%= task2.getStartTime() %> - <%= task2.getEndTime() %></span>
                <span><%= task2.getCategory() %><br>
                   <%= task2.getDescription() %></span>
            </div>
        </div>
        <% } %>
        <hr>  
        <% } %>
    </div>
</body>
</html>
