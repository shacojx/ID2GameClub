/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBContent.DBContext;
import Entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ShacoJX
 */
public class AccDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public int insertAcc(Account acc) throws SQLException {

        int rowCount = 0;
        try {

            String query = "INSERT INTO `tlbbdb`.`account` "
                    + "(`id`, `name`, `password`, `point`, `score`, `last_ip_login`, `date_registered`,"
                    + "`date_modified`, `is_online`, `is_lock`) "
                    + "VALUES (?, ?,?,?,?,?,?,?,?,?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, acc.getId());
            ps.setString(2, acc.getName());
            ps.setString(3, acc.getPassword());
            ps.setInt(4, acc.getPoint());
            ps.setInt(5, acc.getScore());
            ps.setString(6, acc.getLast_ip_login());
            ps.setDate(7, acc.getDate_registered());
            ps.setDate(8, acc.getDate_modified());
            ps.setInt(9, acc.getIs_online());
            ps.setInt(10, acc.getIs_lock());
            rowCount = ps.executeUpdate();
            rs = ps.getGeneratedKeys();

            return rowCount;
        } catch (Exception ex) {
            Logger.getLogger(AccDAO.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return rowCount;
    }
    
    public int Update(Account a) throws SQLException {
        int rowCount = 0;
        try {
            String query = "UPDATE `tlbbdb`.`account` SET email = ?, phone = ?, question = ?, answer = ? WHERE id=?;";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, a.getEmail());
            ps.setString(2, a.getPhone());
            ps.setString(3, a.getQuestion());
            ps.setString(4, a.getAnswer());
            ps.setInt(5, a.getId());

            rowCount = ps.executeUpdate();
            rs = ps.getGeneratedKeys();

            return rowCount;
        } catch (Exception ex) {
            Logger.getLogger(AccDAO.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return rowCount;
    }

    public int Count() throws SQLException {
        try {
            String query = "SELECT COUNT(*) FROM `tlbbdb`.`account`;";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(AccDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            rs.close();
            ps.close();
            conn.close();
        }
        return 0;
    }

}
