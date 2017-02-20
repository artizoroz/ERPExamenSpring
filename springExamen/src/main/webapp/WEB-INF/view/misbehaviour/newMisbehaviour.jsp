<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">

		<div class="jumbotron">
			<h1>New misbehaviour</h1>
			<p>See this misbehaviour info</p>
		</div>
		<c:url var="post_misbehaviour" value="/misbehaviours/new" />
		<sf:form method="post" modelAttribute="misbehaviour" action="${post_misbehaviour}">
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
			
			<sf:button class="btn btn-primary pull-right">Create</sf:button>
		</sf:form>
	</tiles:putAttribute>
	<tiles:putAttribute name="pageScripts">
		<script src="<c:url value="/resources/js/validateUserForm.js" />"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>