<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>

<%

if(email == null) {
    response.sendRedirect("login.jsp");
    return;
}

String userName = "";
String mobileNumber = "";
String address = "";
String city = "";
String state = "";
String country = "";
int totalOrders = 0;
int totalSpent = 0;

try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    
    // Get user details
    ResultSet rs1 = st.executeQuery("SELECT * FROM users WHERE email='" + email + "'");
    if(rs1.next()) {
        userName = rs1.getString("name");
        mobileNumber = rs1.getString("mobileNumber");
        address = rs1.getString("address");
        city = rs1.getString("city");
        state = rs1.getString("state");
        country = rs1.getString("country");
    }
    
    // Get order statistics
    ResultSet rs2 = st.executeQuery("SELECT COUNT(*) as total, SUM(total) as spent FROM cart WHERE email='" + email + "' AND status='bill'");
    if(rs2.next()) {
        totalOrders = rs2.getInt("total");
        totalSpent = rs2.getInt("spent");
        if(rs2.wasNull()) totalSpent = 0;
    }
    
    con.close();
} catch(Exception e) {
    System.out.println("Profile Error: " + e);
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - ShopEase</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="css/home-style.css">
    <style>
        .profile-container {
            max-width: 1200px;
            margin: 50px auto;
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            animation: fadeIn 0.5s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .profile-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px;
            text-align: center;
        }
        
        .profile-header i {
            font-size: 80px;
            margin-bottom: 15px;
        }
        
        .profile-header h2 {
            font-size: 28px;
            margin-bottom: 10px;
        }
        
        .profile-header p {
            opacity: 0.9;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 30px;
            background: #f8f9fa;
        }
        
        .stat-card {
            background: white;
            padding: 25px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
        }
        
        .stat-card i {
            font-size: 45px;
            color: #667eea;
            margin-bottom: 15px;
        }
        
        .stat-card h3 {
            font-size: 32px;
            color: #333;
            margin-bottom: 5px;
        }
        
        .stat-card p {
            color: #666;
        }
        
        .info-section {
            padding: 30px;
        }
        
        .section-title {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
            border-left: 4px solid #667eea;
            padding-left: 15px;
        }
        
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .info-card {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
        }
        
        .info-card label {
            color: #666;
            font-size: 14px;
            display: block;
            margin-bottom: 5px;
        }
        
        .info-card p {
            color: #333;
            font-size: 18px;
            font-weight: 500;
        }
        
        .action-buttons {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-top: 20px;
        }
        
        .action-btn {
            padding: 15px;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .btn-secondary {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
        }
        
        .btn-success {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
        }
        
        .btn-warning {
            background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
            color: #333;
        }
        
        .action-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        @media (max-width: 768px) {
            .profile-container {
                margin: 20px;
            }
            
            .profile-header {
                padding: 25px;
            }
            
            .stats-grid {
                padding: 15px;
            }
            
            .info-section {
                padding: 20px;
            }
            
            .info-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

<div class="profile-container">
    <div class="profile-header">
        <i class="fas fa-user-circle"></i>
        <h2>Welcome, <%= userName %>!</h2>
        <p><i class="fas fa-envelope"></i> <%= email %></p>
        <p><i class="fas fa-calendar-alt"></i> Member since 2024</p>
    </div>
    
    <div class="stats-grid">
        <div class="stat-card">
            <i class="fas fa-shopping-cart"></i>
            <h3><%= totalOrders %></h3>
            <p>Total Orders</p>
        </div>
        <div class="stat-card">
            <i class="fas fa-rupee-sign"></i>
            <h3>₹<%= totalSpent %></h3>
            <p>Total Spent</p>
        </div>
        <div class="stat-card">
            <i class="fas fa-gift"></i>
            <h3>0</h3>
            <p>Loyalty Points</p>
        </div>
    </div>
    
    <div class="info-section">
        <h3 class="section-title"><i class="fas fa-user"></i> Personal Information</h3>
        <div class="info-grid">
            <div class="info-card">
                <label><i class="fas fa-user"></i> Full Name</label>
                <p><%= userName.isEmpty() ? "Not provided" : userName %></p>
            </div>
            <div class="info-card">
                <label><i class="fas fa-phone"></i> Mobile Number</label>
                <p><%= mobileNumber.isEmpty() ? "Not provided" : mobileNumber %></p>
            </div>
        </div>
        
        <h3 class="section-title" style="margin-top: 30px;"><i class="fas fa-map-marker-alt"></i> Shipping Address</h3>
        <div class="info-grid">
            <div class="info-card">
                <label>Address</label>
                <p><%= address.isEmpty() ? "Not provided" : address %></p>
            </div>
            <div class="info-card">
                <label>City</label>
                <p><%= city.isEmpty() ? "Not provided" : city %></p>
            </div>
            <div class="info-card">
                <label>State</label>
                <p><%= state.isEmpty() ? "Not provided" : state %></p>
            </div>
            <div class="info-card">
                <label>Country</label>
                <p><%= country.isEmpty() ? "Not provided" : country %></p>
            </div>
        </div>
        
        <h3 class="section-title" style="margin-top: 30px;"><i class="fas fa-cog"></i> Account Settings</h3>
        <div class="action-buttons">
            <a href="changeDetails.jsp" class="action-btn btn-primary">
                <i class="fas fa-user-edit"></i> Edit Profile
            </a>
            <a href="changePassword.jsp" class="action-btn btn-secondary">
                <i class="fas fa-key"></i> Change Password
            </a>
            <a href="changeMobileNumber.jsp" class="action-btn btn-success">
                <i class="fas fa-mobile-alt"></i> Update Mobile
            </a>
            <a href="addressPaymentForOrder.jsp" class="action-btn btn-warning">
                <i class="fas fa-truck"></i> Update Address
            </a>
        </div>
    </div>
</div>

<%@include file="footer.jsp" %>

</body>
</html>