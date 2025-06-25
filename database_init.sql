-- 饮品售货机系统数据库初始化脚本
-- MySQL 8.0+

-- 创建数据库
CREATE DATABASE IF NOT EXISTS vending_machine
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- 使用数据库
USE vending_machine;

-- 创建用户表
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 创建评价表
CREATE TABLE IF NOT EXISTS reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    beverage_type VARCHAR(50) NOT NULL COMMENT '饮品类型：coca, coffee, juice, milktea',
    beverage_name VARCHAR(100) NOT NULL COMMENT '饮品名称',
    decorators TEXT COMMENT '配料信息',
    rating INT NOT NULL COMMENT '评分：1-5星',
    comment TEXT COMMENT '评价内容',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 创建评价统计表（可选，用于缓存统计数据）
CREATE TABLE IF NOT EXISTS review_stats (
    beverage_type VARCHAR(50) PRIMARY KEY,
    beverage_name VARCHAR(100) NOT NULL,
    total_reviews INT DEFAULT 0,
    avg_rating DECIMAL(3,2) DEFAULT 0.00,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 插入默认管理员用户
INSERT IGNORE INTO users (username, password) VALUES ('admin', 'admin123');

-- 显示创建的表结构
DESCRIBE users;
DESCRIBE reviews;
DESCRIBE review_stats;

-- 显示插入的数据
SELECT * FROM users;