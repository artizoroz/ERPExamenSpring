<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- No pueden convivir c & sgf? da error y no arranca -->
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Spring forms :: Turns</title>

<!-- Bootstrap -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Users/Turns app</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="<s:url value="/turns" />"
						title="View Users">View all turs</a></li>

				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<h1>Turns list</h1>
			<p>These are the turns requested by students.</p>
			<p><a href="<s:url value="/turns" />">See turns</a></p>
		</div>
		<div>
		<h3>Request new turn</h3>
		<sf:form method="post" modelAttribute="turn" action="turns/new">
			<div class="form-group">
				<label for="question">Question</label>
				<sf:textarea path="question" class="form-control" placeholder="Question" />
				<sf:errors path="question" cssClass="error" />

			</div>
			<div class="form-group">
				<label for="priority">Priority</label>
				<sf:input path="priority" class="form-control" 
					placeholder="0..5" />
				<sf:errors path="priority" cssClass="error" />
			</div>
			<div class="form-group">
				<label for="user.id">User</label>
				<sf:input path="user.id" class="form-control"
					placeholder="id user" />
				<sf:errors path="user.id" cssClass="error" />
			</div>
			<sf:button class="btn btn-primary pull-right">Create</sf:button>
		</sf:form>
		</div>

		<table class="table">
			<thead>
				<tr>
					<th>Question</th>
					<th>Priority</th>
					<th>Date</th>
					<th>Operations</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${turns}" var="turn">
					<tr>
						<td>${turn.question}</td>
						<td>${turn.priority}</td>
						<td>${turn.date}</td>
						<td><a class="btn btn-sm btn-primary"
							href="<s:url value="/users/${turn.id}" />"
							title="Detailed info"> see detail</a>
							</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<footer class="footer">
		<div class="container">
			<p class="text-muted">&copy; 2015 Eugenia Pérez</p>
		</div>
	</footer>
</body>
</html>