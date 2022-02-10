
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false"%>
<head><link rel="stylesheet" href="main.css" type="text/css"/></head>
<div class="header">
    <div class="header-fixed">
        <a href="index.jsp" class="btn">Home</a>
    </div>
    <div class="header-notFixed">
        <p>Login App</p>
    </div>
</div>
<div class="content">
    <form action="LoginServlet" method="post">
        <div class="container">
            <%--@declare id="name"--%><%--@declare id="email"--%><%--@declare id="password"--%><h1>Registration</h1>
            <p>Please fill in this form to create an account.</p>
            <hr>

            <label for="name"><b>Name</b></label>
            <input type="text" placeholder="Enter Name" name="name" id="name" required>

            <label for="email"><b>Email</b></label>
            <input type="text" placeholder="Enter Email" name="email" id="email" required>

            <label for="password"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="password" id="password" required>
            <hr>


            <button type="submit" class="registerbtn">Registration</button>
        </div>


    </form>
</div>



