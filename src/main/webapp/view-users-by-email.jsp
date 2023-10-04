<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="itis.mk.model.User" %>
<% List<User> userListByEmail = (List<User>) request.getAttribute("userListByEmail"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Users by Email</title>
</head>
<body>
<h1>View Users by Email</h1>

<form action="${pageContext.request.contextPath}/user-by-email" method="get">
    <label for="email">Enter Email:</label>
    <input type="email" id="email" name="email" required>
    <button type="submit">Search</button>
</form>

<% if (userListByEmail != null && request.getParameter("email") != null) { %>
<h2>Search Results by Email:</h2>
<ul>
    <% for (User user : userListByEmail) { %>
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
