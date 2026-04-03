import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/submit_application")  // URL to match form's action
public class SubmitApplicationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1 type of the response
        response.setContentType("text/html");

        // 2 Retrieve data from the form
        String name = request.getParameter("name");
        String phone = request.getParameter("phone-no");
        String email = request.getParameter("email");
        String dob = request.getParameter("d-o-b");
        String course = request.getParameter("course");

        // 3. Output 
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>Application Submitted Successfully!</h1>");
        out.println("<h3>Here is the information you submitted:</h3>");
        out.println("Name: " + name + "<br>");
        out.println("Phone Number: " + phone + "<br>");
        out.println("Email: " + email + "<br>");
        out.println("Date of Birth: " + dob + "<br>");
        out.println("Course: " + course + "<br>");
        out.println("</body></html>");
    }
}