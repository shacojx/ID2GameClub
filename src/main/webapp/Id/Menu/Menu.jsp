<%-- 
    Document   : Menu
    Created on : Oct 27, 2020, 1:29:18 AM
    Author     : shacojx
--%>
<%@page import="Entity.Account"%>
<%@page import="Model.LoginDAO"%>
<%@page import="Controller.XuLy.AES"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

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
                    <a href="${pageContext.request.contextPath}/World" class="nav-link">Home</a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a href="${pageContext.request.contextPath}/FRS/Contact/Contact.jsp" class="nav-link">Contact</a>
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
            <a href="${pageContext.request.contextPath}/FRS/world.jsp" class="brand-link">
                <img src="${pageContext.request.contextPath}/AdminLTE/dist/img/funtap.png" alt="Funtap Logo" class="brand-image img-circle elevation-3"
                     style="opacity: .8">
                <span class="brand-text font-weight-light">Report Security</span>
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
                        <li class="nav-item has-treeview ${dash1}">
                            <a href="#" class="nav-link ${dash2}">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>
                                    Dashboard
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/FRS/world.jsp" class="nav-link ${worlddash}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>World</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/FRS/index.jsp" class="nav-link ${fundash}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Funtap</p>
                                    </a>
                                </li>

                            </ul>
                        </li>

                        <li class="nav-item has-treeview ${vulns1}">
                            <a href="#" class="nav-link ${vulns2}">
                                <i class="nav-icon fas fa-copy"></i>
                                <p>
                                    Lỗ hổng
                                    <i class="fas fa-angle-left right"></i>
                                    <span class="badge badge-danger right">Vulnerability</span>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/GetVulns?index=1" class="nav-link ${worldvulns}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Thế giới</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/VulnsFun?index=1" class="nav-link ${funvulns}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Funtap</p>
                                    </a>
                                </li>

                            </ul>
                        </li>  
                        
                        <li class="nav-item has-treeview ${in1}">
                            <a href="#" class="nav-link ${in2}">
                                <i class="nav-icon fas fa-copy"></i>
                                <p>
                                    Incident
                                    <i class="fas fa-angle-left right"></i>
                                    
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/GetIncident?index=1" class="nav-link ${in}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Incident</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/FRS/incident/Addincident.jsp" class="nav-link ${addin}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Thêm Incident</p>
                                    </a>
                                </li>

                            </ul>
                        </li>  
                        
                        <li class="nav-item has-treeview ${addvulns1}">
                            <a href="#" class="nav-link ${addvulns2}">
                                <i class="nav-icon fas fa-chart-pie"></i>
                                <p>
                                    Thêm lỗ hổng
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/VulnsAddw" class="nav-link ${addworld}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Thế giới</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/FRS/AddVulns/AddVulnsFun.jsp" class="nav-link ${addfun}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Funtap</p>
                                    </a>
                                </li>
                                
                            </ul>
                        </li>       
                        <li class="nav-item has-treeview ${admin1}">
                            <a href="#" class="nav-link ${admin2}">
                                <i class="nav-icon fas fa-tree"></i>
                                <p>
                                    Admin Control
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/FRS/AdminControl/AddUser.jsp" class="nav-link ${adduser}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Thêm người dùng</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/GetListReg" class="nav-link ${manageruser}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Duyệt người dùng</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/ListReport?index=1" class="nav-link ${manareport}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Thống kê Report Security</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/FRS/AdminControl/ListNews.jsp" class="nav-link ${mananews}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Thống kê News Security</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                     
                        <li class="nav-item has-treeview ${monitor1}">
                            <a href="#" class="nav-link ${monitor2}">
                                <i class="nav-icon fas fa-table"></i>
                                <p>
                                    Cyber Attack Monitor
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/FRS/Monitor/Kaspersky.jsp" class="nav-link ${kaspersky}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Kaspersky Attack Map</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/FRS/Monitor/Fortinet.jsp" class="nav-link ${fortinet}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Fortinet Attack Map</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/FRS/Monitor/Checkpoint.jsp" class="nav-link ${checkpoint}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Checkpoint Attack Map</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/FRS/Monitor/Funtap.jsp" class="nav-link ${funattack}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Funtap Attack Map</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/FRS/Monitor/AddIP.jsp" class="nav-link ${addip}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Thêm IP tấn công</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-header">Tracking Tool</li>
                        <li class="nav-item has-treeview ${track1}">
                            <a href="#" class="nav-link ${track2}">
                                <i class="nav-icon fas fa-copy"></i>
                                <p>
                                    Report Tracking Tool
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/FRS/TrackingTool/TrackingLog.jsp" class="nav-link ${reportGame}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Report Game</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/FRS/TrackingTool/TrackingTool.jsp" class="nav-link ${genreportuser}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Quản Lý Report</p>

                                    </a>
                                </li>

                            </ul>
                        </li>



                        <li class="nav-header">Quản Lý Tin Tức</li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/FRS/ManagerNews/UpNews.jsp" class="nav-link ${upnews}">
                                <i class="nav-icon far fa-calendar-alt"></i>
                                <p>
                                    Thêm tin tức
                                    <span class="badge badge-success right">News</span>
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="pages/gallery.html" class="nav-link ${listnews}}">
                                <i class="nav-icon far fa-image"></i>
                                <p>
                                    Danh sách tin tức
                                </p>
                            </a>
                        </li>
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon far fa-envelope"></i>
                                <p>
                                    Mail
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="pages/mailbox/mailbox.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Gửi Email tin tức</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="pages/mailbox/compose.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Cấu hình Email</p>
                                    </a>
                                </li>

                            </ul>
                        </li>

                        <li class="nav-header">Tin Tức An Toàn Thông Tin</li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/NewSecurity" class="nav-link">
                                <i class="nav-icon fas fa-file"></i>
                                <p>Tin Tức</p>
                            </a>
                        </li>
                        <li class="nav-header">Other</li>
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