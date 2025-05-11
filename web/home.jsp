<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Home - SecureApp</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 text-gray-800 min-h-screen flex flex-col">

  <!-- Header/Nav -->
  <header class="bg-white shadow">
    <div class="max-w-7xl mx-auto px-4 py-4 flex justify-between items-center">
      <h1 class="text-2xl font-bold text-blue-700">SecureApp - TUT Student Portal</h1>
      <nav class="space-x-4">
        <a href="home.jsp" class="text-gray-700 hover:text-blue-600">Home</a>
        <a href="profile.jsp" class="text-gray-700 hover:text-blue-600">Profile</a>
        <a href="LogoutServlet.do" class="text-gray-700 hover:text-blue-600">Logout</a>
      </nav>
    </div>
  </header>

  <!-- Main Content -->
  <main class="flex-grow container mx-auto px-4 py-10">
    <div class="bg-white rounded-lg shadow-md p-8">
      <h2 class="text-3xl font-bold mb-4">Welcome, 
        <span class="text-blue-600">
          ${sessionScope.user.username}
        </span>!
      </h2>
      <p class="text-gray-600 mb-6">
        You are logged in as a 
        <strong>${sessionScope.user.role}</strong> at Tshwane University of Technology.
      </p>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <!-- Profile Info -->
        <div class="p-6 bg-gray-100 rounded-lg">
          <h3 class="text-xl font-semibold mb-2">Your Profile</h3>
          <p><strong>First Name:</strong> ${sessionScope.user.firstName}</p>
          <p><strong>Last Name:</strong> ${sessionScope.user.lastName}</p>
          <p><strong>Email:</strong> ${sessionScope.user.email}</p>
          <a href="profile.jsp" class="mt-4 inline-block text-blue-600 hover:underline">Edit Profile</a>
        </div>

        <!-- Student Actions -->
        <div class="p-6 bg-gray-100 rounded-lg">
          <h3 class="text-xl font-semibold mb-2">Student Services</h3>
          <ul class="list-disc list-inside space-y-2">
            <li>
              <a href="newReport.jsp" class="text-blue-600 hover:underline">
                Lodge a Complaint or Query
              </a>
            </li>
            <li>
              <a href="ViewReportsServlet.do" class="text-blue-600 hover:underline">
                Track Your Submissions
              </a>
            </li>
            <li>
              <a href="AnalyticsServlet.do" class="text-blue-600 hover:underline">
                View Analytics & Resolutions
              </a>
            </li>
            <li><a href="trackStatus.jsp" class="text-blue-600 hover:underline">Track Complaint Status</a></li>
            <li><a href="delete_report.jsp" class="text-blue-600 hover:underline">Delete Complaint Report</a></li>
          </ul>
        </div>
      </div>

      <!-- Info Section -->
      <div class="mt-10 p-6 bg-blue-50 border border-blue-200 rounded-lg">
        <h3 class="text-xl font-semibold text-blue-800 mb-2">About SecureApp</h3>
        <p class="text-gray-700 mb-2">
          SecureApp is a secure platform designed for TUT students to lodge academic-related queries, especially around marks, module issues, or unfair treatment. 
        </p>
        <p class="text-gray-700">
          All submitted reports are reviewed by relevant academic staff and progress can be tracked through your dashboard. The goal is to ensure transparency, accountability, and timely resolution of student issues.
        </p>
      </div>
    </div>
  </main>

  <!-- Footer -->
  <footer class="bg-white text-center py-4 shadow-inner mt-6">
    <p class="text-sm text-gray-500">&copy; 2025 Tshwane University of Technology - SecureApp</p>
  </footer>

</body>
</html>
