package org.example.vendingmachineweb.util;

import java.sql.Connection;
import java.sql.Statement;

public class DBInitializer {

    public static void initializeDatabase() {
        try (Connection conn = DBUtil.getConnection();
                Statement stmt = conn.createStatement()) {

            // 创建用户表
            String createTableSQL = "CREATE TABLE IF NOT EXISTS users (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY," +
                    "username VARCHAR(50) NOT NULL UNIQUE," +
                    "password VARCHAR(100) NOT NULL" +
                    ")";

            stmt.execute(createTableSQL);

            // 插入默认用户（如果不存在）
            String insertUserSQL = "INSERT IGNORE INTO users (username, password) " +
                    "VALUES ('admin', 'admin123')";

            stmt.execute(insertUserSQL);

            System.out.println("数据库初始化完成！");

        } catch (Exception e) {
            System.err.println("数据库初始化失败: " + e.getMessage());
            e.printStackTrace();
        }
    }
}