<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html>

            <head>
                <title>饮品评价</title>
                <link rel="icon" type="image/png" href="favicon.png" />
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <style>
                    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap');

                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                    }

                    body {
                        font-family: 'Inter', sans-serif;
                        background: linear-gradient(135deg,
                                #a8edea 0%,
                                #fed6e3 25%,
                                #ffeaa7 50%,
                                #ffd4f6 75%,
                                #ccf6ff 100%);
                        min-height: 100vh;
                        padding: 20px;
                        position: relative;
                        overflow-x: hidden;
                    }

                    .container {
                        max-width: 800px;
                        margin: 0 auto;
                        position: relative;
                        z-index: 2;
                    }

                    .glass-card {
                        background: rgba(255, 255, 255, 0.4);
                        backdrop-filter: blur(20px);
                        -webkit-backdrop-filter: blur(20px);
                        border: 1px solid rgba(255, 255, 255, 0.5);
                        border-radius: 20px;
                        padding: 30px;
                        margin-bottom: 20px;
                        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
                    }

                    .title {
                        text-align: center;
                        margin-bottom: 30px;
                        color: #2d3436;
                        font-size: 2rem;
                        font-weight: 600;
                    }

                    .stats-section {
                        text-align: center;
                        margin-bottom: 30px;
                    }

                    .stats-section h2 {
                        color: #2d3436;
                        margin-bottom: 15px;
                    }

                    .stats-info {
                        display: flex;
                        justify-content: center;
                        gap: 30px;
                        margin-bottom: 20px;
                    }

                    .stat-item {
                        background: rgba(255, 255, 255, 0.3);
                        padding: 15px 25px;
                        border-radius: 15px;
                        border: 1px solid rgba(255, 255, 255, 0.5);
                    }

                    .stat-item h3 {
                        color: #2d3436;
                        font-size: 1.2rem;
                        margin-bottom: 5px;
                    }

                    .stat-item p {
                        color: #636e72;
                        font-size: 0.9rem;
                    }

                    .review-form {
                        margin-bottom: 30px;
                    }

                    .form-group {
                        margin-bottom: 20px;
                    }

                    .form-label {
                        display: block;
                        margin-bottom: 8px;
                        color: #2d3436;
                        font-weight: 500;
                    }

                    .rating-stars {
                        font-size: 24px;
                        cursor: pointer;
                        margin-bottom: 10px;
                    }

                    .star {
                        color: #ddd;
                        transition: color 0.3s ease;
                    }

                    .star.active {
                        color: #ffd700;
                    }

                    .star:hover {
                        color: #ffd700;
                    }

                    .form-input,
                    .form-textarea {
                        width: 100%;
                        padding: 12px 15px;
                        background: rgba(255, 255, 255, 0.35);
                        backdrop-filter: blur(10px);
                        border: 1px solid rgba(255, 255, 255, 0.5);
                        border-radius: 10px;
                        color: #2d3436;
                        font-family: 'Inter', sans-serif;
                        font-size: 1rem;
                        transition: all 0.3s ease;
                        outline: none;
                    }

                    .form-textarea {
                        resize: vertical;
                        min-height: 100px;
                    }

                    .form-input:focus,
                    .form-textarea:focus {
                        background: rgba(255, 255, 255, 0.5);
                        border-color: #74b9ff;
                        transform: translateY(-2px);
                    }

                    .submit-btn {
                        background: linear-gradient(135deg, #74b9ff, #0984e3);
                        color: white;
                        border: none;
                        padding: 12px 30px;
                        border-radius: 10px;
                        font-size: 1rem;
                        font-weight: 500;
                        cursor: pointer;
                        transition: all 0.3s ease;
                    }

                    .submit-btn:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 5px 15px rgba(116, 185, 255, 0.4);
                    }

                    .review-list {
                        max-height: 500px;
                        overflow-y: auto;
                    }

                    .review-item {
                        background: rgba(255, 255, 255, 0.3);
                        padding: 20px;
                        margin-bottom: 15px;
                        border-radius: 15px;
                        border: 1px solid rgba(255, 255, 255, 0.5);
                        transition: all 0.3s ease;
                    }

                    .review-item:hover {
                        background: rgba(255, 255, 255, 0.4);
                        transform: translateY(-2px);
                    }

                    .review-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 10px;
                    }

                    .review-rating {
                        font-size: 18px;
                    }

                    .review-date {
                        color: #636e72;
                        font-size: 0.9rem;
                    }

                    .review-content {
                        color: #2d3436;
                        line-height: 1.6;
                        margin-bottom: 10px;
                    }

                    .review-details {
                        color: #636e72;
                        font-size: 0.9rem;
                    }

                    .review-details span {
                        margin-right: 15px;
                    }

                    .back-btn {
                        background: rgba(255, 255, 255, 0.3);
                        color: #2d3436;
                        border: 1px solid rgba(255, 255, 255, 0.5);
                        padding: 10px 20px;
                        border-radius: 10px;
                        text-decoration: none;
                        display: inline-block;
                        margin-bottom: 20px;
                        transition: all 0.3s ease;
                    }

                    .back-btn:hover {
                        background: rgba(255, 255, 255, 0.5);
                        transform: translateY(-2px);
                    }

                    .success-message {
                        background: rgba(76, 175, 80, 0.2);
                        border: 1px solid rgba(76, 175, 80, 0.5);
                        color: #2e7d32;
                        padding: 15px;
                        border-radius: 10px;
                        margin-bottom: 20px;
                        text-align: center;
                    }

                    .error-message {
                        background: rgba(244, 67, 54, 0.2);
                        border: 1px solid rgba(244, 67, 54, 0.5);
                        color: #c62828;
                        padding: 15px;
                        border-radius: 10px;
                        margin-bottom: 20px;
                        text-align: center;
                    }

                    .all-stats {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                        gap: 15px;
                        margin-bottom: 30px;
                    }

                    .beverage-stat {
                        background: rgba(255, 255, 255, 0.3);
                        padding: 20px;
                        border-radius: 15px;
                        text-align: center;
                        border: 1px solid rgba(255, 255, 255, 0.5);
                    }

                    .beverage-stat h3 {
                        color: #2d3436;
                        margin-bottom: 10px;
                    }

                    .beverage-stat .rating {
                        font-size: 20px;
                        margin-bottom: 5px;
                    }

                    .beverage-stat .count {
                        color: #636e72;
                        font-size: 0.9rem;
                    }

                    @media (max-width: 768px) {
                        .container {
                            padding: 10px;
                        }

                        .glass-card {
                            padding: 20px;
                        }

                        .stats-info {
                            flex-direction: column;
                            gap: 15px;
                        }

                        .review-header {
                            flex-direction: column;
                            align-items: flex-start;
                            gap: 10px;
                        }
                    }
                </style>
            </head>

            <body>
                <div class="container">
                    <a href="index.jsp" class="back-btn">← 返回首页</a>

                    <div class="glass-card">
                        <h1 class="title">💬 饮品评价系统</h1>

                        <!-- 成功/错误消息 -->
                        <c:if test="${param.success == 'true'}">
                            <div class="success-message">
                                ✅ 评价提交成功！感谢您的反馈。
                            </div>
                        </c:if>

                        <c:if test="${not empty error}">
                            <div class="error-message">
                                ❌ ${error}
                            </div>
                        </c:if>

                        <!-- 如果没有指定饮品，显示所有饮品统计 -->
                        <c:if test="${empty beverageType}">
                            <div class="stats-section">
                                <h2>📊 饮品评价统计</h2>
                                <div class="all-stats">
                                    <c:forEach var="stat" items="${allStats}">
                                        <div class="beverage-stat">
                                            <h3>${stat.beverageName}</h3>
                                            <div class="rating">${stat.starDisplay}</div>
                                            <div class="count">${stat.totalReviews} 条评价</div>
                                            <div class="count">平均评分：${stat.formattedAvgRating}</div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>

                            <div class="review-list">
                                <h3>📝 最新评价</h3>
                                <c:forEach var="review" items="${recentReviews}">
                                    <div class="review-item">
                                        <div class="review-header">
                                            <div class="review-rating">
                                                <c:forEach begin="1" end="5" var="i">
                                                    <c:choose>
                                                        <c:when test="${i <= review.rating}">
                                                            <span class="star"
                                                                style="color:#ffd700; font-size:20px;">★</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="star"
                                                                style="color:#ddd; font-size:20px;">☆</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                            <div class="review-date">
                                                <fmt:formatDate value="${review.createdAt}"
                                                    pattern="yyyy-MM-dd HH:mm" />
                                            </div>
                                        </div>
                                        <div class="review-content">${review.comment}</div>
                                        <div class="review-details">
                                            <span>饮品：${review.beverageName}</span>
                                            <c:if test="${not empty review.decorators}">
                                                <span>配料：${review.decorators}</span>
                                            </c:if>
                                            <span>用户：${review.username}</span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:if>

                        <!-- 如果指定了饮品，显示该饮品的评价 -->
                        <c:if test="${not empty beverageType}">
                            <!-- 评价统计 -->
                            <div class="stats-section">
                                <h2>${stats.beverageName} 评价统计</h2>
                                <div class="stats-info">
                                    <div class="stat-item">
                                        <h3>${stats.totalReviews}</h3>
                                        <p>总评价数</p>
                                    </div>
                                    <div class="stat-item">
                                        <h3>${stats.starDisplay}</h3>
                                        <p>平均评分：${stats.formattedAvgRating}</p>
                                    </div>
                                </div>
                            </div>

                            <!-- 评价表单 -->
                            <div class="review-form">
                                <h3>📝 发表评价</h3>
                                <form action="review" method="post">
                                    <input type="hidden" name="beverageType" value="${beverageType}">
                                    <input type="hidden" name="beverageName" value="${beverageName}">
                                    <input type="hidden" name="decorators" value="${decorators}">

                                    <div class="form-group">
                                        <label class="form-label">评分：</label>
                                        <div class="rating-stars" id="rating-stars">
                                            <span class="star" data-rating="1">★</span>
                                            <span class="star" data-rating="2">★</span>
                                            <span class="star" data-rating="3">★</span>
                                            <span class="star" data-rating="4">★</span>
                                            <span class="star" data-rating="5">★</span>
                                        </div>
                                        <input type="hidden" name="rating" id="rating-input" value="5">
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">评价内容：</label>
                                        <textarea name="comment" class="form-textarea" placeholder="请分享您的饮用体验..."
                                            required></textarea>
                                    </div>

                                    <button type="submit" class="submit-btn">提交评价</button>
                                </form>
                            </div>

                            <!-- 评价列表 -->
                            <div class="review-list">
                                <h3>💬 用户评价</h3>
                                <c:if test="${empty reviews}">
                                    <p style="text-align: center; color: #636e72; padding: 20px;">
                                        还没有评价，快来发表第一条评价吧！
                                    </p>
                                </c:if>
                                <c:forEach var="review" items="${reviews}">
                                    <div class="review-item">
                                        <div class="review-header">
                                            <div class="review-rating">
                                                <c:forEach begin="1" end="5" var="i">
                                                    <c:choose>
                                                        <c:when test="${i <= review.rating}">
                                                            <span class="star"
                                                                style="color:#ffd700; font-size:20px;">★</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="star"
                                                                style="color:#ddd; font-size:20px;">☆</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                            <div class="review-date">
                                                <fmt:formatDate value="${review.createdAt}"
                                                    pattern="yyyy-MM-dd HH:mm" />
                                            </div>
                                        </div>
                                        <div class="review-content">${review.comment}</div>
                                        <div class="review-details">
                                            <span>饮品：${review.beverageName}</span>
                                            <c:if test="${not empty review.decorators}">
                                                <span>配料：${review.decorators}</span>
                                            </c:if>
                                            <span>用户：${review.username}</span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>
                </div>

                <script>
                    // 星级评分交互
                    document.addEventListener('DOMContentLoaded', function () {
                        const ratingStars = document.getElementById('rating-stars');
                        if (ratingStars) {
                            const stars = ratingStars.querySelectorAll('.star');
                            const ratingInput = document.getElementById('rating-input');

                            // 高亮和符号切换
                            function highlightStars(rating) {
                                stars.forEach((s, idx) => {
                                    if (idx < rating) {
                                        s.classList.add('active');
                                        s.textContent = '★';
                                    } else {
                                        s.classList.remove('active');
                                        s.textContent = '☆';
                                    }
                                });
                            }
                            // 页面初始高亮
                            highlightStars(ratingInput.value);

                            stars.forEach(star => {
                                star.addEventListener('click', function () {
                                    const rating = this.dataset.rating;
                                    ratingInput.value = rating;
                                    highlightStars(rating);
                                });

                                // 鼠标悬停效果
                                star.addEventListener('mouseenter', function () {
                                    highlightStars(this.dataset.rating);
                                });
                            });

                            // 鼠标离开时恢复当前选择
                            ratingStars.addEventListener('mouseleave', function () {
                                highlightStars(ratingInput.value);
                            });
                        }
                    });
                </script>
            </body>

            </html>