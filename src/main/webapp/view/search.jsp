<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html">
<html>
<head>
<title>User</title>

</head>
<body>
	<form method="post">
	I can teach <select name="teach">
		<c:forEach items="${subjects}" var="subject">
		<option value="${subject.title}">${subject.title}</option>
		</c:forEach>
	</select>
	I want to learn <select name="learn">
		<c:forEach items="${subjects}" var="subject">
		<option value="${subject.title}">${subject.title}</option>
		</c:forEach>
	</select>
	<input type="submit" value="search!">
	</form>
	<c:forEach items="${users}" var="user">
		<c:out value = "${user.first_name}"/><br>
		</c:forEach>
</body>
</html>