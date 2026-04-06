<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Marks System - Result</title>
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
            max-width: 600px;
            width: 100%;
            text-align: center;
        }
        
        h1 {
            color: #333;
            margin-bottom: 30px;
            font-size: 28px;
        }
        
        .result-box {
            padding: 30px;
            border-radius: 8px;
            margin-bottom: 30px;
            font-size: 18px;
            line-height: 1.6;
        }
        
        .result-box.success {
            background: linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%);
            color: #155724;
            border: 2px solid #28a745;
        }
        
        .result-box.error {
            background: linear-gradient(135deg, #fa8072 0%, #ff6b6b 100%);
            color: #721c24;
            border: 2px solid #dc3545;
        }
        
        .icon {
            font-size: 48px;
            margin-bottom: 15px;
        }
        
        .message {
            word-wrap: break-word;
            white-space: normal;
        }
        
        .button-group {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin-top: 30px;
        }
        
        a {
            text-decoration: none;
        }
        
        button, .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
            display: inline-block;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        
        .btn-secondary {
            background: #f0f0f0;
            color: #333;
            border: 2px solid #ddd;
        }
        
        .btn-secondary:hover {
            background: #e0e0e0;
        }
        
        .info-section {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
            border-left: 4px solid #667eea;
        }
        
        .info-section p {
            color: #666;
            margin: 10px 0;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Student Marks System</h1>
        
        <!-- Display message using JSP EL (Expression Language) -->
        <!-- The message attribute is set by the servlet -->
        
        <!-- Check if message starts with "ERROR" to determine styling -->
        <%-- Using JSP scriptlet only for conditional logic --%>
        <% String msg = (String) request.getAttribute("message"); %>
        
        <% if (msg != null && msg.startsWith("ERROR")) { %>
            <!-- Error Result Box -->
            <div class="result-box error">
                <div class="icon">❌</div>
                <div class="message">
                    <!-- Display error message using JSP EL -->
                    ${message}
                </div>
            </div>
        <% } else { %>
            <!-- Success Result Box -->
            <div class="result-box success">
                <div class="icon">✓</div>
                <div class="message">
                    <!-- Display success message using JSP EL -->
                    ${message}
                </div>
            </div>
        <% } %>
        
        <!-- Navigation buttons -->
        <div class="button-group">
            <a href="index.jsp">
                <button class="btn-primary">Submit Another</button>
            </a>
            <a href="marks.txt">
                <button class="btn-secondary">View Records</button>
            </a>
        </div>
        
        <!-- Information section -->
        <div class="info-section">
            <p><strong>Note:</strong> All submitted marks are saved to a file record in the application directory.</p>
            <p>Click "Submit Another" to submit more marks or "View Records" to see previously saved marks.</p>
        </div>
    </div>
</body>
</html>
