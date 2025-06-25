# 饮品售货机 Web 应用

这是一个基于Java Web技术的饮品售货机系统，使用MySQL数据库。

## 功能特性

- 🧋 饮品选择（可乐、咖啡）
- ✨ 配料添加（冰块、牛奶）
- 🔢 多份配料支持
- 💰 价格计算
- 🌈 多语言支持（中文/英文）
- 🔐 用户登录系统
- 💳 订单支付功能（下单后可扫码支付）

## 技术栈

- **后端**: Java Servlet, JSP
- **数据库**: MySQL 8.0+
- **构建工具**: Maven
- **服务器**: Jetty (开发环境)

## 快速开始

### 1. 环境要求

- Java 11 或更高版本
- Maven 3.6 或更高版本
- MySQL 8.0 或更高版本

### 2. 数据库配置

1. 安装并启动MySQL服务
2. 创建数据库：
   ```sql
   CREATE DATABASE vending_machine CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```
3. 修改 `src/main/resources/db.properties` 文件中的数据库连接信息：
   ```properties
   jdbc.driver=com.mysql.cj.jdbc.Driver
   jdbc.url=jdbc:mysql://localhost:3306/vending_machine?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8
   jdbc.username=your_username
   jdbc.password=your_password
   ```

### 3. 运行项目

```bash
# 克隆项目
git clone [项目地址]
cd VendingMachineWeb

# 编译并运行
mvn clean compile
mvn jetty:run
```

### 4. 访问应用

- 应用地址: http://localhost:8080/VendingMachineWeb
- 登录页面: http://localhost:8080/VendingMachineWeb/login.jsp

#### 支付体验

1. 登录后下单，提交订单后会出现"支付"按钮。
2. 点击"支付"按钮会跳转到支付页面，显示订单信息和应付金额。
3. 页面下方有收款二维码（可自定义替换图片）。

### 5. 默认登录信息

- 用户名: `admin`
- 密码: `admin123`

## 数据库说明

项目使用MySQL数据库，首次运行时会自动创建必要的表结构。

### 数据库结构

```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);
```

### 优势

✅ **性能**: MySQL提供更好的并发性能和查询优化
✅ **可扩展性**: 支持更复杂的查询和事务处理
✅ **企业级**: 适合生产环境部署
✅ **功能丰富**: 支持存储过程、触发器、视图等高级功能

## 项目结构

```
VendingMachineWeb/
├── src/main/java/org/example/vendingmachineweb/
│   ├── controller/          # 控制器层
│   ├── factory/            # 工厂模式实现
│   ├── model/              # 数据模型
│   └── util/               # 工具类
├── src/main/webapp/        # Web资源
├── src/main/resources/     # 配置文件
└── pom.xml                 # Maven配置
```

## 打包部署

项目可以打包为WAR文件部署到任何支持Java Web的服务器：

```bash
mvn clean package
```

生成的WAR文件位于 `target/VendingMachineWeb-1.0-SNAPSHOT.war`

## 注意事项

1. 确保MySQL服务已启动
2. 首次运行时会自动创建数据库表
3. 请根据实际情况修改数据库连接配置
4. 建议在生产环境中使用连接池优化性能

## 许可证

本项目为河海大学2022级软件工程专业程序设计方法课程设计，保留所有权利。