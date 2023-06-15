<%-- 
    Document   : order
    Created on : Jun 14, 2023, 1:40:20 PM
    Author     : max it
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <h1>Order Details</h1>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" 
          crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
  try{
  Class.forName("com.mysql.cj.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/classicmodels", "root", "admin");
           
   Statement stmt = con.createStatement();
            
ResultSet resultset = stmt.executeQuery("SELECT orders.orderDate, orders.shippedDate, orderDetails.productCode, orderDetails.quantityOrdered, orderDetails.priceEach FROM Orders, OrderDetails WHERE orders.ordernumber = orderdetails.ordernumber AND orders.ordernumber = '" + request.getParameter("orderNumber")+ "';");

while (resultset.next()){
    
%>

        <style>
                                              
body {background-color: powderblue;}
h1   {color: orange;}
p    {color: red;}
</style>
<table> 

<tr>
    <td>Order Date: </td>
<td><%out.print(resultset.getString("orderdate"));%></td>
</tr>
<tr>
<td>Order Date: </td>
<td><%out.print(resultset.getString("orderdate"));%></td>

  <table>
<tr>
<td>Order Date: </td>
<td><%out.print(resultset.getString("orderdate"));%></td>
</tr>
<tr>
<td>Shipped Date: </td>
<td><%out.print(resultset.getString("shippeddate"));%></td>
</tr>
<tr>
<td>Product Code: </td>
<td><%out.print(resultset.getString("productcode"));%></td>
</tr>
<tr>
<td>Quantity Ordered: </td>
<td><%out.print(resultset.getString("quantityordered"));%></td>
</tr>
<tr>
<td>Price Each: </td>
<td><%out.print(resultset.getString("priceeach"));%>
</tr>
</table>
</tr>
</table>

 <%
     }//end while
            con.close();
            }catch(Exception e){
out.println(e);
}//end try catch
%>

            
            </body>
</html>
