<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - ShopEase</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="css/signup-style.css">
</head>
<body>
    <div class="signup-container">
        <div class="signup-header">
            <i class="fas fa-user-plus"></i>
            <h2>Create Account</h2>
            <p>Join ShopEase for amazing shopping experience!</p>
        </div>

        <%
        String msg = request.getParameter("msg");
        if("valid".equals(msg)) {
        %>
        <div class="message message-success">
            <i class="fas fa-check-circle"></i> Registration successful! Please <a href="login.jsp">login here</a>
        </div>
        <% } else if("invalid".equals(msg)) { %>
        <div class="message message-error">
            <i class="fas fa-exclamation-circle"></i> Registration failed! Please try again.
        </div>
        <% } %>

        <form action="signupAction.jsp" method="post">
            <div class="form-group">
                <label><i class="fas fa-user"></i> Full Name</label>
                <input type="text" name="name" placeholder="Enter your full name" required>
            </div>
            
            <div class="form-group">
                <label><i class="fas fa-envelope"></i> Email Address</label>
                <input type="email" name="email" placeholder="Enter your email" required>
            </div>
            
            <div class="form-group">
                <label><i class="fas fa-phone"></i> Mobile Number</label>
                <input type="tel" name="mobileNumber" placeholder="Enter your mobile number" required>
            </div>
            
            <div class="form-group">
                <label><i class="fas fa-question-circle"></i> Security Question</label>
                <select name="securityQuestion" required>
                    <option value="">Select a security question</option>
                    <option value="What is your first pet's name?">What is your first pet's name?</option>
                    <option value="What is your mother's maiden name?">What is your mother's maiden name?</option>
                    <option value="What is your favorite book?">What is your favorite book?</option>
                </select>
            </div>
            
            <div class="form-group">
                <label><i class="fas fa-key"></i> Answer</label>
                <input type="text" name="answer" placeholder="Your answer" required>
            </div>
            
            <div class="form-group">
                <label><i class="fas fa-lock"></i> Password</label>
                <input type="password" name="password" placeholder="Create a password" required>
            </div>
            
            <button type="submit" class="signup-btn">
                <i class="fas fa-user-plus"></i> Sign Up
            </button>
        </form>
        
        <div class="login-link">
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>
</body>
</html>