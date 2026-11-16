<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ShopEase - Online Shopping</title>
<style>
    /* Modern Product Grid */
    .products-container {
        max-width: 1300px;
        margin: 0 auto;
        padding: 20px;
    }
    
    .page-title {
        text-align: center;
        color: white;
        font-size: 32px;
        margin: 20px 0;
        text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
    }
    
    .product-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 25px;
        padding: 20px 0;
    }
    
    .product-card {
        background: white;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 3px 15px rgba(0,0,0,0.1);
        transition: transform 0.3s, box-shadow 0.3s;
        cursor: pointer;
    }
    
    .product-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.15);
    }
    
    .product-icon {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        padding: 40px;
        text-align: center;
        font-size: 60px;
        color: white;
    }
    
    .product-details {
        padding: 20px;
    }
    
    .product-name {
        font-size: 18px;
        font-weight: bold;
        color: #333;
        margin-bottom: 8px;
        height: 50px;
        overflow: hidden;
    }
    
    .product-category {
        color: #888;
        font-size: 14px;
        margin-bottom: 12px;
    }
    
    .product-price {
        font-size: 24px;
        color: #e67e22;
        font-weight: bold;
        margin: 10px 0;
    }
    
    .add-to-cart-btn {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        text-decoration: none;
        padding: 10px 20px;
        border-radius: 25px;
        display: inline-block;
        width: 100%;
        text-align: center;
        font-weight: bold;
        transition: all 0.3s;
        border: none;
        cursor: pointer;
    }
    
    .add-to-cart-btn:hover {
        background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
        transform: scale(1.02);
    }
    
    /* Alert Messages */
    .alert-custom {
        max-width: 600px;
        margin: 20px auto;
        padding: 12px 20px;
        border-radius: 8px;
        text-align: center;
        animation: slideDown 0.5s ease;
    }
    
    @keyframes slideDown {
        from {
            transform: translateY(-30px);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }
    
    .alert-success {
        background: #d4edda;
        color: #155724;
        border-left: 4px solid #28a745;
    }
    
    .alert-info {
        background: #d1ecf1;
        color: #0c5460;
        border-left: 4px solid #17a2b8;
    }
    
    .alert-warning {
        background: #fff3cd;
        color: #856404;
        border-left: 4px solid #ffc107;
    }
    
    /* Empty State */
    .empty-state {
        text-align: center;
        padding: 60px 20px;
        background: white;
        border-radius: 12px;
        margin: 40px;
    }
    
    .empty-state i {
        font-size: 80px;
        color: #ccc;
        margin-bottom: 20px;
    }
    
    .empty-state h3 {
        color: #666;
        margin-bottom: 10px;
    }
    
    .empty-state p {
        color: #999;
    }
    
    /* Responsive */
    @media (max-width: 768px) {
        .product-grid {
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 15px;
            padding: 15px;
        }
        
        .product-name {
            font-size: 16px;
            height: auto;
        }
        
        .product-price {
            font-size: 20px;
        }
        
        .page-title {
            font-size: 24px;
        }
    }
</style>
</head>
<body>

<div class="products-container">
    <h2 class="page-title">
        <i class="fa fa-shopping-bag"></i> Our Products
    </h2>

    <!-- Alert Messages -->
    <%
    String msg = request.getParameter("msg");
    if("added".equals(msg)) {
    %>
    <div class="alert-custom alert-success">
        <i class="fa fa-check-circle"></i> Product added to cart successfully!
    </div>
    <% } %>
    
    <%
    if("exist".equals(msg)) {
    %>
    <div class="alert-custom alert-info">
        <i class="fa fa-info-circle"></i> Product already in cart! Quantity increased!
    </div>
    <% } %>
    
    <%
    if("invalid".equals(msg)) {
    %>
    <div class="alert-custom alert-warning">
        <i class="fa fa-exclamation-triangle"></i> Something went wrong! Please try again.
    </div>
    <% } %>

    <!-- Product Grid -->
    <div class="product-grid">
    <%
    try{
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM product WHERE active='Yes' ORDER BY id DESC");
        
        boolean hasProducts = false;
        while(rs.next()) {
            hasProducts = true;
    %>
        <div class="product-card">
            <div class="product-icon">
                <i class="fas fa-box-open"></i>
            </div>
            <div class="product-details">
                <div class="product-name">
                    <%= rs.getString("name") %>
                </div>
                <div class="product-category">
                    <i class="fa fa-tag"></i> <%= rs.getString("category") %>
                </div>
                <div class="product-price">
                    <i class="fa fa-rupee"></i> <%= rs.getString("price") %>
                </div>
                <a href="addToCartAction.jsp?id=<%= rs.getString("id") %>" class="add-to-cart-btn">
                    <i class="fas fa-cart-plus"></i> Add to Cart
                </a>
            </div>
        </div>
    <%
        }
        
        if(!hasProducts) {
    %>
        <div class="empty-state" style="grid-column: 1/-1;">
            <i class="fas fa-box-open"></i>
            <h3>No Products Available</h3>
            <p>Check back later for new products!</p>
        </div>
    <%
        }
        con.close();
    }
    catch(Exception e) {
        System.out.println("Home page error: " + e);
    %>
        <div class="empty-state" style="grid-column: 1/-1;">
            <i class="fas fa-exclamation-triangle"></i>
            <h3>Unable to load products</h3>
            <p>Please try again later</p>
        </div>
    <%
    }
    %>
    </div>
</div>

</body>
</html>