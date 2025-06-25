# 饮品售货机 Web 应用

这是一个基于Java Web技术的饮品售货机系统，使用MySQL数据库。

## 功能特性

- 🧋 饮品选择（可乐、咖啡、果汁、奶茶）
- ✨ 智能配料系统（冰块、牛奶、珍珠、椰果、布丁、糖）
- 🔄 饮品配料联动（不同饮品可选配料不同）
- 🔢 多份配料支持
- 💰 实时价格计算
- 🌈 多语言支持（中文/英文）
- 🔐 用户登录系统
- 💳 订单支付功能（下单后可扫码支付）

## 饮品与配料

### 🧋 饮品列表
| 饮品 | 价格 | 可选配料 |
|------|------|----------|
| 🥤 可乐 | ￥1.0 | 冰块、糖 |
| ☕ 咖啡 | ￥2.0 | 冰块、牛奶、糖 |
| 🍹 果汁 | ￥2.5 | 冰块、糖 |
| 🧋 奶茶 | ￥3.0 | 冰块、珍珠、椰果、布丁、糖 |

### ✨ 配料列表
| 配料 | 价格 | 适用饮品 |
|------|------|----------|
| 🧊 冰块 | ￥0.5 | 所有饮品 |
| 🥛 牛奶 | ￥0.5 | 咖啡 |
| 🟤 珍珠 | ￥1.0 | 奶茶 |
| 🥥 椰果 | ￥1.0 | 奶茶 |
| 🍮 布丁 | ￥1.0 | 奶茶 |
| 🍯 糖 | ￥0.2 | 可乐、咖啡、果汁、奶茶 |

### 🔄 智能联动功能
系统会根据用户选择的饮品，自动显示对应的可选配料：
- 选择可乐时，配料选项只显示冰块和糖
- 选择咖啡时，配料选项显示冰块、牛奶和糖
- 选择果汁时，配料选项只显示冰块和糖
- 选择奶茶时，配料选项显示所有配料（冰块、珍珠、椰果、布丁、糖）

## 技术栈

- **后端**: Java Servlet, JSP
- **数据库**: MySQL 8.0+
- **构建工具**: Maven
- **服务器**: Jetty (开发环境)
- **设计模式**: 工厂模式、装饰器模式

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

#### 使用流程

1. **登录系统**：使用默认账号登录
2. **选择饮品**：从下拉菜单中选择想要的饮品
3. **选择配料**：系统会根据饮品自动显示可选配料
4. **设置数量**：输入配料份数（默认为1）
5. **提交订单**：点击提交查看订单详情
6. **支付订单**：点击支付按钮完成购买

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
│   │   ├── LoginServlet.java
│   │   ├── ShopService.java
│   │   ├── NoBeverage.java
│   │   └── NoDecorator.java
│   ├── factory/            # 工厂模式实现
│   │   ├── BeverageFactory.java
│   │   ├── DecoratorFactory.java
│   │   └── Factory.java
│   ├── model/              # 数据模型
│   │   ├── Beverage.java   # 饮品基类
│   │   ├── Coca.java       # 可乐
│   │   ├── Coffee.java     # 咖啡
│   │   ├── Juice.java      # 果汁
│   │   ├── MilkTea.java    # 奶茶
│   │   ├── Decorator.java  # 配料基类
│   │   ├── IceDecorator.java    # 冰块
│   │   ├── MilkDecorator.java   # 牛奶
│   │   ├── PearlDecorator.java  # 珍珠
│   │   ├── CoconutDecorator.java # 椰果
│   │   ├── PuddingDecorator.java # 布丁
│   │   └── SugarDecorator.java   # 糖
│   └── util/               # 工具类
│       ├── DBUtil.java
│       └── DBInitializer.java
├── src/main/webapp/        # Web资源
│   ├── index.jsp          # 主页面
│   ├── login.jsp          # 登录页面
│   ├── pay.jsp            # 支付页面
│   └── WEB-INF/
│       └── web.xml        # Web配置
├── src/main/resources/     # 配置文件
│   └── db.properties      # 数据库配置
└── pom.xml                 # Maven配置
```

## 设计模式

### 工厂模式 (Factory Pattern)
- `BeverageFactory`: 负责创建不同类型的饮品对象
- `DecoratorFactory`: 负责创建不同类型的配料装饰器对象

### 装饰器模式 (Decorator Pattern)
- `Beverage`: 饮品基类
- `Decorator`: 配料基类，继承自Beverage
- 各种配料类：通过装饰器模式动态添加配料功能

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
5. 饮品与配料的联动逻辑在前端JavaScript中实现

## 更新日志

### v2.0.0 (最新)
- ✨ 新增果汁和奶茶饮品
- ✨ 新增珍珠、椰果、布丁、糖配料
- 🔄 实现饮品与配料的智能联动
- 🌐 统一所有描述信息为中文
- 📱 优化用户界面和交互体验

### v1.0.0
- 🧋 基础饮品选择功能
- ✨ 基础配料添加功能
- 🔐 用户登录系统
- 💳 订单支付功能

## 许可证

本项目为河海大学2022级软件工程专业程序设计方法课程设计，保留所有权利。