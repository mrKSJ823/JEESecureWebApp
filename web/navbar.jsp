<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="bg-white shadow">
    <div class="container mx-auto px-4 py-3 flex justify-between items-center">
        <h1 class="text-lg font-bold text-blue-700">SecureApp</h1>
        <ul class="flex space-x-4">
            <li><a href="home.jsp" class="text-gray-700 hover:text-blue-600">Home</a></li>
            <li><a href="newReport.jsp" class="text-gray-700 hover:text-blue-600">Submit Report</a></li>
            <li><a href="ViewReportsServlet.do" class="text-gray-700 hover:text-blue-600">My Reports</a></li>
           
            <li>  <a href="AnalyticsServlet.do" class="text-blue-600 hover:underline">Analytics</a></li>
            <li> <a href="LogoutServlet.do" class="text-gray-700 hover:text-blue-600">Logout</a></li>
        </ul>
    </div>
</nav>
