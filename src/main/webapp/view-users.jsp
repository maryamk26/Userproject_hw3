<%@ page import="java.util.List" %>
<%@ page import="itis.mk.model.User" %>
<% List<User> userList = (List<User>) request.getAttribute("userList"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>View Users</title>
</head>
<body>
<h1>View Users</h1>

<% if (userList != null && !userList.isEmpty()) { %>
<table border="1">
  <tr>
    <th>ID</th>
    <th>Username</th>
    <th>Age</th>
    <th>Email</th>
  </tr>
  <% for (User user : userList) { %>
  <tr>
    <td><%= user.getId() %></td>
    <td><%= user.getUsername() %></td>
    <td><%= user.getAge() %></td>
    <td><%= user.getEmail() %></td>
  </tr>
  <% } %>
</table>
<% } else { %>
<p>No users found.</p>
<% } %>

<a href="${pageContext.request.contextPath}/index.jsp">Back to Home</a>
</body>
</html>
