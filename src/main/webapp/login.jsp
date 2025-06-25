<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>登录</title>
    <link rel="icon" type="image/png" href="favicon.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg,
            #bae1ff 0%,
            #ffdfba 25%,
            #ffffba 50%,
            #fdb2b9 75%,
            #bae1ff 100%);
            background-attachment: fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
        }

        .login-container::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg,
            transparent,
            rgba(255, 255, 255, 0.1),
            transparent);
            animation: shimmer 3s infinite;
            pointer-events: none;
        }

        @keyframes shimmer {
            0% { transform: translateX(-100%) translateY(-100%) rotate(45deg); }
            100% { transform: translateX(100%) translateY(100%) rotate(45deg); }
        }

        .login-title {
            text-align: center;
            margin-bottom: 30px;
            color: #666;
            font-size: 28px;
            font-weight: 300;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
            font-size: 14px;
        }

        .form-input {
            width: 100%;
            padding: 15px 20px;
            border: none;
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            font-size: 16px;
            color: #333;
            transition: all 0.3s ease;
            outline: none;
        }

        .form-input::placeholder {
            color: rgba(102, 102, 102, 0.7);
        }

        .form-input:focus {
            background: rgba(255, 255, 255, 0.4);
            border-color: rgba(255, 182, 193, 0.6);
            box-shadow: 0 0 20px rgba(255, 182, 193, 0.3);
            transform: translateY(-2px);
        }

        .login-btn {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, #ffb3d1, #ffd1a3);
            color: #666;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(255, 179, 209, 0.4);
            position: relative;
            overflow: hidden;
        }

        .login-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg,
            transparent,
            rgba(255, 255, 255, 0.4),
            transparent);
            transition: left 0.5s;
        }

        .login-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(255, 179, 209, 0.6);
        }

        .login-btn:hover::before {
            left: 100%;
        }

        .login-btn:active {
            transform: translateY(-1px);
        }

        .error-message {
            margin-top: 20px;
            padding: 12px 15px;
            background: rgba(255, 107, 107, 0.15);
            border: 1px solid rgba(255, 107, 107, 0.3);
            border-radius: 8px;
            color: #d63031;
            font-size: 14px;
            text-align: center;
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
        }

        .floating-elements {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
        }

        .floating-circle {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            animation: float 6s ease-in-out infinite;
        }

        .floating-circle:nth-child(1) {
            width: 80px;
            height: 80px;
            top: 10%;
            left: 10%;
            animation-delay: 0s;
        }

        .floating-circle:nth-child(2) {
            width: 120px;
            height: 120px;
            top: 20%;
            right: 10%;
            animation-delay: 2s;
        }

        .floating-circle:nth-child(3) {
            width: 100px;
            height: 100px;
            bottom: 15%;
            left: 15%;
            animation-delay: 4s;
        }

        .floating-circle:nth-child(4) {
            width: 60px;
            height: 60px;
            bottom: 25%;
            right: 20%;
            animation-delay: 1s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
        }

        @media (max-width: 480px) {
            .login-container {
                padding: 30px 20px;
                margin: 10px;
            }

            .login-title {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
<div class="floating-elements">
    <div class="floating-circle"></div>
    <div class="floating-circle"></div>
    <div class="floating-circle"></div>
    <div class="floating-circle"></div>
</div>

<div class="login-container">
    <h1 class="login-title">🌈✨欢迎登录✨🌈</h1>

    <form action="login" method="post">
        <div class="form-group">
            <label for="username">用户名</label>
            <input type="text"
                   id="username"
                   name="username"
                   class="form-input"
                   placeholder="请输入用户名"
                   required />
        </div>

        <div class="form-group">
            <label for="password">密码</label>
            <input type="password"
                   id="password"
                   name="password"
                   class="form-input"
                   placeholder="请输入密码"
                   required />
        </div>

        <button type="submit" class="login-btn">登录</button>
    </form>

    <% if (request.getAttribute("msg") != null) { %>
    <div class="error-message">
        <%= request.getAttribute("msg") %>
    </div>
    <% } %>
</div>
</body>
</html>