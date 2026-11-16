<%@page import="project.ConnectionProvider"%>
 <%@page import="java.sql.*"%>
  <%@include file="adminHeader.jsp" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div class="table-responsive" style="overflow-x: auto;">
<table style="width: 100%; background: white; border-collapse: collapse;">
    <thead>
        <tr style="background: #2c3e50; color: white;">
            <th style="padding: 12px;">ID</th>
            <th style="padding: 12px;">Name</th>
            <th style="padding: 12px;">Category</th>
            <th style="padding: 12px;">Price</th>
            <th style="padding: 12px;">Status</th>
            <th style="padding: 12px;">Edit</th>
        </tr>
    </thead>
    <tbody>
<%
try{
    Connection con=ConnectionProvider.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select *from product");
    while(rs.next())
    {
%>
        <tr style="border-bottom: 1px solid #eee;">
            <td style="padding: 10px; text-align: center;"><%=rs.getString(1) %></td>
            <td style="padding: 10px;"><%=rs.getString(2) %></td>
            <td style="padding: 10px;"><%=rs.getString(3) %></td>
            <td style="padding: 10px;">₹<%=rs.getString(4) %></td>
            <td style="padding: 10px; text-align: center;">
                <span style="background: <%=rs.getString(5).equals("Yes") ? "#d4edda" : "#f8d7da" %>; padding: 3px 10px; border-radius: 12px;">
                    <%=rs.getString(5) %>
                </span>
            </td>
            <td style="padding: 10px; text-align: center;">
                <a href="editProduct.jsp?id=<%=rs.getString(1)%>" style="color: #27ae60; text-decoration: none;">✏️ Edit</a>
            </td>
        </tr>
<%
    }
}
catch(Exception e)
{
    System.out.println(e);
}
%>
    </tbody>
</table>
</div>
      
      <br>
      <br>
      <br>

</body>
</html>