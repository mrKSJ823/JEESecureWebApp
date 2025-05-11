package ac.za.tut.web;

import ac.za.tut.entity.model.bl.ReportFacadeLocal;
import ac.za.tut.entity.model.Report;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "DeleteReportServlet", urlPatterns = {"/DeleteReportServlet.do"})
public class DeleteReportServlet extends HttpServlet {

    @EJB
    private ReportFacadeLocal reportFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reportIdParam = request.getParameter("reportId");

        if (reportIdParam == null || reportIdParam.isEmpty()) {
            request.setAttribute("error", "Please provide a report ID.");
            request.getRequestDispatcher("delete_report.jsp").forward(request, response);
            return;
        }

        try {
            Long reportId = Long.parseLong(reportIdParam);
            Report report = reportFacade.find(reportId);

            if (report != null) {
                reportFacade.remove(report);
                request.setAttribute("message", "Report with ID " + reportId + " deleted successfully.");
            } else {
                request.setAttribute("error", "No report found with ID: " + reportId);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid report ID format.");
        }

        request.getRequestDispatcher("delete_report.jsp").forward(request, response);
    }
}
