 <%@include file="adminHeader.jsp" %>

  <%@page import="project.ConnectionProvider"%>
 <%@page import="java.sql.*"%>
 <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; padding: 20px;">
    <div style="background: white; padding: 20px; border-radius: 10px; text-align: center; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
        <div style="font-size: 40px;">📦</div>
        <h3>Total Products</h3>
        <p style="font-size: 30px; color: #27ae60;">
        <% 
        try{
            Connection con=ConnectionProvider.getCon();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select count(*) from product");
            if(rs.next()) out.print(rs.getInt(1));
        }catch(Exception e){}
        %>
        </p>
    </div>
    
    <div style="background: white; padding: 20px; border-radius: 10px; text-align: center; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
        <div style="font-size: 40px;">🛒</div>
        <h3>Total Orders</h3>
        <p style="font-size: 30px; color: #e67e22;">
        <% 
        try{
            Connection con=ConnectionProvider.getCon();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select count(*) from cart where orderDate is not null");
            if(rs.next()) out.print(rs.getInt(1));
        }catch(Exception e){}
        %>
        </p>
    </div>
    
    <div style="background: white; padding: 20px; border-radius: 10px; text-align: center; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
        <div style="font-size: 40px;">👥</div>
        <h3>Total Users</h3>
        <p style="font-size: 30px; color: #3498db;">
        <% 
        try{
            Connection con=ConnectionProvider.getCon();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select count(*) from users");
            if(rs.next()) out.print(rs.getInt(1));
        }catch(Exception e){}
        %>
        </p>
    </div>
</div>