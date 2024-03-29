/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AccDAO;
import DAO.LoginDAO;
import Entity.Account;
import Function.AES;
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
public class AddInfoSec extends HttpServlet {

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
            Account a = null;
            if (loginD.checkLogin(aes.decrypt(user), aes.decrypt(pass)) == null) {
                request.getRequestDispatcher("/Login/Login.jsp").forward(request, response);
            } else {
                a = loginD.checkLogin(aes.decrypt(user), aes.decrypt(pass));
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String questions = request.getParameter("questions");
                String answer = request.getParameter("answer");
                if (email.trim().length() == 0 || phone.trim().length() == 0 || questions.trim().length() == 0
                        || answer.trim().length() == 0 || questions.equalsIgnoreCase("--- Chọn ---") 
                        || email == null || phone == null || questions == null || answer == null) {
                    request.setAttribute("mess", "<p style=\"color: red;\">Thêm thông tin bảo mật Thất Bại, Không được bỏ trống các ô</p>");
                    request.getRequestDispatcher("/Id/Profile/AddInfoSec.jsp").forward(request, response);
                } else {
                    AccDAO accd = new AccDAO();
                    Account b = new Account(a.getId(), questions, answer, email, phone);
                    accd.Update(b);
                    request.setAttribute("mess", "<p style=\"color: #3ac33ad1;\">Thêm thông tin bảo mật Thành Công</p>");
                    request.getRequestDispatcher("/Id/Profile/AddInfoSec.jsp").forward(request, response);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(AddInfoSec.class.getName()).log(Level.SEVERE, null, ex);
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
