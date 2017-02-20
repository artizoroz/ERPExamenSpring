<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">

		<div class="jumbotron">
			<h1>Misbehaviour created</h1>
		</div>
		<div class="alert alert-success" role="alert">The following misbehaviour
			has been created successfully</div>
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Description</th>
					<th>Date</th>
					<th>User</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${misbehaviour.id}</td>
					<td>${misbehaviour.title}</td>
					<td>${misbehaviour.description}</td>
					<td>${misbehaviour.date}</td>
					<td>${misbehaviour.user.login}</td>
				</tr>
			</tbody>
		</table>
	</tiles:putAttribute>
</tiles:insertDefinition>