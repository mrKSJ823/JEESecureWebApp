<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Report</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen p-4">
    <div class="bg-white shadow-md rounded-lg p-6 w-full max-w-md">
        <h1 class="text-xl font-bold text-red-600 mb-4">Delete a Report</h1>

        <% String error = (String) request.getAttribute("error"); %>
        <% String message = (String) request.getAttribute("message"); %>

        <% if (error != null) { %>
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">
                <%= error %>
            </div>
        <% } %>

        <% if (message != null) { %>
            <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4">
                <%= message %>
            </div>
        <% } %>

        <form action="DeleteReportServlet.do" method="post" class="space-y-4">
            <div>
                <label for="reportId" class="block text-gray-700 font-medium">Enter Report ID to Delete:</label>
                <input type="text" name="reportId" id="reportId"
                       class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring focus:ring-red-300 focus:outline-none"
                       placeholder="e.g. 1001" required>
            </div>
            <button type="submit"
                    class="w-full bg-red-600 text-white py-2 rounded-lg hover:bg-red-700 transition duration-200">
                Delete Report
            </button>
        </form>
    </div>
</body>
</html>
