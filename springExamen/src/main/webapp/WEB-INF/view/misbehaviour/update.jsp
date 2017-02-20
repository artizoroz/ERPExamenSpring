<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page session="false"%>
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
					<li><a href="<s:url value="/users/" />" title="View users">View
							users</a></li>
					<li class="active"><a href="<s:url value="/users/new" />"
						title="New user">New user</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<h1>Update misbehaviour</h1>
		</div>
		<s:url var="action" value="/misbehaviours/saveupdate" />
		<sf:form method="post" action="${action}" modelAttribute="misbehaviour">
			<sf:hidden path="id" />
			<div class="form-group">
				<label for="title">Title</label>
				<sf:input path="title" class="form-control" placeholder="Title" />
				<sf:errors path="title" cssClass="error" />
			</div>
			<div class="form-group">
				<label for="description">Description</label>
				<sf:textarea path="description" class="form-control"
					placeholder="Description" />
				<sf:errors path="description" cssClass="error" />
			</div>
			<div class="form-group">
				<label for="date">Date</label>
				<sf:input path="date" class="form-control"
					placeholder="Date" />
				<sf:errors path="date" cssClass="error" />
			</div>
			
			<div class="form-group">
				<label for="productType" class="col-md-4 control-label">User</label>
				<div class="col-md-4">
					<sf:select path="user.id" class="form-control">
						<sf:options items="${user}" itemLabel="login" itemValue="id" />
					</sf:select>
				</div>
			</div>
			
			<sf:button class="btn btn-primary pull-right">Update</sf:button>
		</sf:form>

		<footer class="footer">
			<div class="container">
				<p class="text-muted">&copy; 2015 Eugenia Pérez</p>
			</div>
		</footer>
</body>
</html>
