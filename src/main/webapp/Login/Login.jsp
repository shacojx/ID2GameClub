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
    <body class="hold-transition login-page">
        
        <div class="login-box">
            <div class="login-logo">
                <b>ID</b> 2Game Club
            </div>
            <!-- /.login-logo -->
            <div class="card">
                <div class="card-body login-card-body">
                    <p class="login-box-msg">Đăng nhập</p>

                    <form action="${pageContext.request.contextPath}/Authen" method="post">
                        <div class="input-group mb-3">
                            <input name="uname" type="text" class="form-control" placeholder="Tài Khoản">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input name="passwd" type="password" class="form-control" placeholder="Mật Khẩu">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3">
                            </div>
                            <!-- /.col -->
                            <div class="col-5">
                                <button type="submit" class="btn btn-primary btn-block">Đăng Nhập</button>
                            </div>
                            <!-- /.col -->
                            <div class="col-4">
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>

                    <div class="sub-w3l">

                        <div class="right-w3l" style="color: red;">
                            ${mess}
                        </div>
                    </div>

                    <br>
                    <p class="mb-0">
                        <a href="${pageContext.request.contextPath}/Id/Register/Register.jsp" class="text-center">Đăng ký tài khoản mới</a>
                    </p>
                    <p class="mb-1">
                        <a href="forgot-password.html">Quên mật khẩu</a>
                    </p>

                </div>
                <!-- /.login-card-body -->
            </div>
        </div>
        <!-- /.login-box -->

        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/AdminLTE/plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="${pageContext.request.contextPath}/AdminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath}/AdminLTE/dist/js/adminlte.min.js"></script>

    </body>
</html>
