<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 text-gray-800">
    <div class="max-w-lg mx-auto mt-10 bg-white p-8 shadow-lg rounded">
        <h2 class="text-2xl font-bold mb-6 text-center">Profile Page</h2>
        
        <p><strong>Username:</strong> ${sessionScope.user.username}</p>
        <p><strong>Email:</strong> ${sessionScope.user.email}</p>
        <p><strong>First Name:</strong> ${sessionScope.user.firstName}</p>
        <p><strong>Last Name:</strong> ${sessionScope.user.lastName}</p>
        <p><strong>Role:</strong> ${sessionScope.user.role}</p>

        <div class="mt-4">
            <a href="editProfile.jsp" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700">Edit Profile</a>
        </div>
    </div>
</body>
</html>
