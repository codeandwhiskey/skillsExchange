<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html">
<html>
<head>
<title>skillsexchange user</title>

</head>
<body>


<c:forEach items="${users}" var="user">
		<tr>
			<c:out value="${user.id}"/> 
			<c:out value="${user.userName}"/> 
			<c:out value="${user.name}"/> 
			<c:out value="${user.surname}"/><br>
		</tr>
	</c:forEach>

</body>
</html>