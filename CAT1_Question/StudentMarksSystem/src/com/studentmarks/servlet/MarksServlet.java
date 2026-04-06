package com.studentmarks.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.studentmarks.model.Marks;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 * Servlet that handles student marks submission.
 * Maps to URL pattern: /MarksServlet
 * Processes POST requests from the marks form and saves data to file.
 */
@WebServlet(name = "MarksServlet", urlPatterns = {"/MarksServlet"})
public class MarksServlet extends HttpServlet {

    /**
     * Handles HTTP POST requests for submitting marks.
     * Validates input, creates Marks object, saves to file, and forwards to result page.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Set response content type
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Retrieve form parameters from request
            String courseName = request.getParameter("courseName");
            String courseCode = request.getParameter("courseCode");
            String courseworkStr = request.getParameter("coursework");
            String examStr = request.getParameter("exam");

            // Validate that all parameters are provided
            if (courseName == null || courseCode == null || 
                courseworkStr == null || examStr == null ||
                courseName.trim().isEmpty() || courseCode.trim().isEmpty()) {
                request.setAttribute("message", "ERROR: All fields are required.");
                request.getRequestDispatcher("result.jsp").forward(request, response);
                return;
            }

            // Validate and parse numeric inputs
            int coursework;
            int exam;
            try {
                coursework = Integer.parseInt(courseworkStr.trim());
                exam = Integer.parseInt(examStr.trim());
                
                // Validate marks are within reasonable range (0-100)
                if (coursework < 0 || coursework > 100 || exam < 0 || exam > 100) {
                    request.setAttribute("message", 
                        "ERROR: Marks must be between 0 and 100.");
                    request.getRequestDispatcher("result.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                request.setAttribute("message", 
                    "ERROR: Coursework and Exam marks must be valid integers.");
                request.getRequestDispatcher("result.jsp").forward(request, response);
                return;
            }

            // Create Marks object with validated data
            Marks marks = new Marks(courseName.trim(), courseCode.trim(), coursework, exam);

            // Save marks to file (marks.txt in application directory)
            String marksFilePath = getServletContext().getRealPath("/") + "marks.txt";
            
            // Ensure parent directory exists
            Files.createDirectories(Paths.get(getServletContext().getRealPath("/")));
            
            // Write marks data to file in append mode
            try (FileWriter fileWriter = new FileWriter(marksFilePath, true);
                 PrintWriter writer = new PrintWriter(fileWriter)) {
                writer.println(marks.toFileString());
                writer.flush();
            } catch (IOException e) {
                request.setAttribute("message", 
                    "ERROR: Failed to save marks to file: " + e.getMessage());
                request.getRequestDispatcher("result.jsp").forward(request, response);
                return;
            }

            // Set success message to be displayed on result page
            String successMessage = String.format(
                "SUCCESS: Marks recorded for %s (%s) - Coursework: %d, Exam: %d, Total: %d",
                marks.getCourseName(), marks.getCourseCode(), 
                marks.getCoursework(), marks.getExam(), marks.getTotalMarks()
            );
            request.setAttribute("message", successMessage);
            
            // Forward to result.jsp for display
            request.getRequestDispatcher("result.jsp").forward(request, response);

        } catch (Exception e) {
            // Handle unexpected errors
            request.setAttribute("message", 
                "ERROR: An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("result.jsp").forward(request, response);
        }
    }

    /**
     * Handles HTTP GET requests by redirecting to the form page.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
}
