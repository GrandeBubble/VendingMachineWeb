package org.example.vendingmachineweb.util;

import org.example.vendingmachineweb.model.Review;
import org.example.vendingmachineweb.model.ReviewStats;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {

    /**
     * 添加评价
     */
    public boolean addReview(Review review) {
        String sql = "INSERT INTO reviews (user_id, beverage_type, beverage_name, decorators, rating, comment, created_at) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, review.getUserId());
            pstmt.setString(2, review.getBeverageType());
            pstmt.setString(3, review.getBeverageName());
            pstmt.setString(4, review.getDecorators());
            pstmt.setInt(5, review.getRating());
            pstmt.setString(6, review.getComment());
            pstmt.setTimestamp(7, new Timestamp(review.getCreatedAt().getTime()));

            int result = pstmt.executeUpdate();
            return result > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 根据饮品类型获取评价列表
     */
    public List<Review> getReviewsByBeverage(String beverageType) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT r.*, u.username FROM reviews r " +
                "LEFT JOIN users u ON r.user_id = u.id " +
                "WHERE r.beverage_type = ? " +
                "ORDER BY r.created_at DESC";

        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, beverageType);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Review review = new Review();
                review.setId(rs.getInt("id"));
                review.setUserId(rs.getInt("user_id"));
                review.setBeverageType(rs.getString("beverage_type"));
                review.setBeverageName(rs.getString("beverage_name"));
                review.setDecorators(rs.getString("decorators"));
                review.setRating(rs.getInt("rating"));
                review.setComment(rs.getString("comment"));
                review.setCreatedAt(rs.getTimestamp("created_at"));
                review.setUsername(rs.getString("username"));

                reviews.add(review);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reviews;
    }

    /**
     * 获取评价统计信息
     */
    public ReviewStats getReviewStats(String beverageType) {
        String sql = "SELECT beverage_type, beverage_name, COUNT(*) as total_reviews, AVG(rating) as avg_rating " +
                "FROM reviews WHERE beverage_type = ? GROUP BY beverage_type, beverage_name";

        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, beverageType);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                ReviewStats stats = new ReviewStats();
                stats.setBeverageType(rs.getString("beverage_type"));
                stats.setBeverageName(rs.getString("beverage_name"));
                stats.setTotalReviews(rs.getInt("total_reviews"));
                stats.setAvgRating(rs.getDouble("avg_rating"));
                return stats;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        // 如果没有评价，返回默认统计
        return new ReviewStats(beverageType, getBeverageName(beverageType), 0, 0.0);
    }

    /**
     * 获取最新评价
     */
    public List<Review> getRecentReviews(int limit) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT r.*, u.username FROM reviews r " +
                "LEFT JOIN users u ON r.user_id = u.id " +
                "ORDER BY r.created_at DESC LIMIT ?";

        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, limit);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Review review = new Review();
                review.setId(rs.getInt("id"));
                review.setUserId(rs.getInt("user_id"));
                review.setBeverageType(rs.getString("beverage_type"));
                review.setBeverageName(rs.getString("beverage_name"));
                review.setDecorators(rs.getString("decorators"));
                review.setRating(rs.getInt("rating"));
                review.setComment(rs.getString("comment"));
                review.setCreatedAt(rs.getTimestamp("created_at"));
                review.setUsername(rs.getString("username"));

                reviews.add(review);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reviews;
    }

    /**
     * 获取所有饮品的评价统计
     */
    public List<ReviewStats> getAllBeverageStats() {
        List<ReviewStats> statsList = new ArrayList<>();
        String sql = "SELECT beverage_type, beverage_name, COUNT(*) as total_reviews, AVG(rating) as avg_rating " +
                "FROM reviews GROUP BY beverage_type, beverage_name ORDER BY avg_rating DESC";

        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                ReviewStats stats = new ReviewStats();
                stats.setBeverageType(rs.getString("beverage_type"));
                stats.setBeverageName(rs.getString("beverage_name"));
                stats.setTotalReviews(rs.getInt("total_reviews"));
                stats.setAvgRating(rs.getDouble("avg_rating"));
                statsList.add(stats);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return statsList;
    }

    /**
     * 根据饮品类型获取饮品名称
     */
    private String getBeverageName(String beverageType) {
        switch (beverageType) {
            case "coca":
                return "可乐";
            case "coffee":
                return "咖啡";
            case "juice":
                return "果汁";
            case "milktea":
                return "奶茶";
            default:
                return "未知饮品";
        }
    }
}