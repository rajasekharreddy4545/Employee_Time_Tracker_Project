<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="models.Task,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Charts Admin</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

	<div class="charts">
		<canvas id="TasksChart"></canvas>
	</div>

	<%
	   	List<Task> Tasks = (List<Task>) request.getAttribute("tasks"); 
	%>
	   
	<script>
		const taskCategories = {};
		<% for (Task task : Tasks) { %>
			project = "<%= task.getProject() %>";
			duration = <%= task.getDuration() %>;

			if (!taskCategories[project]) {
				taskCategories[project] = 0;
			}
			taskCategories[project] += duration;
		<% } %>
		const labels = Object.keys(taskCategories);
		const data = Object.values(taskCategories);

		const ctx = document.getElementById('TasksChart').getContext('2d');

		const weeklyTasks = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: labels,
				datasets: [{
					label: 'Task Duration (hours)',
					data: data,
					backgroundColor: [
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)'
					],
					borderColor: [
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)'
					],
					borderWidth: 1
				}]
			},
			options: {
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
				},
				plugins: {
					title: {
						display: true,
						text: 'Task Durations by Project'
					},
					legend: {
						display: false
					}
				}
			}
		});
	</script>
</body>
</html>
