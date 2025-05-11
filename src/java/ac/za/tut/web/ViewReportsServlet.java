package ac.za.tut.web;

import ac.za.tut.entity.model.Report;
import ac.za.tut.entity.model.User;
import ac.za.tut.entity.model.bl.ReportFacadeLocal;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
@WebServlet(name = "ViewReportsServlet", urlPatterns = {"/viewReports"})
public class ViewReportsServlet extends HttpServlet {

    @EJB
    private ReportFacadeLocal reportFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Redirect to login if no session or user not authenticated
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?redirect=viewReports");
            return;
        }

        try {
            User currentUser = (User) session.getAttribute("user");
            String username = currentUser.getUsername(); // or use ID if necessary

            // Fetch reports submitted by the current user
            List<Report> reports = reportFacade.getReportsByUser(username);

            // Set reports to request
            request.setAttribute("reports", reports);

            // Forward to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("reports.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to load reports.");
            request.setAttribute("errorDetails", e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }
}

