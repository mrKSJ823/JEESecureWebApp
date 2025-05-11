<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Track Complaint Status - SecureApp</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 p-6">
    <div class="max-w-3xl mx-auto bg-white p-6 shadow-md rounded">
        <h2 class="text-2xl font-bold text-blue-600 mb-4">Track Your Complaint Status</h2>
        <form action="TrackStatusServlet.do" method="POST" class="mb-6">
            <label class="block mb-2 text-gray-700 font-medium">Enter Report ID:</label>
            <input type="text" name="reportId" required class="w-full px-4 py-2 border rounded mb-2"/>
            <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">
                Check Status
            </button>
        </form>

        <c:if test="${not empty report}">
            <div class="mb-4">
                <h3 class="text-xl font-semibold text-gray-700 mb-2">Report Title: ${report.title}</h3>
                <p class="text-gray-600"><strong>Status:</strong> ${report.status}</p>
            </div>
            <div class="w-full bg-gray-200 rounded-full h-4">
                <div class="bg-blue-600 h-4 rounded-full" style="width: 
                    <c:choose>
                        <c:when test="${report.status == 'Pending'}">25%</c:when>
                        <c:when test="${report.status == 'In Review'}">50%</c:when>
                        <c:when test="${report.status == 'Processing'}">75%</c:when>
                        <c:when test="${report.status == 'Resolved'}">100%</c:when>
                        <c:otherwise>0%</c:otherwise>
                    </c:choose>;">
                </div>
            </div>
        </c:if>

        <c:if test="${empty report && not empty param.reportId}">
            <p class="text-red-500 mt-4">No report found with ID ${param.reportId}</p>
        </c:if>
    </div>
</body>
</html>
