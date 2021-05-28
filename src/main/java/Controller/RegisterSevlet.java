/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AccDAO;
import Entity.Account;
import Function.MD5Encrypt;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ShacoJX
 */
public class RegisterSevlet extends HttpServlet {

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
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String repassword = request.getParameter("repassword");
            if (username.trim().length() == 0 || password.trim().length() == 0 || repassword.trim().length() == 0) {
                request.setAttribute("mess", "<p style=\"color: red;\">Đăng ký Thất Bại, Không được bỏ trống các ô</p>");
                request.getRequestDispatcher("/Id/Register/Register.jsp").forward(request, response);
            }else if(username.trim().contains(" ")){
                request.setAttribute("mess", "<p style=\"color: red;\">Đăng ký Thất Bại, Tài Khoản không được có khoảng trắng (dấu cách)</p>");
                request.getRequestDispatcher("/Id/Register/Register.jsp").forward(request, response);
            }else if(password.trim().equals(repassword.trim()) == false){
                request.setAttribute("mess", "<p style=\"color: red;\">Đăng ký Thất Bại, Mật khẩu và nhập lại mật khẩu không khớp</p>");
                request.getRequestDispatcher("/Id/Register/Register.jsp").forward(request, response);
            }else {
                SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
                Date date = new Date();
                String date_reg = formatter.format(date);
                 java.sql.Date date_r =  java.sql.Date.valueOf(date_reg);
                MD5Encrypt md5 = new MD5Encrypt();
                AccDAO accd = new AccDAO();
                String pass_md5 = md5.md5(password);
                int id = accd.Count() + 1;
                Account acc = new Account(id, username, pass_md5,"5yr9DqKxGro=","123456","","",
                        "","","","","","",0, 0, "127.0.0.1",date_r , date_r, 0,0);
                accd.insertAcc(acc);
                request.setAttribute("mess", "<p style=\"color: #3ac33ad1;\">Đăng ký Thành Công</p>");
                request.getRequestDispatcher("/Login/Login.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterSevlet.class.getName()).log(Level.SEVERE, null, ex);
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
