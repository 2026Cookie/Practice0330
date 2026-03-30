package com.wanted.crud.global;

import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class JDBCTemplate {

    /* JDBCTemplate 사용은 03_JDBC 챕터의 module02-statement 쪽을 참고해서 진행하자.
    *   (Hibernate 는 사용 ❌❌)
    *  */

    public static Connection getConnection() {

        Connection con = null;
        Properties prop = new Properties();

        try (InputStream is = JDBCTemplate.class
                .getClassLoader()
                .getResourceAsStream("db-connection.properties")) {

            if (is == null) {
                throw new RuntimeException("db-connection.properties 파일을 찾을 수 없습니다.");
            }

            prop.load(is);

            String driver = prop.getProperty("driver");
            String url = prop.getProperty("url");
            String user = prop.getProperty("user");
            String password = prop.getProperty("password");

            Class.forName(driver);

            con = DriverManager.getConnection(url, user, password);

        } catch (Exception e) {
            throw new RuntimeException("DB 연결 실패", e);
        }

        return con;
    }

    public static void close(Connection con) {
        try {
            if (con != null && !con.isClosed()) {
                con.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void close(Statement stmt) {
        try {
            if (stmt != null && !stmt.isClosed()) {
                stmt.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void close(ResultSet rset) {
        try {
            if (rset != null && !rset.isClosed()) {
                rset.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}