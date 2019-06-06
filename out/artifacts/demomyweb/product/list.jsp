<%@ page import="com.t1708m.entity.Product" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: huong
  Date: 6/4/2019
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("list");
%>
<html>
<head>
    <title>List product</title>
</head>
<body>
<h1>List product</h1>
<ul>
    <% for(int i = 0; i < list.size(); i++){%>
    <li><%= list.get(i).getName()%> - <%= list.get(i).getPrice()%></li>
    <%}%>
</ul>
</body>
</html>
