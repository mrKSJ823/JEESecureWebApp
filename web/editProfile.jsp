<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 text-gray-800">
    <div class="max-w-lg mx-auto mt-10 bg-white p-8 shadow-lg rounded">
        <h2 class="text-2xl font-bold mb-6 text-center">Edit Profile</h2>
        
        <form action="EditProfileServlet.do" method="POST">
            <div class="mb-4">
                <label for="firstName" class="block">First Name</label>
                <input type="text" name="firstName" id="firstName" class="w-full border px-4 py-2 rounded" value="${sessionScope.user.firstName}" required>
            </div>

            <div class="mb-4">
                <label for="lastName" class="block">Last Name</label>
                <input type="text" name="lastName" id="lastName" class="w-full border px-4 py-2 rounded" value="${sessionScope.user.lastName}" required>
            </div>

            <div class="mb-4">
                <label for="email" class="block">Email</label>
                <input type="email" name="email" id="email" class="w-full border px-4 py-2 rounded" value="${sessionScope.user.email}" required>
            </div>

            <button type="submit" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700 w-full">Update</button>
        </form>
    </div>
</body>
</html>
