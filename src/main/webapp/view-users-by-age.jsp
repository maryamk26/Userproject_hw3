<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="itis.mk.model.User" %>
<% List<User> userList = (List<User>) request.getAttribute("userListByAge"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Users by Age</title>
</head>
<body>
<h1>View Users by Age</h1>

<form action="${pageContext.request.contextPath}/user-by-age" method="get">
    <label for="age">Enter Age:</label>
    <input type="number" id="age" name="age" required>
    <button type="submit">Search</button>
</form>

<% if (userList != null && request.getParameter("age") != null) { %>
<h2>Search Results by Age:</h2>
<ul>
    <% for (User user : userList) { %>
    <li>
        <p>Username: <%= user.getUsername() %></p>
        <p>Email: <%= user.getEmail() %></p>
        <hr>
    </li>
    <% } %>
</ul>
<% } %>

<a href="${pageContext.request.contextPath}/index.jsp">Back to Home</a>
</body>
</html>
