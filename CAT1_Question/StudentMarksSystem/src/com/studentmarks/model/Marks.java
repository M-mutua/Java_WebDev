package com.studentmarks.model;

/**
 * Model class representing student marks for a course.
 * Encapsulates course information and assessment marks.
 */
public class Marks {
    private String courseName;
    private String courseCode;
    private int coursework;
    private int exam;

    /**
     * Constructor to initialize a Marks object with course and mark details.
     * 
     * @param courseName the name of the course
     * @param courseCode the unique course code
     * @param coursework coursework marks out of 100
     * @param exam exam marks out of 100
     */
    public Marks(String courseName, String courseCode, int coursework, int exam) {
        this.courseName = courseName;
        this.courseCode = courseCode;
        this.coursework = coursework;
        this.exam = exam;
    }

    // Getters
    public String getCourseName() {
        return courseName;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public int getCoursework() {
        return coursework;
    }

    public int getExam() {
        return exam;
    }

    /**
     * Formats the marks data as CSV string for file storage.
     * Format: courseName,courseCode,coursework,exam
     * 
     * @return CSV formatted string representation of the marks
     */
    public String toFileString() {
        return String.format("%s,%s,%d,%d", courseName, courseCode, coursework, exam);
    }

    /**
     * Returns a formatted string representation of the marks for display.
     * 
     * @return formatted display string
     */
    @Override
    public String toString() {
        return String.format("Course: %s (%s) | Coursework: %d | Exam: %d", 
                courseName, courseCode, coursework, exam);
    }

    /**
     * Calculates the total marks (coursework + exam).
     * 
     * @return total marks
     */
    public int getTotalMarks() {
        return coursework + exam;
    }
}
