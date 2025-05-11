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
    <title>Your Reports - SecureApp</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

<!-- Navbar -->
<jsp:include page="navbar.jsp" />

<main class="container mx-auto px-4 py-10 flex-grow">
    <h2 class="text-2xl font-bold text-blue-700 mb-6">Your Submitted Reports</h2>

    <c:if test="${empty reports}">
        <p class="text-gray-600">You haven’t submitted any reports yet.</p>
    </c:if>

    <c:if test="${not empty reports}">
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white rounded-lg shadow">
                <thead class="bg-blue-600 text-white">
                    <tr>
                        <th class="py-3 px-4 text-left">Title</th>
                        <th class="py-3 px-4 text-left">Category</th>
                        <th class="py-3 px-4 text-left">Status</th>
                        <th class="py-3 px-4 text-left">Submitted At</th>
                        <th class="py-3 px-4 text-left">Description</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="report" items="${reports}">
                        <tr class="border-b hover:bg-gray-50">
                            <td class="py-2 px-4">${report.title}</td>
                            <td class="py-2 px-4">${report.category}</td>
                            <td class="py-2 px-4">
                                <span class="px-2 py-1 rounded 
                                    ${report.status == 'Pending' ? 'bg-yellow-200 text-yellow-800' : 
                                      report.status == 'Resolved' ? 'bg-green-200 text-green-800' : 
                                      'bg-gray-200 text-gray-700'}">
                                    ${report.status}
                                </span>
                            </td>
                            <td class="py-2 px-4">${report.submittedAt}</td>
                            <td class="py-2 px-4">${report.description}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
</main>

<!-- Footer -->
<footer class="bg-white text-center py-4 shadow-inner">
    <p class="text-sm text-gray-500">&copy; 2025 SecureApp Inc.</p>
</footer>

</body>
</html>
