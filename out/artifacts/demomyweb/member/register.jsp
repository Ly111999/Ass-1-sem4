<%@ page import="com.t1708m.entity.Student" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Student student = (Student) request.getAttribute("student");
    if (student == null) {
        student = new Student();
    }
%>
<html>
<head>
    <title>Register page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <style>
        .container{
            margin-top: 50px;
            padding: 3%;
            box-shadow: 0 3px 5px 0 rgba(0, 0, 0, 0.2), 0 6px 16px 0 rgba(0, 0, 0, 0.19);
        }

        i{
            margin-top: 5px;
            size: 10px;
        }

        @media (min-width: 768px) {
            .field-label-responsive {
                padding-top: .5rem;
                text-align: right;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <form class="form-horizontal" role="form" method="POST" action="/member/register">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h2>Register New User</h2>
                <hr>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label>Username</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fas fa-user"></i></div>
                        <input type="text" name="username" class="form-control" value="<%=student.getUsername()%>"
                               placeholder="John Doe" required autofocus>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <!-- Put name validation error messages here -->
                        </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label>Full name</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fas fa-user"></i></div>
                        <input type="text" name="fullName" class="form-control" value="<%=student.getFullName()%>"
                               placeholder="Nguyen Van A" required autofocus>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <!-- Put e-mail validation error messages here -->
                        </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label>E-Mail Address</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fas fa-envelope"></i></div>
                        <input type="email" name="email" class="form-control" value="<%=student.getEmail()%>"
                               placeholder="you@example.com" required autofocus>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <!-- Put e-mail validation error messages here -->
                        </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="password">Password</label>
            </div>
            <div class="col-md-6">
                <div class="form-group has-danger">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-key"></i></div>
                        <input type="password" name="password" class="form-control" id="password"
                               placeholder="Password" required>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <%--                            <i class="fa fa-close"></i>--%>
                        </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label>Confirm Password</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem">
                            <i class="fas fa-redo-alt"></i>
                        </div>
                        <input type="password" name="confirmPassword" class="form-control" placeholder="Password"
                               required>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <%--                            <i class="fa fa-close"></i>--%>
                        </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive" style="margin-right: 40px;">
                <label>Role</label>
            </div>
            <div class="col-md-5">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <select class="form-control" name="role">
                            <option value="1">Admin</option>
                            <option value="2">User</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label>Address</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fas fa-address-card"></i></div>
                        <input type="text" name="address" class="form-control" value="<%=student.getAddress()%>"
                               placeholder="Ha Noi" required autofocus>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <%--                            <i class="fa fa-close"></i>--%>
                        </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label>Phone</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fas fa-mobile-alt"></i></div>
                        <input type="text" name="phone" class="form-control" value="<%=student.getPhone()%>"
                               placeholder="0987654321" required autofocus>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <%--                            <i class="fa fa-close"></i>--%>
                        </span>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <!-- Put e-mail validation error messages here -->
                        </span>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-success"><i class="fa fa-user"></i> Register</button>
            </div>
            <div class="col-md-3 login">
                <a href="/member/login">Login now</a>
            </div>

        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
</body>
</html>
