<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Report Analytics - SecureApp</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

<jsp:include page="navbar.jsp" />

<div class="container mx-auto py-10">
    <h2 class="text-3xl font-bold text-blue-700 mb-6">Your Report Analytics</h2>

    <!-- Total Reports -->
    <div class="bg-white shadow rounded-lg p-6 mb-6">
        <h3 class="text-lg font-semibold text-gray-800">Total Reports Submitted</h3>
        <p class="text-2xl text-blue-600 mt-2">${totalReports}</p>
    </div>

    <!-- Category Breakdown -->
    <div class="bg-white shadow rounded-lg p-6 mb-6">
        <h3 class="text-lg font-semibold text-gray-800 mb-4">Reports by Category</h3>
        <ul class="space-y-2">
            <c:forEach var="cat" items="${categoryCounts}">
                <li class="flex justify-between">
                    <span>${cat[0]}</span>
                    <span class="font-medium">${cat[1]}</span>
                </li>
            </c:forEach>
        </ul>
    </div>

    <!-- Status Breakdown -->
    <div class="bg-white shadow rounded-lg p-6">
        <h3 class="text-lg font-semibold text-gray-800 mb-4">Reports by Status</h3>
        <ul class="space-y-2">
            <c:forEach var="stat" items="${statusCounts}">
                <li class="flex justify-between">
                    <span>${stat[0]}</span>
                    <span class="font-medium">${stat[1]}</span>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

</body>
</html>
