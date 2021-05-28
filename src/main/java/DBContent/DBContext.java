/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContent;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ShacoJX
 */
public class DBContext {
    private final String serverName = "localhost";
    private final String portNumber = "3306";
    private final String userID = "root";
    private final String passwd = "7122461311";
    private final String dbName = "tlbbdb";
    
    public Connection getConnection() throws ClassNotFoundException, SQLException{
        String url = "jdbc:mysql://" + serverName + ":"  + portNumber +"/" + dbName  + "?useUnicode=true&characterEncoding=UTF-8";
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(url,userID,passwd);
    }
}
