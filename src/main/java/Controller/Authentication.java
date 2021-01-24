/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.LoginDAO;
import Entity.Account;
import Function.AES;
import Function.MD5Encrypt;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class Authentication extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            MD5Encrypt md5 = new MD5Encrypt();
            AES aes = new AES();
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            String pass_md5 = md5.md5(pass);
            LoginDAO loginD = new LoginDAO();
            Account a = loginD.checkLogin(user, pass_md5);

            if (a == null) {
                request.setAttribute("mess", "Login thất bại. Kiển tra lại tài khoản hoặc mật khẩu.");
                request.getRequestDispatcher("/Login/Login.jsp").forward(request, response);
            } else {
                String ua = aes.encrypt(user);
                String pa = aes.encrypt(pass_md5);
                String ba = aes.encrypt("anh toan dep trai");
                String va  = aes.encrypt("hack giup cai");
                String ta = aes.encrypt("tuoilozdoihacktao");
                String fuckyou = "FuckDuaNaoMuonHackSiteNay";
                Cookie username = new Cookie("mu", ua);
                Cookie password = new Cookie("sa", pa);

                Cookie linhtinh1 = new Cookie("ba", ba);
                Cookie linhtinh2 = new Cookie("va", va);
                Cookie linhtinh3 = new Cookie("ta", ta);
                Cookie linhtinh4 = new Cookie("fuckyou", fuckyou);
                username.setMaxAge(60 * 60 * 6);
                password.setMaxAge(60 * 60 * 6);

                linhtinh1.setMaxAge(60 * 60 * 6);
                linhtinh2.setMaxAge(60 * 60 * 6);
                linhtinh3.setMaxAge(60 * 60 * 6);
                linhtinh4.setMaxAge(60 * 60 * 6);
                response.addCookie(linhtinh1);
                response.addCookie(username);
                response.addCookie(password);
                response.addCookie(linhtinh2);
                response.addCookie(linhtinh3);
                response.addCookie(linhtinh4);

                response.sendRedirect("CheckIndex");
            }

        } catch (SQLException ex) {
            Logger.getLogger(Authentication.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
