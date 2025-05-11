/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.za.tut.web;

import ac.za.tut.entity.model.User;
import ac.za.tut.entity.model.bl.ReportFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(name = "AnalyticsServlet", urlPatterns = {"/analytics"})
public class AnalyticsServlet extends HttpServlet {

    @EJB
    private ReportFacadeLocal reportFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User currentUser = (User) session.getAttribute("user");
        String username = currentUser.getUsername();

        try {
            Long totalReports = reportFacade.countReportsByUser(username);
            List<Object[]> categoryCounts = reportFacade.getReportCountsByCategory(username);
            List<Object[]> statusCounts = reportFacade.getReportCountsByStatus(username);

            request.setAttribute("totalReports", totalReports);
            request.setAttribute("categoryCounts", categoryCounts);
            request.setAttribute("statusCounts", statusCounts);

            RequestDispatcher dispatcher = request.getRequestDispatcher("analytics.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error loading analytics: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

