<%@page import="project.ConnectionProvider"%>
 <%@page import="java.sql.*"%>
 <%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>ShopEase - Best Online Shopping Store</title>
    <style>
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-align: center;
            padding: 100px 20px;
            margin-bottom: 50px;
        }
        .hero-section h1 {
            font-size: 48px;
            margin-bottom: 20px;
        }
        .hero-section p {
            font-size: 20px;
            margin-bottom: 30px;
        }
        .cta-button {
            background: white;
            color: #667eea;
            padding: 15px 40px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
            transition: all 0.3s;
        }
        .cta-button:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 20px rgba(0,0,0,0.2);
        }
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            max-width: 1200px;
            margin: 50px auto;
            padding: 0 20px;
        }
        .feature {
            text-align: center;
            padding: 30px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        .feature i {
            font-size: 50px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 20px;
        }
        .categories {
            max-width: 1200px;
            margin: 50px auto;
            padding: 0 20px;
        }
        .category-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .category-card {
            background: white;
            border-radius: 10px;
            padding: 40px;
            text-align: center;
            transition: all 0.3s;
            cursor: pointer;
        }
        .category-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>

<div class="hero-section">
    <h1>Welcome to ShopEase</h1>
    <p>Your one-stop destination for amazing products at unbeatable prices!</p>
    <a href="home.jsp" class="cta-button">Start Shopping <i class="fas fa-arrow-right"></i></a>
</div>

<div class="features">
    <div class="feature">
        <i class="fas fa-truck"></i>
        <h3>Free Delivery</h3>
        <p>Free shipping on orders above ₹999</p>
    </div>
    <div class="feature">
        <i class="fas fa-shield-alt"></i>
        <h3>Secure Payment</h3>
        <p>100% secure payment gateway</p>
    </div>
    <div class="feature">
        <i class="fas fa-undo-alt"></i>
        <h3>Easy Returns</h3>
        <p>30 days return policy</p>
    </div>
    <div class="feature">
        <i class="fas fa-headset"></i>
        <h3>24/7 Support</h3>
        <p>Dedicated customer support</p>
    </div>
</div>

<div class="categories">
    <h2 style="text-align: center;">Shop by Category</h2>
    <div class="category-grid">
        <div class="category-card" onclick="location.href='home.jsp?category=Electronics'">
            <i class="fas fa-mobile-alt fa-3x" style="color: #667eea;"></i>
            <h4>Electronics</h4>
        </div>
        <div class="category-card" onclick="location.href='home.jsp?category=Clothing'">
            <i class="fas fa-tshirt fa-3x" style="color: #667eea;"></i>
            <h4>Clothing</h4>
        </div>
        <div class="category-card" onclick="location.href='home.jsp?category=Accessories'">
            <i class="fas fa-headphones fa-3x" style="color: #667eea;"></i>
            <h4>Accessories</h4>
        </div>
        <div class="category-card" onclick="location.href='home.jsp?category=Books'">
            <i class="fas fa-book fa-3x" style="color: #667eea;"></i>
            <h4>Books</h4>
        </div>
    </div>
</div>

<%
// Display featured products
try {
    java.sql.Connection con = project.ConnectionProvider.getCon();
    java.sql.Statement st = con.createStatement();
    java.sql.ResultSet rs = st.executeQuery("SELECT * FROM product WHERE active='Yes' LIMIT 4");
%>
<div class="product-grid" style="max-width: 1200px; margin: 50px auto; padding: 0 20px;">
    <h2 style="text-align: center; margin-bottom: 30px;">Featured Products</h2>
    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 30px;">
    <%
    while(rs.next()) {
    %>
        <div class="product-card">
            <div class="product-image">
                <i class="fas fa-box-open fa-4x"></i>
            </div>
            <div class="product-info">
                <div class="product-title"><%=rs.getString("name")%></div>
                <div class="product-price">₹<%=rs.getInt("price")%></div>
                <a href="addToCartAction.jsp?id=<%=rs.getInt("id")%>" class="add-to-cart-btn">
                    <i class="fas fa-cart-plus"></i> Add to Cart
                </a>
            </div>
        </div>
    <%
    }
    %>
    </div>
</div>
<%
} catch(Exception e) {
    System.out.println(e);
}
%>

<%@include file="footer.jsp" %>
</body>
</html>