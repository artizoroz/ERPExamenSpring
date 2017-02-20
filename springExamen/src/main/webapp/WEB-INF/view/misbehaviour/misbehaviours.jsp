<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- No pueden convivir c & sgf? da error y no arranca -->
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Spring forms :: Users</title>

<!-- Bootstrap -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Users app</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="<s:url value="/assignments" />"
						title="View Users">View assigments</a></li>
					<li class="active"><a href="<s:url value="/users/" />"
						title="View users">View users</a></li>
					<li><a href="<s:url value="/users/new" />" title="New user">New
							user</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<h1>Misbehaviour list</h1>
			<p>These are the misbehaviours currently in the system.</p>
		</div>
		
		<a class="btn btn-sm btn-success" href="<s:url value="/misbehaviours/new" />">Create new</a>

		<table class="table">
			<thead>
				<tr>
					<th>Title</th>
					<th>Description</th>
					<th>Date</th>
					<th>User</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${misbehaviours}" var="misbehaviour">
					<tr>
						<td>${misbehaviour.title}</td>
						<td>${misbehaviour.description}</td>
						<td>${misbehaviour.date}</td>
						<td>${misbehaviour.user.login}</td>
						<td><a class="btn btn-sm btn-primary"
							href="<s:url value="/misbehaviours/${misbehaviour.id}" />"
							title="Detailed info"> see detail</a>
							<a class="btn btn-sm btn-success"
							href="<s:url value="/misbehaviours/update/${misbehaviour.id}" />"
							title="Update"> update</a>
							<a class="btn btn-sm btn-danger"
							href="<s:url value="/misbehaviours/delete/${misbehaviour.id}" />"
							title="Delete"> delete</a>
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