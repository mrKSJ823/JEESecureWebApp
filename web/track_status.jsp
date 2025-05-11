<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Report Not Found</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-red-50 flex items-center justify-center min-h-screen p-4">
    <div class="bg-white shadow-lg rounded-lg p-6 text-center max-w-md w-full">
        <h2 class="text-2xl font-bold text-red-600 mb-3">Report Not Found</h2>
        <p class="text-gray-700 mb-4">
            We couldn't find any report with the provided ID.
        </p>
        <a href="trackStatus.jsp"
           class="inline-block mt-2 bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition">
            Try Again
        </a>
    </div>
</body>
</html>
