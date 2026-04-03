import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

@WebServlet("/EmailList")              // URL mapping
public class EmailListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException, ServletException {
        // User navigated to /EmailList — show the form
        RequestDispatcher dispatcher =
            request.getRequestDispatcher("/WEB-INF/email_list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws IOException, ServletException {
        // User submitted the form
        String firstName = request.getParameter("firstName");
        String email     = request.getParameter("email");

        // process... then forward to a JSP
        request.setAttribute("message", firstName + " was added!");
        request.getRequestDispatcher("/WEB-INF/result.jsp")
               .forward(request, response);
    }
}