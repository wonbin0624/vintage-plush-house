# 中古毛绒屋 (Vintage Plush House)

> 一个基于原生 Java Web 技术栈开发的 B2C 毛绒玩具电商平台。

## 界面预览
<img width="2496" height="1360" alt="b2539e6090a2a04af9db291a982c74d8" src="https://github.com/user-attachments/assets/4f5f05ce-4e21-47c1-a345-c7e5b1988339" />

## 项目简介

本项目是一个完整的电商购物闭环系统。除了基础的商品浏览与购买功能外，项目重点在后端实现了**高并发防超卖机制**、**JDBC 原生事务控制**以及**基于 Session 的安全拦截**；在前端则进行了完整的 **Y2K 手账风 UI 重构**，提供清新治愈的购物体验。

## 技术栈

*   **后端语言**：Java (JDK 8+)
*   **Web 核心**：Servlet, JSP, JSTL, Filter, Listener
*   **数据库与持久层**：MySQL, Apache DbUtils, C3P0 数据库连接池
*   **前端技术**：HTML5, CSS3, jQuery, Bootstrap
*   **运行环境**：Apache Tomcat 8.5+

## 核心功能与技术亮点

### 1. 架构与路由封装
*   自定义 `BaseServlet` 继承 `HttpServlet`，利用 **Java 反射机制** 拦截并统一分发请求（如 `?method=login`），替代大量 `if-else` 判断，降低代码冗余，提升系统可维护性。
*   采用 `Filter` 统一处理全局字符编码，解决中文乱码问题。

### 2. 用户安全鉴权与防爆破
*   用户密码采用 **MD5 加密** 存储。
*   实现**登录防爆破机制**：基于 Session 记录登录失败次数，连续 3 次输入错误密码将自动锁定账户（数据库 `isvalidate` 字段置 1），保障系统安全。

### 3. 购物车与订单事务控制（核心）
*   基于 `HttpSession` 实现未登录状态下的购物车数据暂存。
*   在订单结算环节，手动接管 JDBC `Connection` 的 `AutoCommit` 状态（设为 `false`），利用 **try-catch 和 rollback** 保证“生成订单主表 -> 写入订单明细表 -> 扣减商品库存”三步操作的**原子性（数据一致性）**，避免产生脏数据。

### 4. 高并发防超卖机制
*   在库存扣减环节，利用 MySQL 行锁特性编写乐观锁 SQL：
    `UPDATE goods SET stock = stock - ? WHERE id = ? AND stock >= ?`
*   通过判断 SQL 受影响行数（`rows == 0`）有效拦截并发超卖，并在库存不足时主动抛出异常触发事务回滚。

## 快速启动指南

### 1. 环境准备
*   JDK 8 或更高版本
*   MySQL 5.7 或 8.0
*   Apache Tomcat 8.5 或 9.0
*   IntelliJ IDEA

### 2. 数据库配置（一键还原）
1. 在本地 MySQL 中创建一个名为 `shoppingdb` 的数据库。
2. 导入本项目根目录下的 **`shoppingdb.sql`** 脚本（已包含建表语句和测试数据）。
3. 检查并修改 `src/main/resources/c3p0-config.xml` 中的数据库连接信息（默认账号为 `root`，密码为 `123456`）：
   ```xml
   <property name="jdbcUrl">jdbc:mysql://localhost:3306/shoppingdb?characterEncoding=utf-8</property>
   <property name="user">root</property>
   <property name="password">123456</property>
