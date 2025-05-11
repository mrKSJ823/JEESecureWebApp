package ac.za.tut.web;

import ac.za.tut.entity.model.User;
import ac.za.tut.entity.model.bl.UserFacadeLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    @EJB
    private UserFacadeLocal userFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username  = request.getParameter("username");
        String password  = request.getParameter("password");
        String email     = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName  = request.getParameter("lastName");
        String role      = request.getParameter("role");

   
        User user = new User(username, password, email, firstName, lastName, role);

        try {
       
            userFacade.create(user);

            request.setAttribute("registeredUser", user);
        
            RequestDispatcher rd = request.getRequestDispatcher("/Add.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
    
            request.setAttribute("errorMessage", "Registration failed: " + e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
        rd.forward(request, response);
    }
}
