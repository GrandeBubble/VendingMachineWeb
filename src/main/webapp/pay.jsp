<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <html>

    <head>
        <title>支付订单</title>
        <link rel="icon" type="image/png" href="favicon.png" />
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                font-family: 'Inter', sans-serif;
                background: linear-gradient(135deg, #a8edea 0%, #fed6e3 25%, #ffeaa7 50%, #ffd4f6 75%, #ccf6ff 100%);
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .pay-card {
                background: rgba(255, 255, 255, 0.4);
                backdrop-filter: blur(20px);
                border-radius: 20px;
                padding: 40px 30px;
                box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                width: 100%;
                text-align: center;
            }

            .pay-title {
                font-size: 1.7rem;
                font-weight: 600;
                margin-bottom: 25px;
                color: #2d3436;
            }

            .pay-info {
                margin-bottom: 20px;
                font-size: 1.1rem;
                color: #2d3436;
            }

            .pay-amount {
                font-size: 1.3rem;
                font-weight: bold;
                color: #0984e3;
                margin-bottom: 30px;
            }

            .pay-qrcode {
                width: 200px;
                height: 200px;
                margin: 0 auto 20px auto;
                border-radius: 12px;
                background: #fff;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .pay-back {
                margin-top: 20px;
                display: inline-block;
                padding: 10px 30px;
                background: rgba(255, 255, 255, 0.35);
                border: 1px solid rgba(255, 255, 255, 0.5);
                border-radius: 12px;
                color: #2d3436;
                font-size: 1rem;
                font-weight: 500;
                cursor: pointer;
                text-decoration: none;
                transition: all 0.3s;
            }

            .pay-back:hover {
                background: rgba(255, 255, 255, 0.5);
            }
        </style>
    </head>

    <body>
        <div class="pay-card">
            <div class="pay-title">💳请支付订单</div>
            <div class="pay-info">
                <strong>📋订单信息：</strong><br />
                <%= request.getParameter("description") !=null ? request.getParameter("description") : "-" %>
            </div>
            <div class="pay-amount">
                <strong>💰应付金额：</strong>
                ￥<%= request.getParameter("price") !=null ? request.getParameter("price") : "0.00" %>
            </div>
            <div class="pay-qrcode">
                <img src="wechat_pay.png" alt="收款二维码" style="width:180px;height:180px;" />
            </div>
            <a href="index.jsp" class="pay-back">返回首页</a>
        </div>
    </body>

    </html>