<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false"%>
<html>
<title>LogApp</title>
<head><link rel="stylesheet" href="main.css" type="text/css"/></head>
<body>
<div class="header">
    <div class="header-fixed">
        <a href="index.jsp" class="btn">Home</a>
    </div>
    <div class="header-notFixed">
        <p>Login App</p>
    </div>
</div>

<div class="content">
    <div class="name-log">
        <h2>Hello</h2>

    </div>
    <div class = "button-sign">
        <a href="registration.jsp" class="sihb-bt">SignUp</a>
    </div>
</div>

<table border=1>
    <thead>
    <tr>
        <th>User Id</th>
        <th>First Name</th>
        <th>Email</th>
        <th>Password</th>
    </tr>
    </thead>
    <tbody>

<c:forEach items="${users}" var="user">
    <tr>
        <td><c:out value="${user.id}" /></td>
        <td><c:out value="${user.name}" /></td>
        <td><c:out value="${user.email}" /></td>
        <td><c:out value="${user.password}" /></td>

        <td><a href="LoginServlet?action=edit&id=<c:out value="${user.id}"/>">Update</a></td>
        <td><a href="LoginServlet?action=delete&id=<c:out value="${user.id}"/>">Delete</a></td>
    </tr>
</c:forEach>
    </tbody>
</table>
</body>
</html>