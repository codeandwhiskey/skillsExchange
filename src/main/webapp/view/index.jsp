<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html">
<html>
<head>
<title>skillsexchange user</title>

</head>
<body>
<c:out value="${message}"/>
	<form method="post" action="login">
		<tr>
			<td>User Name</td>
			<td><input type="text" name="uname" value="" /></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="password" name="password" value="" /></td>
		</tr>
		<tr>
			<input type="submit" value="Login" />
		</tr>
	</form>
	<br>
	

</body>
</html>