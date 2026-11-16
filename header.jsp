<%
String email = (String) session.getAttribute("email");
%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopEase - Online Shopping</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="css/home-style.css">
    <style>
        /* Navigation Bar Styles */
        .navbar {
            background: rgba(26, 26, 46, 0.95);
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 20px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
            padding: 15px 0;
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        .logo {
            font-size: 28px;
            font-weight: bold;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .logo i {
            font-size: 32px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .nav-links {
            display: flex;
            gap: 20px;
            list-style: none;
            flex-wrap: wrap;
        }

        .nav-links li a {
            color: white;
            text-decoration: none;
            padding: 8px 18px;
            border-radius: 25px;
            transition: all 0.3s;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .nav-links li a:hover {
            background: rgba(255,255,255,0.2);
            transform: translateY(-2px);
        }

        .nav-links li a i {
            font-size: 16px;
        }

        .logout-btn {
            background: linear-gradient(135deg, #eb3349 0%, #f45c43 100%);
        }

        .logout-btn:hover {
            background: linear-gradient(135deg, #f45c43 0%, #eb3349 100%);
        }

        .admin-btn {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }

        /* Mobile Menu Button */
        .menu-btn {
            display: none;
            color: white;
            font-size: 24px;
            cursor: pointer;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .menu-btn {
                display: block;
            }
            
            .nav-links {
                display: none;
                width: 100%;
                flex-direction: column;
                margin-top: 20px;
            }
            
            .nav-links.show {
                display: flex;
            }
            
            .nav-links li {
                width: 100%;
            }
            
            .nav-links li a {
                justify-content: center;
            }
        }
    </style>
</head>
<body>

<nav class="navbar">
    <div class="nav-container">
        <a href="home.jsp" class="logo">
            <i class="fas fa-shopping-bag"></i>
            ShopEase
        </a>
        
        <div class="menu-btn" onclick="toggleMenu()">
            <i class="fas fa-bars"></i>
        </div>
        
        <ul class="nav-links" id="navLinks">
            <li><a href="home.jsp"><i class="fas fa-home"></i> Home</a></li>
            
            <% if(email != null && !email.isEmpty()) { %>
                <li><a href="myCart.jsp"><i class="fas fa-shopping-cart"></i> Cart</a></li>
                <li><a href="myOrders.jsp"><i class="fas fa-box"></i> My Orders</a></li>
                <li><a href="messageUs.jsp"><i class="fas fa-envelope"></i> Contact</a></li>
                <li><a href="changeDetails.jsp"><i class="fas fa-user-circle"></i> Profile</a></li>
                
                <% if("admin@gmail.com".equals(email)) { %>
                    <li><a href="admin/adminHome.jsp" class="admin-btn"><i class="fas fa-crown"></i> Admin Panel</a></li>
                <% } %>
                
                <li><a href="logout.jsp" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            <% } else { %>
                <li><a href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                <li><a href="signup.jsp"><i class="fas fa-user-plus"></i> Sign Up</a></li>
            <% } %>
        </ul>
    </div>
</nav>

<script>
    function toggleMenu() {
        var navLinks = document.getElementById("navLinks");
        navLinks.classList.toggle("show");
    }
    
    // Close menu when clicking outside
    document.addEventListener('click', function(event) {
        var navLinks = document.getElementById("navLinks");
        var menuBtn = document.querySelector('.menu-btn');
        if (!navLinks.contains(event.target) && !menuBtn.contains(event.target)) {
            navLinks.classList.remove('show');
        }
    });
</script>

<div class="container">
<style>
.topnav {
    background: #2c3e50;
    padding: 15px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.topnav a {
    color: white;
    text-decoration: none;
    padding: 10px 15px;
    margin: 0 5px;
    border-radius: 6px;
    transition: background 0.3s;
    display: inline-block;
}

.topnav a:hover {
    background: #34495e;
}

.topnav h2 {
    margin: 0;
    padding: 10px;
    color: white;
}

@media (max-width: 768px) {
    .topnav a {
        display: block;
        margin: 5px 0;
    }
}
</style>