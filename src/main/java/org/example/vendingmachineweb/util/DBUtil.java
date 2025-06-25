package org.example.vendingmachineweb.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBUtil {
    private static String URL;
    private static String USERNAME;
    private static String PASSWORD;
    private static String DRIVER;

    static {
        try {
            Properties props = new Properties();
            InputStream input = DBUtil.class.getClassLoader().getResourceAsStream("db.properties");
            if (input != null) {
                props.load(input);
                DRIVER = props.getProperty("jdbc.driver");
                URL = props.getProperty("jdbc.url");
                USERNAME = props.getProperty("jdbc.username");
                PASSWORD = props.getProperty("jdbc.password");
                input.close();
            } else {
                throw new RuntimeException("无法找到db.properties文件");
            }

            Class.forName(DRIVER); // 注册MySQL驱动
        } catch (ClassNotFoundException | IOException e) {
            e.printStackTrace();
            throw new RuntimeException("数据库驱动加载失败", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
}
