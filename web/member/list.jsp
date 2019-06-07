<%@ page import="com.t1708m.entity.Student" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Student> list = (ArrayList<Student>) request.getAttribute("list");
%>
<html>
<head>
    <title>List Student</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
</head>
<body>
<h1>List Student</h1>
<button type="button" class="btn btn-success"><i class="fas fa-user-plus"></i>&nbsp;Add student</button>
<table class="table table-striped" style="margin-top: 30px;">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Full name</th>
        <th scope="col">Username</th>
        <th scope="col">Email</th>
        <th scope="col">Phone</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <% for (int i = 0; i < list.size(); i++) {%>
    <tr>
        <th scope="row"><%= i+1%></th>
        <td><%= list.get(i).getFullName()%></td>
        <td><%= list.get(i).getUsername()%></td>
        <td><%= list.get(i).getEmail()%></td>
        <td><%= list.get(i).getPhone()%></td>
        <td>
            <button type="button" class="btn btn-success"><i class="fas fa-user-edit"></i></button>&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-danger"><i class="fas fa-user-times"></i></button>
        </td>
    </tr>
    <%}%>
    </tbody>
</table>
</body>
</html>
