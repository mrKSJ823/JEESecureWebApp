package ac.za.tut.web;

import ac.za.tut.entity.model.Report;
import ac.za.tut.entity.model.bl.ReportFacadeLocal;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "TrackStatusServlet", urlPatterns = {"/TrackStatusServlet.do"})
public class TrackStatusServlet extends HttpServlet {

    @EJB
    private ReportFacadeLocal reportFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String ticketIdParam = request.getParameter("reportId");

        if (ticketIdParam == null || ticketIdParam.isEmpty()) {
            request.setAttribute("error", "Please provide a ticket/report ID.");
            request.getRequestDispatcher("track_status.jsp").forward(request, response);
            return;
        }

        try {
            Long ticketId = Long.parseLong(ticketIdParam);
            Report report = reportFacade.find(ticketId);

            if (report != null) {
                request.setAttribute("report", report);
                request.getRequestDispatcher("track_status_result.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "No report found with ID: " + ticketId);
                request.getRequestDispatcher("track_status.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid ticket ID format.");
            request.getRequestDispatcher("track_status.jsp").forward(request, response);
        }
    }
}
