<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tiles:insertDefinition name="defaultTemplate">

	<tiles:putAttribute name="body">
		<div class="jumbotron">
			<h1>Users detail</h1>
			<p>See this misbehaviour info</p>
		</div>

		<c:choose>
			<c:when test="${not empty misbehaviour}">
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
			</c:when>
			<c:otherwise>
				<div class="alert alert-warning" role="alert">A misbehaviour with the
					id specified has not been found. Please, try again</div>
			</c:otherwise>
		</c:choose>
	</tiles:putAttribute>
</tiles:insertDefinition>