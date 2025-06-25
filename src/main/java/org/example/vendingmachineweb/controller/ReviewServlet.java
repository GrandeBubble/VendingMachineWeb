package org.example.vendingmachineweb.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.vendingmachineweb.model.Review;
import org.example.vendingmachineweb.model.ReviewStats;
import org.example.vendingmachineweb.util.ReviewDAO;

import java.io.IOException;
import java.util.List;

@WebServlet("/review")
public class ReviewServlet extends HttpServlet {
    private ReviewDAO reviewDAO = new ReviewDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 检查用户是否登录
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        String username = (String) session.getAttribute("username");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String beverageType = request.getParameter("beverageType");
        String beverageName = request.getParameter("beverageName");
        String decorators = request.getParameter("decorators");

        // 如果没有指定饮品类型，显示所有评价
        if (beverageType == null || beverageType.isEmpty()) {
            List<ReviewStats> allStats = reviewDAO.getAllBeverageStats();
            List<Review> recentReviews = reviewDAO.getRecentReviews(10);

            request.setAttribute("allStats", allStats);
            request.setAttribute("recentReviews", recentReviews);
            request.getRequestDispatcher("review.jsp").forward(request, response);
            return;
        }

        // 获取指定饮品的评价和统计
        List<Review> reviews = reviewDAO.getReviewsByBeverage(beverageType);
        ReviewStats stats = reviewDAO.getReviewStats(beverageType);

        request.setAttribute("reviews", reviews);
        request.setAttribute("stats", stats);
        request.setAttribute("beverageType", beverageType);
        request.setAttribute("beverageName", beverageName);
        request.setAttribute("decorators", decorators);
        request.setAttribute("userId", userId);
        request.setAttribute("username", username);

        request.getRequestDispatcher("review.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 检查用户是否登录
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 设置字符编码
        request.setCharacterEncoding("UTF-8");

        try {
            // 获取表单参数
            String beverageType = request.getParameter("beverageType");
            String beverageName = request.getParameter("beverageName");
            String decorators = request.getParameter("decorators");
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");

            // 验证参数
            if (beverageType == null || beverageType.isEmpty() ||
                    beverageName == null || beverageName.isEmpty() ||
                    rating < 1 || rating > 5 ||
                    comment == null || comment.trim().isEmpty()) {

                request.setAttribute("error", "请填写完整的评价信息");
                doGet(request, response);
                return;
            }

            // 创建评价对象
            Review review = new Review(userId, beverageType, beverageName, decorators, rating, comment);

            // 保存评价
            boolean success = reviewDAO.addReview(review);

            if (success) {
                // 评价成功，重定向到评价页面
                response.sendRedirect("review?beverageType=" + beverageType + "&success=true");
            } else {
                request.setAttribute("error", "评价提交失败，请重试");
                doGet(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "评分格式错误");
            doGet(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "系统错误，请稍后重试");
            doGet(request, response);
        }
    }
}