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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
</head>
<body>
<h1>List product</h1>
<button type="button" class="btn btn-success"><i class="fas fa-plus-circle"></i>&nbsp;Add product</button>
<table class="table table-striped" style="margin-top: 30px;">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Name</th>
        <th scope="col">Price</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <% for (int i = 0; i < list.size(); i++) {%>
    <tr>
        <th scope="row"><%= i + 1%>
        </th>
        <td><%= list.get(i).getName()%>
        </td>
        <td><%= list.get(i).getPrice()%>
        </td>
        <td>
            <button type="button" class="btn btn-success"><i class="fas fa-edit"></i></button>&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-danger"><i class="fas fa-trash-alt"></i></button>&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-info"><i class="fas fa-cart-plus"></i></button>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>
</body>
</html>
