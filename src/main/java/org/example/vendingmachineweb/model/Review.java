package org.example.vendingmachineweb.model;

import java.util.Date;

public class Review {
    private int id;
    private int userId;
    private String beverageType;
    private String beverageName;
    private String decorators;
    private int rating;
    private String comment;
    private Date createdAt;
    private String username; // 用于显示用户名

    // 默认构造函数
    public Review() {
    }

    // 带参数的构造函数
    public Review(int userId, String beverageType, String beverageName, String decorators, int rating, String comment) {
        this.userId = userId;
        this.beverageType = beverageType;
        this.beverageName = beverageName;
        this.decorators = decorators;
        this.rating = rating;
        this.comment = comment;
        this.createdAt = new Date();
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

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

    public String getDecorators() {
        return decorators;
    }

    public void setDecorators(String decorators) {
        this.decorators = decorators;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "Review{" +
                "id=" + id +
                ", userId=" + userId +
                ", beverageType='" + beverageType + '\'' +
                ", beverageName='" + beverageName + '\'' +
                ", decorators='" + decorators + '\'' +
                ", rating=" + rating +
                ", comment='" + comment + '\'' +
                ", createdAt=" + createdAt +
                ", username='" + username + '\'' +
                '}';
    }
}