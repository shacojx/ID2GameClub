<%-- 
    Document   : Menu
    Created on : Oct 27, 2020, 1:29:18 AM
    Author     : shacojx
--%>
<%@page import="Function.AES"%>
<%@page import="DAO.LoginDAO"%>
<%@page import="Entity.Account"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ID 2Game Club</title>

    </head>
    <body>
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


        %>
        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a href="${pageContext.request.contextPath}/Profile" class="nav-link">Trang chủ</a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a href="${pageContext.request.contextPath}/FRS/Contact/Contact.jsp" class="nav-link">Liên Lạc</a>
                </li>
            </ul>
            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">


                <li class="nav-item">
                    <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                        <i class="fas fa-th-large"></i>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.navbar -->
        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="${pageContext.request.contextPath}/Profile" class="brand-link">
                <img src="${pageContext.request.contextPath}/AdminLTE/dist/img/ano.png" alt="ID 2Game Logo" class="brand-image img-circle elevation-3"
                     style="opacity: .8">
                <span class="brand-text font-weight-light">ID 2Game Club</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="${pageContext.request.contextPath}/AdminLTE/dist/img/ano.png" class="img-circle elevation-2" alt="User Image">
                    </div>
                    <div class="info">
                        <a href="${pageContext.request.contextPath}/Profile" class="d-block"><%=ulogin%></a>
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <!-- Add icons to the links using the .nav-icon class
                             with font-awesome or any other icon font library -->
                        <li class="nav-item has-treeview ${info1}">
                            <a href="#" class="nav-link ${info2}">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>
                                    Thông tin
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/Profile" class="nav-link ${profile}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Tài Khoản</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/Id/Profile/AddInfoSec.jsp" class="nav-link ${sec}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Bảo Mật</p>
                                    </a>
                                </li>

                            </ul>
                        </li>
 
                        <li class="nav-item has-treeview ${addvulns1}">
                            <a href="#" class="nav-link ${addvulns2}">
                                <i class="nav-icon fas fa-chart-pie"></i>
                                <p>
                                    Nạp Thẻ
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/VulnsAddw" class="nav-link ${addworld}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Nạp Thẻ</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/FRS/AddVulns/AddVulnsFun.jsp" class="nav-link ${addfun}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Lịch Sử Nạp</p>
                                    </a>
                                </li>
                                
                            </ul>
                        </li>       

                        
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/FRS/Profile/ChangePass.jsp" class="nav-link">
                                <i class="fas fa-circle nav-icon"></i>
                                <p>Đổi mật khẩu</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/Logout" class="nav-link">
                                <i class="fas fa-circle nav-icon"></i>
                                <p>Đăng xuất</p>
                            </a>
                        </li>

                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>


    </body>
</html>