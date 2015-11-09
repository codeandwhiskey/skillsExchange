<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html">
<html>
<head>
<title></title>
</head>
<body>

	<c:url var="addAction" value="/user/fill" />

	<form:form action="${addAction}" commandName="user">
		<table>
			<c:if test="${!empty user.first_name}">
				<form:hidden path="id" />
			</c:if>
			<tr>
				<td><form:label path="first_name">
						<spring:message text="First Name" />
					</form:label></td>
				<td><form:input path="first_name" /></td>
			</tr>
			<tr>
				<td><form:label path="last_name">
						<spring:message text="Last Name" />
					</form:label></td>
				<td><form:input path="last_name" /></td>
			</tr>
			<tr>
				<td>Male <form:radiobutton path="sex" value="m" />
				</td>
				<td>Female <form:radiobutton path="sex" value="f" />
				</td>
			</tr>
			<tr>
				<td><form:label path="country">
						<spring:message text="Country" />
					</form:label></td>
				<td><form:input path="country" /></td>
			</tr>
			<tr>
				<td><form:label path="city">
						<spring:message text="City" />
					</form:label></td>
				<td><form:input path="city" /></td>
			</tr>
			<tr>
				<td><form:label path="birth">
						<spring:message text="Date of birth" />
					</form:label></td>
				<td><form:input path="birth" /></td>
			</tr>
			<tr>
				<td><form:label path="summary">
						<spring:message text="About myself" />
					</form:label></td>
				<td><form:textarea path="summary" /></td>
			</tr>

			<tr>
				<td colspan="2"><c:if test="${!empty user.first_name}">
						<input type="submit" value="<spring:message text="Edit"/>" />
					</c:if> <c:if test="${empty user.first_name}">
						<input type="submit" value="<spring:message text="Sign up!"/>" />
					</c:if></td>
			</tr>
		</table>
	</form:form>
	<br>


</body>
</html>