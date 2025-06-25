# 部署说明

## MySQL数据库配置

### 1. 安装MySQL

#### Windows
1. 下载MySQL安装包：https://dev.mysql.com/downloads/installer/
2. 运行安装程序，选择"Server only"或"Custom"安装
3. 设置root密码
4. 启动MySQL服务

#### Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install mysql-server
sudo mysql_secure_installation
```

#### macOS
```bash
brew install mysql
brew services start mysql
```

### 2. 创建数据库

使用MySQL命令行或图形化工具执行：

```bash
mysql -u root -p
```

然后执行：
```sql
CREATE DATABASE vending_machine CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

或者直接运行提供的初始化脚本：
```bash
mysql -u root -p < database_init.sql
```

### 3. 配置数据库连接

编辑 `src/main/resources/db.properties` 文件：

```properties
jdbc.driver=com.mysql.cj.jdbc.Driver
jdbc.url=jdbc:mysql://localhost:3306/vending_machine?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8
jdbc.username=your_mysql_username
jdbc.password=your_mysql_password
```

## 运行应用

### 开发环境

```bash
# 编译项目
mvn clean compile

# 启动Jetty服务器
mvn jetty:run
```

### 生产环境

```bash
# 打包WAR文件
mvn clean package

# 部署到Tomcat
cp target/VendingMachineWeb-1.0-SNAPSHOT.war $TOMCAT_HOME/webapps/
```

## 故障排除

### 常见问题

1. **连接数据库失败**
   - 检查MySQL服务是否启动
   - 验证数据库连接配置
   - 确认数据库用户权限

2. **字符编码问题**
   - 确保数据库使用utf8mb4字符集
   - 检查JDBC URL中的字符编码参数

3. **时区问题**
   - 在JDBC URL中添加serverTimezone参数
   - 确保MySQL服务器时区设置正确

### 日志查看

应用日志会输出到控制台，包括：
- 数据库连接状态
- 数据库初始化信息
- 错误信息

## 性能优化建议

1. **使用连接池**
   - 在生产环境中建议使用HikariCP或DBCP连接池
   - 配置合适的连接池大小

2. **数据库优化**
   - 为username字段创建索引
   - 定期优化数据库表

3. **应用优化**
   - 使用PreparedStatement避免SQL注入
   - 及时关闭数据库连接 