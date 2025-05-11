package ac.za.tut.web;

import ac.za.tut.entity.model.User;
import ac.za.tut.entity.model.bl.UserFacadeLocal;
import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "EditProfileServlet", urlPatterns = {"/editProfile"})
public class EditProfileServlet extends HttpServlet {

    @EJB
    private UserFacadeLocal userFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the edit profile page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/editProfile.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get updated user details from form
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");

        // Get user from session
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        // Update user details
        if (user != null) {
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setEmail(email);

            // Save updated user to the database
            userFacade.edit(user);

            // Update user in session
            session.setAttribute("user", user);
        }

        // Forward to profile page with updated info
        RequestDispatcher dispatcher = request.getRequestDispatcher("/profile.jsp");
        dispatcher.forward(request, response);
    }
}
