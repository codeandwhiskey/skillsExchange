<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html">
<html>
<head>
<title>User</title>

</head>
<body>

	<tr>
		<c:out value="${user.id}" />
		<c:out value="${user.first_name}" />
		<c:out value="${user.sex}" />
		<c:out value="${user.birth}" />
		<c:out value="${user.country}" />
		<c:out value="${user.city}" />
		<c:out value="${user.summary}" />
	</tr>

</body>
</html>