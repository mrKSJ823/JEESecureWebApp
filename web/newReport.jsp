<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Report</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">
    <div class="max-w-xl mx-auto mt-10 p-8 bg-white shadow rounded">
        <h2 class="text-2xl font-bold mb-6">Submit a Report for a test issue</h2>
        <form action="SubmitReportServlet.do" method="POST">
            <div class="mb-4">
                <label class="block">Title</label>
                <input type="text" name="title" class="w-full border px-4 py-2 rounded" required />
            </div>
            <div class="mb-4">
                <label class="block">Description</label>
                <textarea name="description" class="w-full border px-4 py-2 rounded" required></textarea>
            </div>
            <div class="mb-4">
                <label class="block">Category</label>
                <select name="category" class="w-full border px-4 py-2 rounded" required>
                    <option>Semester test 1</option>
                    <option>Semester test 2</option>
                    <option>Final Exam</option>
                    <option>Other</option>
                </select>
            </div>
            <button type="submit" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700">Submit Report</button>
        </form>
    </div>
</body>
</html>
