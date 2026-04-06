<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Marks System - Submit Marks</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
        }
        
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 28px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 600;
            font-size: 14px;
        }
        
        input {
            width: 100%;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        
        input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 5px rgba(102, 126, 234, 0.3);
        }
        
        .form-group input {
            width: 100%;
        }
        
        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 30px;
        }
        
        button {
            flex: 1;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        
        .btn-submit {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        
        .btn-reset {
            background: #f0f0f0;
            color: #333;
            border: 2px solid #ddd;
        }
        
        .btn-reset:hover {
            background: #e0e0e0;
        }
        
        .info-box {
            background: #f8f9fa;
            border-left: 4px solid #667eea;
            padding: 15px;
            margin-top: 20px;
            border-radius: 5px;
            font-size: 14px;
            color: #666;
        }
        
        .info-box strong {
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Student Marks System</h1>
        
        <!-- Form to submit student marks -->
        <form method="POST" action="MarksServlet">
            <!-- Course Name Input -->
            <div class="form-group">
                <label for="courseName">Course Name:</label>
                <input type="text" id="courseName" name="courseName" 
                       placeholder="e.g., Web Development" required>
            </div>
            
            <!-- Course Code Input -->
            <div class="form-group">
                <label for="courseCode">Course Code:</label>
                <input type="text" id="courseCode" name="courseCode" 
                       placeholder="e.g., COMP341" required>
            </div>
            
            <!-- Coursework Marks Input -->
            <div class="form-group">
                <label for="coursework">Coursework Marks (0-100):</label>
                <input type="number" id="coursework" name="coursework" 
                       min="0" max="100" placeholder="e.g., 75" required>
            </div>
            
            <!-- Exam Marks Input -->
            <div class="form-group">
                <label for="exam">Exam Marks (0-100):</label>
                <input type="number" id="exam" name="exam" 
                       min="0" max="100" placeholder="e.g., 80" required>
            </div>
            
            <!-- Submit and Reset Buttons -->
            <div class="button-group">
                <button type="submit" class="btn-submit">Submit Marks</button>
                <button type="reset" class="btn-reset">Clear Form</button>
            </div>
        </form>
        
        <!-- Information Box with instructions -->
        <div class="info-box">
            <strong>Instructions:</strong>
            <ul style="margin-left: 20px; margin-top: 10px;">
                <li>Enter the course name and code</li>
                <li>Enter coursework marks (0-100)</li>
                <li>Enter exam marks (0-100)</li>
                <li>Click "Submit Marks" to save</li>
            </ul>
        </div>
    </div>
</body>
</html>
