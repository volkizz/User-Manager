<?xml version="1.0" encoding="UTF-8" ?>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>Users List</title>
    <link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<body>
<h1>Search Result</h1>
<table  class="bordered">
  <thead>
  <tr>
    <th width="35px">ID</th><th width="300px">Name</th><th width="25px">Age</th><th width="75px">Is Admin</th><th width="100px">Created Date</th><th width="45px">Actions</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="user" items="${users}">
    <tr>
      <td>${user.id}</td>
      <td>${user.name}</td>
      <td>${user.age}</td>
      <td>${user.isAdmin}</td>
      <td>${user.createdDate}</td>
      <td><form method="GET" action="${pageContext.request.contextPath}/edit/${user.id}.html">
        <input id="editButton" type="submit" value="Edit"/>
      </form>
        <form method="GET" action="${pageContext.request.contextPath}/delete/${user.id}.html">
          <input id="deleteButton" type="submit" value="Delete" />
        </form>
      </td>
    </tr>
  </c:forEach>

  <div style="text-align: left">
    <form method="GET" action="${pageContext.request.contextPath}/search-init.html">
      <input id="searchButton" type="submit" value="Search" />
    </form>
    <div class="divider"/>
    <form method="GET" action="${pageContext.request.contextPath}/add.html">
      <input id="addButton" type="submit" value="+ Add New User" />
    </form>
  </div>
  <br/>
  <b>Users found: ${sizeresult} </b>
  </tbody>
</table>
<div id="pagination">

  <c:url value="/result" var="prev" >
    <c:param name="page" value="${page-1}"/>
  </c:url>
  <c:if test="${page > 1}">
    <a href="<c:out value="${prev}" />" class="pn prev">СЮДА </a>
  </c:if>

  <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
    <c:choose>
      <c:when test="${page == i.index}">
        <span>${i.index}</span>
      </c:when>
      <c:otherwise>
        <c:url value="/result" var="url">
          <c:param name="page" value="${i.index}"/>
        </c:url>
        <a href='<c:out value="${url}" />'>${i.index}</a>
      </c:otherwise>
    </c:choose>
  </c:forEach>
  <c:url value="/result" var="next">
    <c:param name="page" value="${page + 1}"/>
  </c:url>
  <c:if test="${page + 1 <= maxPages}">
    <a href='<c:out value="${next}" />' class="pn next"> ТУДА</a>
  </c:if>
</div>
<form method="GET" action="${pageContext.request.contextPath}/">
  <input id="defaultButton" type="submit" value="Main Page" />
</form>
</body>
</html>