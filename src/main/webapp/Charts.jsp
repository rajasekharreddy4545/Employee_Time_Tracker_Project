<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Task" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Task List</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .charts {
            margin: 20px;
        }
        .main {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .daily, .weekly, .monthly {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .daily h1, .weekly h1, .monthly h1 {
            font-size: 1.5rem;
            margin-bottom: 20px;
        }
        canvas {
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <h1>Task Stats</h1>
    <br><br>
    <div class="main row">
        <div class="agg_stats col-8">
            <div class="monthly">
                <h1>Monthly Stats</h1><canvas id="monthlyTasksChart"></canvas>
            </div><br>
            <div class="weekly">
                <h1>Weekly Stats</h1><canvas id="weeklyTasksChart"></canvas>
            </div>
        </div>
        <div class="daily col-4"><h1>Daily Stats</h1><canvas id="todaysTasksChart"></canvas></div>
    </div>
    
    <%
        List<Task> monthlyTasks = (List<Task>) request.getAttribute("monthlyTasks");
    %>
    
    <script>
        const taskCategoriesMonthly = {};
        
        <% for (Task task : monthlyTasks) {%>
            project_monthly = "<%= task.getProject() %>";
            duration_monthly = <%= task.getDuration() %>;
            
            if (!taskCategoriesMonthly[project_monthly]) {
                taskCategoriesMonthly[project_monthly] = 0;
            }
            taskCategoriesMonthly[project_monthly] += duration_monthly;
        <% } %>
        
        const labels_monthly = Object.keys(taskCategoriesMonthly);
        const data_monthly = Object.values(taskCategoriesMonthly);
        
        const ctx2 = document.getElementById('monthlyTasksChart').getContext('2d');
        
        const monthlyTasks = new Chart(ctx2, {
            type: 'bar',
            data: {
                labels: labels_monthly,
                datasets: [{
                    label: 'Task Duration (hours)',
                    data: data_monthly,
                    backgroundColor: '#FF6384',
                    borderColor: '#FF6384',
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top'
                    },
                    tooltip: {
                        callbacks: {
                            label: function(tooltipItem) {
                                return tooltipItem.label + ': ' + tooltipItem.raw + ' hours';
                            }
                        }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Hours'
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Projects'
                        }
                    }
                }
            }
        });
        
        <% List<Task> weeklyTasks = (List<Task>) request.getAttribute("weeklyTasks"); %>
        
        const taskCategoriesWeekly = {};
        
        <% for (Task task : weeklyTasks) {%>
            project_weekly = "<%= task.getProject() %>";
            duration_weekly = <%= task.getDuration() %>;
            
            if (!taskCategoriesWeekly[project_weekly]) {
                taskCategoriesWeekly[project_weekly] = 0;
            }
            taskCategoriesWeekly[project_weekly] += duration_weekly;
        <% } %>
        
        const labels_weekly = Object.keys(taskCategoriesWeekly);
        const data_weekly = Object.values(taskCategoriesWeekly);
        
        const ctx1 = document.getElementById('weeklyTasksChart').getContext('2d');
        
        const weeklyTasks = new Chart(ctx1, {
            type: 'bar',
            data: {
                labels: labels_weekly,
                datasets: [{
                    label: 'Task Duration (hours)',
                    data: data_weekly,
                    backgroundColor: '#4BC0C0',
                    borderColor: '#36A2EB',
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top'
                    },
                    tooltip: {
                        callbacks: {
                            label: function(tooltipItem) {
                                return tooltipItem.label + ': ' + tooltipItem.raw + ' hours';
                            }
                        }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Hours'
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Projects'
                        }
                    }
                }
            }
        });
        
        <% List<Task> todaysTasks = (List<Task>) request.getAttribute("dailyTasks"); %>
        
        const taskCategoriesDaily = {};
        <% for (Task task : todaysTasks) { %>
            project = "<%= task.getProject() %>";
            duration = <%= task.getDuration() %>;

            if (!taskCategoriesDaily[project]) {
                taskCategoriesDaily[project] = 0;
            }
            taskCategoriesDaily[project] += duration;
        <% } %>
        const labels = Object.keys(taskCategoriesDaily);
        const data = Object.values(taskCategoriesDaily);

        const ctx = document.getElementById('todaysTasksChart').getContext('2d');
        new Chart(ctx, {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Today\'s Tasks',
                    data: data,
                    backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#E7E9ED', '#4BC0C0', '#9966FF'],
                    borderColor: '#fff',
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'bottom'
                    },
                    tooltip: {
                        callbacks: {
                            label: function(tooltipItem) {
                                return tooltipItem.label + ': ' + tooltipItem.raw + ' hours';
                            }
                        }
                    }
                }
            }
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
