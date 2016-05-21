<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>Search</title>
  <link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<body>
<h1>Search</h1>
<hr/>
<p><h4>${isSearch}</h4></p>
<form:form method="POST" commandName="searchUser" action="${pageContext.request.contextPath}/search-init.html">
  <table>
    <tbody>
    <tr>
      <td>ID:</td>
      <td><form:input path="id" type="number" min="0"/></td>
    </tr>
    <tr>
      <td>Name:</td>
      <td><form:input path="name" maxlength="25"/></td>
    </tr>
    <tr>
      <td>Age:</td>
      <td><form:input path="age" type="number" min="0"/></td>
    </tr>
    <tr>
      <td>Is Admin:</td>
      <td><form:checkbox path="isAdmin" />
      </td>
    </tr>
    </tbody>
  </table>
  <input id="searchButton" type="submit" value="Search" />
  <br>
  <br>
</form:form>

<form method="GET" action="${pageContext.request.contextPath}/list.html">
  <input id="defaultButton" type="submit" value="Back to Users List" />
</form>

</body>
</html>