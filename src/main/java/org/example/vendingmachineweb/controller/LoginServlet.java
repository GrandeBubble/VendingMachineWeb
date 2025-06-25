package org.example.vendingmachineweb.controller;

import jakarta.servlet.annotation.WebServlet;
import org.example.vendingmachineweb.util.DBUtil;
import org.example.vendingmachineweb.util.DBInitializer;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "LoginServlet", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
        // 初始化数据库
        DBInitializer.initializeDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8"); // 设置内容类型为 HTML

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // 登录成功，跳转到首页
                response.sendRedirect("index.jsp");
            } else {
                // 登录失败，弹窗提示并跳回登录页
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('用户名或密码有误！请重试');");
                out.println("window.location.href='login.jsp';");
                out.println("</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
