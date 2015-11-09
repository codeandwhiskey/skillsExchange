<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html">
<html>
<head>
<title>User</title>

</head>
<body>

	<c:out value="${user.id}" />
	<c:out value="${user.first_name}" />
	<c:out value="${user.sex}" />
	<c:out value="${user.birth}" />
	<c:out value="${user.country}" />
	<c:out value="${user.city}" />
	<c:out value="${user.summary}" />
	<br> I can teach:
	<c:forEach items="${user.teach}" var="subject">
		<c:out value="${subject.title}" />
	</c:forEach>
	<br> I want to learn:
	<c:forEach items="${user.learn}" var="subject">
		<c:out value="${subject.title}" />
	</c:forEach>
	<br>
	<a href="<c:url value='/edit/${user.id}' />" >Edit</a>
</body>
</html>