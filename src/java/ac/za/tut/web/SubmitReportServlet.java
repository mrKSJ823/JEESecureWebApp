package ac.za.tut.web;

import ac.za.tut.entity.model.Report;
import ac.za.tut.entity.model.User;
import ac.za.tut.entity.model.bl.ReportFacadeLocal;
import java.io.IOException;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/submitReport")
public class SubmitReportServlet extends HttpServlet {

    @EJB
    private ReportFacadeLocal reportFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String category = request.getParameter("category");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        Report report = new Report();
        report.setTitle(title);
        report.setDescription(description);
        report.setCategory(category);
        report.setStatus("Submitted");
        report.setSubmittedAt(new Date());
        report.setSubmittedBy(user.getUsername());

        reportFacade.create(report);

        request.setAttribute("message", "Report submitted successfully.");
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    }
}
