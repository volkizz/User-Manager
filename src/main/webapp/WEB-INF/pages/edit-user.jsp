<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Edit User</title>
	<link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<body>
<h1>Edit User</h1>
<p>${message}</p>
<form:form method="POST" commandName="user" action="${pageContext.request.contextPath}/edit/${user.id}.html">
<table>
<tbody>
	<tr>
		<td>Name:</td>
		<td><form:input path="name" maxlength="25" required="yes"/></td>
	</tr>
	<tr>
		<td>Age:</td>
		<td><form:input path="age" type="number" min="0" required="yes"/></td>
	</tr>
	<tr>
		<td>Is Admin:</td>
		<td><form:checkbox path="isAdmin" /></td>
	</tr>
</tbody>
</table>
    <input id="editButton" type="submit" value="Edit" />
    <br>
</form:form>
<br>
<form method="GET" action="${pageContext.request.contextPath}/list.html">
    <input id="defaultButton" type="submit" value="Back to Users List" />
</form>

</body>
</html>