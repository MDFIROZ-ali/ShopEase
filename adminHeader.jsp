 <%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
   
    <%String email=session.getAttribute("email").toString(); %>
   
            <center><h2> Online shopping (Firoz Days)</h2></center>
            <a href="addNewProduct.jsp">Add New Product <i class="fa fa-plus-square"></i></a>
            <a href="allProductEditProduct.jsp">All Products & Edit Products <i class='fab fa-elementor'></i></a>
            <a href="messagesReceived.jsp">Messages Received <i class="fa fa-comment-alt"></i></a>
            <a href="ordersReceived.jsp">Orders Received <i class="fa fa-archive"></i></a>
            <a href="cancelOrders.jsp">Cancel Orders <i class="fa fa-window-close"></i></a>
            <a href="deliveredOrders.jsp">Delivered Orders <i class="fa fa-dolly"></i></a>
            <a href="../logout.jsp">Logout <i class="fa fa-share-square"></i></a>
          </div>
           <br>
           <!--table-->
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