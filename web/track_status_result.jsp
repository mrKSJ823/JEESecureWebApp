<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="ac.za.tut.entity.model.Report" %>
<%
    Report report = (Report) request.getAttribute("report");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Track Report Status</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans min-h-screen flex flex-col items-center justify-center p-4">
    <div class="bg-white shadow-xl rounded-xl p-6 w-full max-w-xl">
        <h1 class="text-2xl font-bold text-blue-600 mb-4">Report Status</h1>

        <div class="space-y-3 text-gray-800">
            <p><span class="font-semibold">Report ID:</span> <%= report.getId() %></p>
            <p><span class="font-semibold">Title:</span> <%= report.getTitle() %></p>
            <p><span class="font-semibold">Category:</span> <%= report.getCategory() %></p>
            <p><span class="font-semibold">Description:</span> <%= report.getDescription() %></p>
            <p><span class="font-semibold">Status:</span>
                <span class="px-2 py-1 rounded-full text-white 
                    <%= report.getStatus().equalsIgnoreCase("Completed") ? "bg-green-500" :
                        report.getStatus().equalsIgnoreCase("In Progress") ? "bg-yellow-500" : "bg-red-500" %>">
                    <%= report.getStatus() %>
                </span>
            </p>
            <p><span class="font-semibold">Submitted Date:</span> <%= report.getSubmittedAt() %></p>
        </div>

        <div class="mt-6">
            <a href="trackStatus.jsp" class="text-blue-500 hover:underline">← Track another report</a>
        </div>
    </div>
</body>
</html>
