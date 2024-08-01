<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dao.TaskDAO,models.Task,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Task List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
        width: 90%;
        max-width: 1200px;
    }

    .title h1 {
        text-align: center;
        font-size: 24px;
        margin-bottom: 20px;
        color: #333;
    }

    .table {
        width: 100%;
        margin-bottom: 1rem;
        color: #212529;
        background-color: transparent;
    }

    .table th,
    .table td {
        padding: 0.75rem;
        vertical-align: top;
        border-top: 1px solid #dee2e6;
    }

    .table thead th {
        vertical-align: bottom;
        border-bottom: 2px solid #dee2e6;
    }

    .table tbody + tbody {
        border-top: 2px solid #dee2e6;
    }

    .table-dark {
        color: #fff;
        background-color: #343a40;
    }

    .table-dark th,
    .table-dark td,
    .table-dark thead th {
        border-color: #454d55;
    }

    .table-dark.table-hover tbody tr:hover {
        background-color: #494f55;
    }

    .table-hover tbody tr:hover {
        color: #212529;
        background-color: rgba(0, 0, 0, 0.075);
    }

    .btn {
        display: flex;
        justify-content: center;
        margin-top: 20px;
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
    }

    .btn button:hover {
        background: #7159e6;
    }
</style>
</head>
<body>
    <%    
        TaskDAO task = new TaskDAO();
        List<Task> tasks = task.getTaskDetails();
    %>

    <div class="main">
        <div class="title"><h1>Task Details</h1></div><br>
        <table class="table table-dark table-hover">
            <thead>
                <th> Task ID </th>
                <th> User ID</th>
                <th> Project Name </th>
                <th> Task Date </th>
                <th> Start Time </th>
                <th> End Time </th>
                <th> Duration(Hours)</th>
                <th> Category</th>
                <th> Description </th>
                <th> Actions </th>
            </thead>
            <tbody>
                <% for(Task task_ : tasks) { %>
                    <tr>
                        <td><%= task_.getTaskId() %></td>
                        <td><%= task_.getUserId() %></td>
                        <td><%= task_.getProject() %></td>
                        <td><%= task_.getTaskDate() %></td>
                        <td><%= task_.getStartTime() %></td>
                        <td><%= task_.getEndTime() %></td>
                        <td><%= task_.getDuration() %></td>
                        <td><%= task_.getCategory() %></td>
                        <td><%= task_.getDescription() %></td>
                        <td>
                            <form action="TaskDetailsServlet" method="post">
                                <input type="hidden" name="task_id" value="<%= task_.getTaskId() %>" />
                                <button type="submit" class="btn">Edit/Delete</button>
                            </form>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
