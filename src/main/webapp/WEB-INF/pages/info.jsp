<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Action Result</title>
    <link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<body>
<h2>Action Result</h2>
<h3>${message}</h3>
<br/>
<form action="${pageContext.request.contextPath}/result.html">
    <input id="searchButton" type="submit" value="Search" />
</form>
<form method="GET" action="${pageContext.request.contextPath}/add.html">
    <input id="addButton" type="submit" value="+Add new User" /></form>
<br/>

<form action="${pageContext.request.contextPath}/list.html">
    <input id="defaultButton" type="submit" value="Main Page" />
</form>
</body>
</html>