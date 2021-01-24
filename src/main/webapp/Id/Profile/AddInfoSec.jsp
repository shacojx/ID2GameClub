<%-- 
    Document   : index.jsp
    Created on : Oct 25, 2020, 1:52:14 PM
    Author     : shacojx
--%>


<%@page import="DAO.AccDAO"%>
<%@page import="Function.AES"%>
<%@page import="DAO.LoginDAO"%>
<%@page import="java.util.List"%>

<%@page import="Entity.Account"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Funtap Report Security</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/fontawesome-free/css/all.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Tempusdominus Bbootstrap 4 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
        <!-- JQVMap -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/jqvmap/jqvmap.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/dist/css/adminlte.min.css">
        <!-- overlayScrollbars -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
        <!-- Daterange picker -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/daterangepicker/daterangepicker.css">
        <!-- summernote -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/summernote/summernote-bs4.css">
        <!-- Google Font: Source Sans Pro -->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">



    </head>
    <body class="hold-transition sidebar-mini layout-fixed">
        <%
            Cookie[] listCookie = request.getCookies();
            String user = "";
            String pass = "";
            for (Cookie o : listCookie) {
                if (o.getName().equals("mu")) {
                    user = o.getValue();
                }
                if (o.getName().equals("sa")) {
                    pass = o.getValue();
                }
            }
            LoginDAO loginD = new LoginDAO();
            AccDAO accd = new AccDAO();
            AES aes = new AES();
            String contextPath = request.getContextPath();
            String ulogin = "";
            Account a = null;
            if (loginD.checkLogin(aes.decrypt(user), aes.decrypt(pass)) == null) {
                response.sendRedirect(contextPath + "/Login/Login.jsp");
            } else {
                a = loginD.checkLogin(aes.decrypt(user), aes.decrypt(pass));
                ulogin = aes.decrypt(user);
            }
            Account b = accd.getAccByID(a.getId());
            if (b.getEmail().length() != 0 || b.getPhone().length() != 0
                        || b.getQuestion().length() != 0 || b.getAnswer().length() != 0) {
                    request.getRequestDispatcher("/View/403.jsp").forward(request, response);
                }

        %>
        <c:set var = "info1" scope = "request" value = "menu-open"/>
        <c:set var = "info2" scope = "request" value = "active"/>
        <c:set var = "sec" scope = "request" value = "active"/>
        <div class="wrapper">

            <jsp:include page="../Menu/Menu.jsp" />

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0 text-dark"></h1>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/FRS/world.jsp">Home</a></li>
                                    <li class="breadcrumb-item active">Thêm Thông Tin Bảo Mật</li>
                                </ol>
                            </div><!-- /.col -->
                        </div><!-- /.row -->
                    </div><!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <!-- Small boxes (Stat box) -->

                        <div class="row">
                            <div class="col-12">
                                <!-- general form elements -->
                                <div class="card card-primary">
                                    <div class="card-header">
                                        <h3 class="card-title">Thêm Thông Tin Bảo Mật</h3>
                                    </div>
                                    <!-- /.card-header -->

                                    <!-- form start -->
                                    <form role="form" action="${pageContext.request.contextPath}/AddInfoSec" method="post">
                                        <div class="card-body">

                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Email</label>
                                                <input name="email" type="text" class="form-control" id="exampleInputFile">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Số Điện Thoại</label>
                                                <input name="phone" type="text" class="form-control" id="exampleInputFile">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Câu Hỏi Bảo Mật</label>
                                                <select name="questions" id="country" class="form-control">
                                                    <option>--- Chọn ---</option>
                                                    <option>Tên ngày bé của bạn là gì?</option>
                                                    <option>Biệt danh của bạn là gì?</option>
                                                    <option>Họ và tên bố của bạn là gì?</option>
                                                    <option>Họ và tên mẹ của bạn là gì?</option>
                                                    <option>Họ và tên vợ/chồng của bạn là gì?</option>
                                                    <option>Họ và tên con của bạn là gì?</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Câu Trả Lời</label>
                                                <input name="answer" type="text" class="form-control" id="exampleInputFile">
                                            </div>

                                        </div>
                                        <!-- /.card-body -->
                                        <div>${mess}</div>
                                        <div class="card-footer">
                                            <button type="submit" class="btn btn-primary">Thêm Dữ Liệu</button>
                                        </div>
                                    </form>
                                </div>
                                <!-- /.card -->
                            </div>

                        </div>


                    </div><!-- /.container-fluid -->
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <jsp:include page="../Menu/Footer.jsp" />

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->
        </div>
        <!-- ./wrapper -->



        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/AdminLTE/plugins/jquery/jquery.min.js"></script>
        <!-- jQuery UI 1.11.4 -->
        <script src="${pageContext.request.contextPath}/AdminLTE/plugins/jquery-ui/jquery-ui.min.js"></script>
        <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
        <script>
            $.widget.bridge('uibutton', $.ui.button)
        </script>
        <!-- Bootstrap 4 -->
        <script src="${pageContext.request.contextPath}/AdminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- ChartJS -->
        <script src="${pageContext.request.contextPath}/AdminLTE/plugins/chart.js/Chart.min.js"></script>
        <!-- Sparkline -->
        <script src="${pageContext.request.contextPath}/AdminLTE/plugins/sparklines/sparkline.js"></script>
        <!-- JQVMap -->
        <script src="${pageContext.request.contextPath}/AdminLTE/plugins/jqvmap/jquery.vmap.min.js"></script>
        <script src="${pageContext.request.contextPath}/AdminLTE/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
        <!-- jQuery Knob Chart -->
        <script src="${pageContext.request.contextPath}/AdminLTE/plugins/jquery-knob/jquery.knob.min.js"></script>
        <!-- daterangepicker -->
        <script src="${pageContext.request.contextPath}/AdminLTE/plugins/moment/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/AdminLTE/plugins/daterangepicker/daterangepicker.js"></script>
        <!-- Tempusdominus Bootstrap 4 -->
        <script src="${pageContext.request.contextPath}/AdminLTE/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
        <!-- Summernote -->
        <script src="${pageContext.request.contextPath}/AdminLTE/plugins/summernote/summernote-bs4.min.js"></script>
        <!-- overlayScrollbars -->
        <script src="${pageContext.request.contextPath}/AdminLTE/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath}/AdminLTE/dist/js/adminlte.js"></script>
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="${pageContext.request.contextPath}/AdminLTE/dist/js/pages/dashboard.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="${pageContext.request.contextPath}/AdminLTE/dist/js/demo.js"></script>
    </body>
</html>

