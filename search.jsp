<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>

<%
String searchTerm = request.getParameter("search");
if(searchTerm == null) searchTerm = "";
%>

<div style="text-align: center; padding: 40px 20px;">
    <h1 style="color: white;">Search Results for: "<%=searchTerm%>"</h1>
</div>

<div class="product-grid">
<%
try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM product WHERE active='Yes' AND (name LIKE ? OR category LIKE ? OR description LIKE ?)"
    );
    String searchPattern = "%" + searchTerm + "%";
    ps.setString(1, searchPattern);
    ps.setString(2, searchPattern);
    ps.setString(3, searchPattern);
    
    ResultSet rs = ps.executeQuery();
    boolean found = false;
    
    while(rs.next()) {
        found = true;
%>
    <div class="product-card">
        <div class="product-image">
            <i class="fas fa-box-open fa-4x"></i>
        </div>
        <div class="product-info">
            <div class="product-title"><%=rs.getString("name")%></div>
            <div class="product-category"><i class="fas fa-tag"></i> <%=rs.getString("category")%></div>
            <div class="product-price">₹<%=rs.getInt("price")%></div>
            <a href="addToCartAction.jsp?id=<%=rs.getInt("id")%>" class="add-to-cart-btn">
                <i class="fas fa-cart-plus"></i> Add to Cart
            </a>
        </div>
    </div>
<%
    }
    
    if(!found) {
%>
    <div style="text-align: center; padding: 60px; background: white; border-radius: 15px; grid-column: 1/-1;">
        <i class="fas fa-search" style="font-size: 80px; color: #ccc;"></i>
        <h3 style="margin-top: 20px;">No products found for "<%=searchTerm%>"</h3>
        <p>Try searching with different keywords!</p>
        <a href="home.jsp" class="btn btn-primary" style="margin-top: 20px; display: inline-block;">
            Browse All Products
        </a>
    </div>
<%
    }
} catch(Exception e) {
    System.out.println(e);
}
%>
</div>

<%@include file="footer.jsp" %>