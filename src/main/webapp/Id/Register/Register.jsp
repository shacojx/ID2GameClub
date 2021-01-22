<%-- 
    Document   : Register
    Created on : Dec 16, 2020, 5:53:36 PM
    Author     : shacojx
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>ID 2Game Club</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/fontawesome-free/css/all.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- icheck bootstrap -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/dist/css/adminlte.min.css">
        <!-- Google Font: Source Sans Pro -->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
        <style>

            body{
                background-image: url("../images/bg.jpg") no-repeat scroll center 0 !important;
            }
        </style>
    </head>
    <body class="hold-transition register-page">

        <div id="main-home">

        </div>
        <div class="register-box">
            <div class="register-logo">
                <b>ID</b> 2Game Club
            </div>

            <div class="card">
                <div class="card-body register-card-body">
                    <p class="login-box-msg">Đăng ký tài khoản</p>

                    <form action="${pageContext.request.contextPath}/AddReg" method="post">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Tên Người Dùng" name="manv">
                            <div class="input-group-append">
                                <div class="input-group-text">

                                </div>
                            </div>
                        </div>

                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Tài Khoản Đăng Nhập" name="username">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" class="form-control" placeholder="Mật Khẩu" name="password">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" class="form-control" placeholder="Nhập lại Mật Khẩu" name="repassword">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>

                </div>

                <div class="row">
                    ${mess}
                </div>
                <div class="row">
                    <div class="col-4">
                    </div>
                    <!-- /.col -->
                    <div class="col-4">
                        <button type="submit" class="btn btn-primary btn-block">Đăng Ký</button>
                    </div>
                    <!-- /.col -->
                    <div class="col-4">
                    </div>
                    <!-- /.col -->
                </div>
                </form>


                <br>
                <a href="${pageContext.request.contextPath}/login" class="text-center">Tôi đã có tài khoản</a>
                <br>
            </div>
            <!-- /.form-box -->
        </div><!-- /.card -->

        <!-- /.register-box -->

        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/AdminLTE/plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="${pageContext.request.contextPath}/AdminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath}/AdminLTE/dist/js/adminlte.min.js"></script>
    </body>
</html>

