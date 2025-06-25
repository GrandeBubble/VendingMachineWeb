package org.example.vendingmachineweb.model;

import java.util.Date;

public class ReviewStats {
    private String beverageType;
    private String beverageName;
    private int totalReviews;
    private double avgRating;
    private Date lastUpdated;

    // 默认构造函数
    public ReviewStats() {
    }

    // 带参数的构造函数
    public ReviewStats(String beverageType, String beverageName, int totalReviews, double avgRating) {
        this.beverageType = beverageType;
        this.beverageName = beverageName;
        this.totalReviews = totalReviews;
        this.avgRating = avgRating;
        this.lastUpdated = new Date();
    }

    // Getters and Setters
    public String getBeverageType() {
        return beverageType;
    }

    public void setBeverageType(String beverageType) {
        this.beverageType = beverageType;
    }

    public String getBeverageName() {
        return beverageName;
    }

    public void setBeverageName(String beverageName) {
        this.beverageName = beverageName;
    }

    public int getTotalReviews() {
        return totalReviews;
    }

    public void setTotalReviews(int totalReviews) {
        this.totalReviews = totalReviews;
    }

    public double getAvgRating() {
        return avgRating;
    }

    public void setAvgRating(double avgRating) {
        this.avgRating = avgRating;
    }

    public Date getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(Date lastUpdated) {
        this.lastUpdated = lastUpdated;
    }

    // 格式化平均评分，保留一位小数
    public String getFormattedAvgRating() {
        return String.format("%.1f", avgRating);
    }

    // 获取星级显示
    public String getStarDisplay() {
        StringBuilder stars = new StringBuilder();
        int fullStars = (int) avgRating;
        boolean hasHalfStar = (avgRating - fullStars) >= 0.5;

        for (int i = 0; i < fullStars; i++) {
            stars.append("⭐");
        }
        if (hasHalfStar) {
            stars.append("⭐");
        }
        return stars.toString();
    }

    @Override
    public String toString() {
        return "ReviewStats{" +
                "beverageType='" + beverageType + '\'' +
                ", beverageName='" + beverageName + '\'' +
                ", totalReviews=" + totalReviews +
                ", avgRating=" + avgRating +
                ", lastUpdated=" + lastUpdated +
                '}';
    }
}