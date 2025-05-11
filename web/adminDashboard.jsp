<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 text-gray-800">
    <div class="max-w-lg mx-auto mt-10 bg-white p-8 shadow-lg rounded">
        <h2 class="text-2xl font-bold mb-6 text-center">Admin Dashboard</h2>
        
        <div>
            <h3 class="text-xl font-semibold">User Management</h3>
            <a href="manageUsers" class="text-blue-600">Manage Users</a>
        </div>

        <div class="mt-4">
            <h3 class="text-xl font-semibold">System Reports</h3>
            <a href="systemReports" class="text-blue-600">View System Reports</a>
        </div>

        <div class="mt-4">
            <a href="logout" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700">Logout</a>
        </div>
    </div>
</body>
</html>
