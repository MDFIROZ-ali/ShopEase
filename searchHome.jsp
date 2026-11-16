<%@page import="project.ConnectionProvider"%>
 <%@page import="java.sql.*"%>
  <%@include file="header.jsp" %>
  <%@include file="footer.jsp" %>
  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%
int z=0;
try{
String search=request.getParameter("search");
Connection con=ConnectionProvider.getCon();
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select *from product where name like '%"+search+"%' or category like'%"+search+"%' and active ='yes'");
while(rs.next()){
z=1;
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><i class="fa fa-inr"></i> <%=rs.getString(4) %></td>
<td><a href="addtoCartAction.jsp?id=<%=rs.getString(1) %>">Add to cart<i class='fas fa-cart-plus'></i> </a> </td>

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
      	<%if(z==0){ %>
	<h1 style="color:white; text-align: center;">Nothing to show</h1>
	<%} %>
      <br>
      <br>
      <br>
      <div class="footer">
          <p>All right reserved by Firozs Days</p>
      </div>
<!-- Search Bar -->
<div style="margin: 20px 0; text-align: center;">
    <form action="searchHome.jsp" method="get" style="display: inline-block; width: 100%; max-width: 500px;">
        <div style="display: flex; gap: 10px;">
            <input type="text" name="search" placeholder="Search products..." 
                   style="flex: 1; padding: 12px; border: 2px solid #ddd; border-radius: 25px; font-size: 16px;">
            <button type="submit" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; border: none; padding: 12px 25px; border-radius: 25px; cursor: pointer;">
                <i class="fa fa-search"></i> Search
            </button>
        </div>
    </form>
</div>
</body>
</html>