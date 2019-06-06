<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: huong
  Date: 6/4/2019
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Login page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <style>
        .container {
            margin-top: 50px;
            padding: 3%;
            box-shadow: 0 3px 5px 0 rgba(0, 0, 0, 0.2), 0 6px 16px 0 rgba(0, 0, 0, 0.19);
        }

        i {
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
    <form class="form-horizontal" role="form" method="POST" action="/member/login">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h2>Login</h2>
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
                        <input type="text" name="username" class="form-control"
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
                            <%--                            <i class="fa fa-close"> Example Error Message</i>--%>
                        </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-success"><i class="fa fa-user"></i> Login</button>
            </div>
            <div class="col-md-3 login">
                <a href="/member/register">Register now</a>
            </div>

        </div>
    </form>
</div>
</body>
</html>
