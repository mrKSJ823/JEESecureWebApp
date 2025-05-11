package ac.za.tut.web;


import ac.za.tut.entity.model.User;
import ac.za.tut.entity.model.bl.UserFacadeLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @EJB
    private UserFacadeLocal userFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Show login page
        request.getRequestDispatcher("/login.html").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get username and password from the form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Try to find the user by username
         User user = userFacade.login(username, password);

        if (user != null && user.getPassword().equals(password)) {
            // If login is successful, store the user in the session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Redirect to a protected page (e.g., dashboard or home page)
            response.sendRedirect("home.jsp");
        } else {
            // If login failed, return an error message
            response.getWriter().write("Invalid username or password.");
        }
    }
}
