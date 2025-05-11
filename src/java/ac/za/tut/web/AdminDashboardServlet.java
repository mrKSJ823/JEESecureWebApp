package ac.za.tut.web;

import ac.za.tut.entity.model.User;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/adminDashboard"})
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check if the user is logged in and has admin role
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null || !"admin".equals(((User) session.getAttribute("user")).getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Forward to the admin dashboard page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/adminDashboard.jsp");
        dispatcher.forward(request, response);
    }
}
