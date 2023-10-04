<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome to Your Application</title>
</head>
<body>
<h1>Welcome to Your Application</h1>
<p>Please select an option:</p>
<ul>
    <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
    <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
    <li><a href="${pageContext.request.contextPath}/user-by-age">Search Users by Age</a></li>
    <li><a href="${pageContext.request.contextPath}/user-by-email">Search Users by Email</a></li>
    <li><a href="${pageContext.request.contextPath}/view-users">View All users</a></li>
</ul>
</body>
</html>
