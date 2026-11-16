package dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Lớp DAO4 chung: giữ kết nối vào CSDL dùng chung cho toàn hệ thống.
 * Sửa dbUrl, dbUser, dbPassword cho đúng với MySQL trên máy của bạn.
 */
public class DAO4 {
    protected static Connection con;

    public DAO4() {
        if (con == null) {
            String dbUrl = "jdbc:mysql://localhost:3306/cinema"
                    + "?autoReconnect=true&useSSL=false&allowPublicKeyRetrieval=true"
                    + "&useUnicode=true&characterEncoding=UTF-8";
            String dbClass = "com.mysql.cj.jdbc.Driver";
            String dbUser = "root";
            String dbPassword = "123456";
            try {
                Class.forName(dbClass);
                con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
