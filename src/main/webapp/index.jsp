<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="org.example.vendingmachineweb.model.ShopClientBean" %>
        <jsp:useBean id="client" class="org.example.vendingmachineweb.model.ShopClientBean" scope="request" />
        <html>

        <head>
            <title>饮品售货机</title>
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

                /* 动态背景装饰 */
                body::before {
                    content: '';
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background:
                        radial-gradient(circle at 20% 20%, rgba(255, 255, 255, 0.1) 0%, transparent 50%),
                        radial-gradient(circle at 80% 80%, rgba(255, 255, 255, 0.1) 0%, transparent 50%),
                        radial-gradient(circle at 40% 40%, rgba(255, 255, 255, 0.05) 0%, transparent 50%);
                    animation: float 8s ease-in-out infinite;
                    z-index: 0;
                }

                @keyframes float {

                    0%,
                    100% {
                        transform: translateY(0px) rotate(0deg);
                    }

                    50% {
                        transform: translateY(-20px) rotate(180deg);
                    }
                }

                /* 飘动的装饰圆圈 */
                .floating-circles {
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    pointer-events: none;
                    z-index: 1;
                }

                .circle {
                    position: absolute;
                    border-radius: 50%;
                    background: rgba(255, 255, 255, 0.15);
                    animation: drift 15s infinite linear;
                }

                .circle:nth-child(1) {
                    width: 80px;
                    height: 80px;
                    top: 10%;
                    left: 10%;
                    animation-delay: 0s;
                }

                .circle:nth-child(2) {
                    width: 60px;
                    height: 60px;
                    top: 70%;
                    left: 80%;
                    animation-delay: -5s;
                }

                .circle:nth-child(3) {
                    width: 100px;
                    height: 100px;
                    top: 40%;
                    left: 70%;
                    animation-delay: -10s;
                }

                @keyframes drift {
                    0% {
                        transform: translateY(0px) translateX(0px);
                    }

                    25% {
                        transform: translateY(-50px) translateX(50px);
                    }

                    50% {
                        transform: translateY(0px) translateX(100px);
                    }

                    75% {
                        transform: translateY(50px) translateX(50px);
                    }

                    100% {
                        transform: translateY(0px) translateX(0px);
                    }
                }

                .container {
                    max-width: 500px;
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
                    padding: 40px;
                    box-shadow:
                        0 8px 32px rgba(0, 0, 0, 0.1),
                        inset 0 1px 0 rgba(255, 255, 255, 0.6);
                    transition: all 0.3s ease;
                }

                .glass-card:hover {
                    transform: translateY(-5px);
                    box-shadow:
                        0 12px 40px rgba(0, 0, 0, 0.15),
                        inset 0 1px 0 rgba(255, 255, 255, 0.6);
                }

                .title {
                    text-align: center;
                    margin-bottom: 30px;
                    color: #2d3436;
                    font-size: 2rem;
                    font-weight: 600;
                    text-shadow: 0 2px 4px rgba(255, 255, 255, 0.3);
                    letter-spacing: -0.5px;
                }

                .form-group {
                    margin-bottom: 25px;
                }

                .form-label {
                    display: block;
                    margin-bottom: 8px;
                    color: #2d3436;
                    font-size: 0.95rem;
                    font-weight: 500;
                    letter-spacing: 0.5px;
                    text-shadow: 0 1px 2px rgba(255, 255, 255, 0.5);
                }

                .form-input {
                    width: 100%;
                    padding: 16px 20px;
                    background: rgba(255, 255, 255, 0.35);
                    backdrop-filter: blur(10px);
                    border: 1px solid rgba(255, 255, 255, 0.5);
                    border-radius: 12px;
                    color: #2d3436;
                    font-family: 'Inter', sans-serif;
                    font-size: 1rem;
                    transition: all 0.3s ease;
                    outline: none;
                }

                .form-input::placeholder {
                    color: rgba(45, 52, 54, 0.6);
                }

                .form-input:focus {
                    background: rgba(255, 255, 255, 0.5);
                    border-color: #74b9ff;
                    transform: translateY(-2px);
                    box-shadow:
                        0 4px 20px rgba(116, 185, 255, 0.3),
                        inset 0 1px 0 rgba(255, 255, 255, 0.6);
                }

                .button-container {
                    display: flex;
                    gap: 15px;
                    margin-top: 30px;
                }

                .glass-button {
                    flex: 1;
                    padding: 16px 24px;
                    background: rgba(255, 255, 255, 0.35);
                    backdrop-filter: blur(10px);
                    border: 1px solid rgba(255, 255, 255, 0.5);
                    border-radius: 12px;
                    color: #2d3436;
                    font-family: 'Inter', sans-serif;
                    font-size: 1rem;
                    font-weight: 500;
                    cursor: pointer;
                    transition: all 0.3s ease;
                    outline: none;
                    letter-spacing: 0.5px;
                    text-shadow: 0 1px 2px rgba(255, 255, 255, 0.5);
                }

                .glass-button:hover {
                    background: rgba(255, 255, 255, 0.5);
                    transform: translateY(-2px);
                    box-shadow:
                        0 6px 20px rgba(116, 185, 255, 0.3),
                        inset 0 1px 0 rgba(255, 255, 255, 0.6);
                }

                .glass-button:active {
                    transform: translateY(0px);
                }

                .glass-button.reset {
                    background: rgba(255, 255, 255, 0.25);
                }

                .glass-button.reset:hover {
                    background: rgba(255, 255, 255, 0.4);
                }

                .result-section {
                    margin-top: 30px;
                    padding: 25px;
                    background: rgba(255, 255, 255, 0.25);
                    backdrop-filter: blur(15px);
                    border: 1px solid rgba(255, 255, 255, 0.4);
                    border-radius: 15px;
                    box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.5);
                }

                .result-item {
                    margin-bottom: 20px;
                    padding: 15px;
                    background: rgba(255, 255, 255, 0.2);
                    border-radius: 10px;
                    border-left: 4px solid #ffb2fe;
                    transition: all 0.3s ease;
                }

                .result-item:hover {
                    background: rgba(255, 255, 255, 0.3);
                    transform: translateX(5px);
                }

                .result-item:last-child {
                    margin-bottom: 0;
                }

                .result-label {
                    color: #2d3436;
                    font-size: 0.9rem;
                    font-weight: 500;
                    margin-bottom: 5px;
                    letter-spacing: 0.5px;
                    text-shadow: 0 1px 2px rgba(255, 255, 255, 0.5);
                }

                .result-value {
                    color: #2d3436;
                    font-size: 1.1rem;
                    font-weight: 500;
                    text-shadow: 0 1px 2px rgba(255, 255, 255, 0.3);
                }

                /* 响应式设计 */
                @media (max-width: 768px) {
                    body {
                        padding: 10px;
                    }

                    .glass-card {
                        padding: 30px 25px;
                    }

                    .title {
                        font-size: 1.5rem;
                    }

                    .button-container {
                        flex-direction: column;
                    }
                }

                /* 添加一些细微的动画 */
                @keyframes gentle-pulse {

                    0%,
                    100% {
                        opacity: 1;
                    }

                    50% {
                        opacity: 0.8;
                    }
                }

                .result-value {
                    animation: gentle-pulse 3s ease-in-out infinite;
                }
            </style>
            <script>
                const langData = {
                    zh: {
                        title: '🌈 欢迎来到饮品售货机 🌈',
                        productLabel: '🧋 您需要点的饮料是：',
                        productPlaceholder: '请选择饮品',
                        productCoca: '🥤可乐（￥1.0）',
                        productCoffee: '☕咖啡（￥2.0）',
                        productJuice: '🍹果汁（￥2.5）',
                        productMilkTea: '🧋奶茶（￥3.0）',
                        decoratorLabel: '✨ 您需要给饮料加的配料是：',
                        decoratorPlaceholder: '请选择配料',
                        decoratorIce: '🧊冰块（￥0.5）',
                        decoratorMilk: '🥛牛奶（￥0.5）',
                        decoratorPearl: '🟤珍珠（￥1.0）',
                        decoratorCoconut: '🥥椰果（￥1.0）',
                        decoratorPudding: '🍮布丁（￥1.0）',
                        decoratorSugar: '🍯糖（￥0.2）',
                        numLabel: '🔢 配料可以加多份(不填默认为 1 份)：',
                        numPlaceholder: '💫 请输入份数...',
                        submit: '🚀 提交订单',
                        reset: '🔄 重新选择',
                        resultDesc: '📋 您所点的饮料和配料是：',
                        resultPrice: '💰 您所点的所有饮料价格是：',
                        noOrder: '您还没有点饮料。',
                        langBtn: '中文'
                    },
                    en: {
                        title: '🌈 Welcome to the Vending Machine 🌈',
                        productLabel: '🧋 Choose your drink:',
                        productPlaceholder: 'Please select a drink',
                        productCoca: '🥤Coca (￥1.0)',
                        productCoffee: '☕Coffee (￥2.0)',
                        productJuice: '🍹Juice (￥2.5)',
                        productMilkTea: '🧋Milk Tea (￥3.0)',
                        decoratorLabel: '✨ Add-ons for your drink:',
                        decoratorPlaceholder: 'Please select add-on',
                        decoratorIce: '🧊Ice (￥0.5)',
                        decoratorMilk: '🥛Milk (￥0.5)',
                        decoratorPearl: '🟤Pearl (￥1.0)',
                        decoratorCoconut: '🥥Coconut (￥1.0)',
                        decoratorPudding: '🍮Pudding (￥1.0)',
                        decoratorSugar: '🍯Sugar (￥0.2)',
                        numLabel: '🔢 Add-on quantity (default 1):',
                        numPlaceholder: '💫 Enter quantity...',
                        submit: '🚀 Submit Order',
                        reset: '🔄 Reset',
                        resultDesc: '📋 Your drink and add-on:',
                        resultPrice: '💰 Total price:',
                        noOrder: 'You have not ordered any drink yet.',
                        langBtn: 'English'
                    }
                };
                let currentLang = localStorage.getItem('lang') || 'zh';

                // 饮品与配料的联动配置
                const drinkDecoratorMap = {
                    'coca': ['ice', 'sugar'],
                    'coffee': ['ice', 'milk', 'sugar'],
                    'juice': ['ice', 'sugar'],
                    'milktea': ['ice', 'pearl', 'coconut', 'pudding', 'sugar']
                };

                function setLang(lang) {
                    currentLang = lang;
                    const t = langData[currentLang];
                    document.getElementById('title').innerText = t.title;
                    document.getElementById('product-label').innerText = t.productLabel;
                    document.getElementById('product-placeholder').innerText = t.productPlaceholder;
                    document.getElementById('product-coca').innerText = t.productCoca;
                    document.getElementById('product-coffee').innerText = t.productCoffee;
                    document.getElementById('product-juice').innerText = t.productJuice;
                    document.getElementById('product-milktea').innerText = t.productMilkTea;
                    document.getElementById('decorator-label').innerText = t.decoratorLabel;
                    document.getElementById('decorator-placeholder').innerText = t.decoratorPlaceholder;
                    document.getElementById('decorator-ice').innerText = t.decoratorIce;
                    document.getElementById('decorator-milk').innerText = t.decoratorMilk;
                    document.getElementById('decorator-pearl').innerText = t.decoratorPearl;
                    document.getElementById('decorator-coconut').innerText = t.decoratorCoconut;
                    document.getElementById('decorator-pudding').innerText = t.decoratorPudding;
                    document.getElementById('decorator-sugar').innerText = t.decoratorSugar;
                    document.getElementById('num-label').innerText = t.numLabel;
                    document.getElementById('num').placeholder = t.numPlaceholder;
                    document.getElementById('submit-btn').value = t.submit;
                    document.getElementById('reset-btn').value = t.reset;
                    document.getElementById('result-desc').innerText = t.resultDesc;
                    document.getElementById('result-price').innerText = t.resultPrice;
                    document.getElementById('lang-btn').innerText = t.langBtn;
                    // 更新无订单提示
                    const noOrderEl = document.getElementById('no-order');
                    if (noOrderEl && noOrderEl.style.display !== 'none') noOrderEl.innerText = t.noOrder;
                }

                function switchLang() {
                    currentLang = currentLang === 'zh' ? 'en' : 'zh';
                    localStorage.setItem('lang', currentLang);
                    setLang(currentLang);
                }

                function isDigit(s) {
                    var patrn = /^[0-9]{1,20}$/;
                    if (!patrn.test(s)) {
                        alert(currentLang === 'zh' ? "这里必须输入数字！" : "Please enter a number!");
                    }
                }

                function clearForm() {
                    document.querySelector('select[name="product"]').selectedIndex = 0;
                    document.querySelector('select[name="decorator"]').selectedIndex = 0;
                    document.querySelector('input[name="num"]').value = '1';
                    const resultValues = document.querySelectorAll('.result-value');
                    resultValues.forEach(el => el.innerHTML = '');
                    // 清空时显示无订单提示
                    const noOrderEl = document.getElementById('no-order');
                    if (noOrderEl) {
                        noOrderEl.style.display = '';
                        noOrderEl.innerText = langData[currentLang].noOrder;
                    }
                    // 重置配料选项
                    updateDecoratorOptions('');
                }

                function updateDecoratorOptions(selectedDrink) {
                    const decoratorSelect = document.querySelector('select[name="decorator"]');
                    const currentValue = decoratorSelect.value;

                    // 清空现有选项，保留占位符
                    decoratorSelect.innerHTML = '<option id="decorator-placeholder" value="">' + langData[currentLang].decoratorPlaceholder + '</option>';

                    if (selectedDrink && drinkDecoratorMap[selectedDrink]) {
                        const allowedDecorators = drinkDecoratorMap[selectedDrink];

                        // 添加允许的配料选项
                        if (allowedDecorators.includes('ice')) {
                            const option = document.createElement('option');
                            option.id = 'decorator-ice';
                            option.value = 'ice';
                            option.innerText = langData[currentLang].decoratorIce;
                            decoratorSelect.appendChild(option);
                        }

                        if (allowedDecorators.includes('milk')) {
                            const option = document.createElement('option');
                            option.id = 'decorator-milk';
                            option.value = 'milk';
                            option.innerText = langData[currentLang].decoratorMilk;
                            decoratorSelect.appendChild(option);
                        }

                        if (allowedDecorators.includes('pearl')) {
                            const option = document.createElement('option');
                            option.id = 'decorator-pearl';
                            option.value = 'pearl';
                            option.innerText = langData[currentLang].decoratorPearl;
                            decoratorSelect.appendChild(option);
                        }

                        if (allowedDecorators.includes('coconut')) {
                            const option = document.createElement('option');
                            option.id = 'decorator-coconut';
                            option.value = 'coconut';
                            option.innerText = langData[currentLang].decoratorCoconut;
                            decoratorSelect.appendChild(option);
                        }

                        if (allowedDecorators.includes('pudding')) {
                            const option = document.createElement('option');
                            option.id = 'decorator-pudding';
                            option.value = 'pudding';
                            option.innerText = langData[currentLang].decoratorPudding;
                            decoratorSelect.appendChild(option);
                        }

                        if (allowedDecorators.includes('sugar')) {
                            const option = document.createElement('option');
                            option.id = 'decorator-sugar';
                            option.value = 'sugar';
                            option.innerText = langData[currentLang].decoratorSugar;
                            decoratorSelect.appendChild(option);
                        }
                    }
                }

                window.onload = function () {
                    setLang(currentLang);

                    // 添加饮品选择变化监听
                    const productSelect = document.querySelector('select[name="product"]');
                    productSelect.addEventListener('change', function () {
                        updateDecoratorOptions(this.value);
                    });

                    // 初始化配料选项
                    updateDecoratorOptions('');
                };

                function validateForm() {
                    var product = document.querySelector('select[name="product"]').value;
                    if (!product) {
                        alert(currentLang === 'zh' ? '请先选择饮料' : 'Please select a drink');
                        return false;
                    }
                    return true;
                }
            </script>
        </head>

        <body>
            <div class="floating-circles">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
            </div>

            <div style="display: flex; justify-content: center; margin-bottom: 30px;">
                <button id="lang-btn" type="button" class="glass-card"
                    style="padding: 10px 30px; font-size: 1rem; font-weight: 500; border: none; cursor: pointer; min-width: 120px; text-align: center; box-shadow: 0 4px 20px rgba(116,185,255,0.1);"
                    onclick="switchLang()">中文</button>
            </div>

            <div class="container">
                <div class="glass-card">
                    <h1 class="title" id="title">🌈 欢迎来到饮品售货机 🌈</h1>

                    <form action="shopService" method="post" onsubmit="return validateForm();">
                        <div class="form-group">
                            <label class="form-label" id="product-label">🧋 您需要点的饮料是：</label>
                            <select name="product" class="form-input">
                                <option id="product-placeholder" value="">请选择饮品</option>
                                <option id="product-coca" value="coca" <%="coca"
                                    .equals(request.getParameter("product")) ? "selected" : "" %>>🥤可乐（￥1.0）</option>
                                <option id="product-coffee" value="coffee" <%="coffee"
                                    .equals(request.getParameter("product")) ? "selected" : "" %>>☕咖啡（￥2.0）</option>
                                <option id="product-juice" value="juice" <%="juice"
                                    .equals(request.getParameter("product")) ? "selected" : "" %>>🍹果汁（￥2.5）</option>
                                <option id="product-milktea" value="milktea" <%="milktea"
                                    .equals(request.getParameter("product")) ? "selected" : "" %>>🧋奶茶（￥3.0）</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="form-label" id="decorator-label">✨ 您需要给饮料加的配料是：</label>
                            <select name="decorator" class="form-input">
                                <option id="decorator-placeholder" value="">请选择配料</option>
                                <option id="decorator-ice" value="ice" <%="ice"
                                    .equals(request.getParameter("decorator")) ? "selected" : "" %>>🧊冰块（￥0.5）</option>
                                <option id="decorator-milk" value="milk" <%="milk"
                                    .equals(request.getParameter("decorator")) ? "selected" : "" %>>🥛牛奶（￥0.5）</option>
                                <option id="decorator-pearl" value="pearl" <%="pearl"
                                    .equals(request.getParameter("decorator")) ? "selected" : "" %>>🟤珍珠（￥1.0）</option>
                                <option id="decorator-coconut" value="coconut" <%="coconut"
                                    .equals(request.getParameter("decorator")) ? "selected" : "" %>>🥥椰果（￥1.0）</option>
                                <option id="decorator-pudding" value="pudding" <%="pudding"
                                    .equals(request.getParameter("decorator")) ? "selected" : "" %>>🍮布丁（￥1.0）</option>
                                <option id="decorator-sugar" value="sugar" <%="sugar"
                                    .equals(request.getParameter("decorator")) ? "selected" : "" %>>🍯糖（￥0.2）</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="form-label" id="num-label">🔢 配料可以加多份(不填默认为 1 份)：</label>
                            <input type="text" name="num" id="num" class="form-input" value="1"
                                onblur="isDigit(this.value)" placeholder="💫 请输入份数..." />
                        </div>

                        <div class="button-container">
                            <input type="submit" id="submit-btn" value="🚀 提交订单" class="glass-button" />
                            <input type="button" id="reset-btn" value="🔄 重新选择" class="glass-button reset"
                                onclick="clearForm()" />
                        </div>

                        <div class="result-section">
                            <div class="result-item">
                                <div class="result-label" id="result-desc">📋 您所点的饮料和配料是：</div>
                                <div class="result-value">
                                    <%-- 判断是否有订单 --%>
                                        <jsp:getProperty name="client" property="description" />
                                        <span id="no-order" style="display:none;"></span>
                                </div>
                            </div>

                            <div class="result-item">
                                <div class="result-label" id="result-price">💰 您所点的所有饮料价格是：</div>
                                <div class="result-value">
                                    <jsp:getProperty name="client" property="price" />
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- 支付按钮，初始隐藏，主form外部 -->
            <div style="display:none; margin-top: 20px; text-align: center;" id="pay-btn-container">
                <button id="pay-btn" class="glass-button"
                    style="width: 200px; font-size: 1.2rem; margin-right: 10px;">💳 支付</button>
                <button id="review-btn" class="glass-button"
                    style="width: 200px; font-size: 1.2rem; background: rgba(255, 255, 255, 0.25);">💬 评价</button>
            </div>
            <script>
                // 判断是否有订单，如果没有则显示提示
                window.addEventListener('DOMContentLoaded', function () {
                    var descText = document.querySelector('.result-value').innerText.trim();
                    var noOrderEl = document.getElementById('no-order');
                    var payBtnContainer = document.getElementById('pay-btn-container');
                    // 订单信息
                    var desc = document.querySelectorAll('.result-value')[0].innerText.trim();
                    var price = document.querySelectorAll('.result-value')[1].innerText.trim();
                    if (noOrderEl && (!descText || descText === '' || descText === 'null')) {
                        noOrderEl.style.display = '';
                        noOrderEl.innerText = langData[currentLang].noOrder;
                        if (payBtnContainer) payBtnContainer.style.display = 'none';
                    } else if (noOrderEl) {
                        noOrderEl.style.display = 'none';
                        // 有订单才显示支付按钮
                        if (payBtnContainer) payBtnContainer.style.display = '';
                    }
                });

                // 支付按钮点击事件，POST跳转到pay.jsp
                document.addEventListener('DOMContentLoaded', function () {
                    var payBtn = document.getElementById('pay-btn');
                    if (payBtn) {
                        payBtn.onclick = function (e) {
                            e.preventDefault();
                            var desc = document.querySelectorAll('.result-value')[0].innerText.trim();
                            var price = document.querySelectorAll('.result-value')[1].innerText.trim();
                            // 创建form并POST
                            var form = document.createElement('form');
                            form.method = 'POST';
                            form.action = 'pay.jsp';
                            var inputDesc = document.createElement('input');
                            inputDesc.type = 'hidden';
                            inputDesc.name = 'description';
                            inputDesc.value = desc;
                            var inputPrice = document.createElement('input');
                            inputPrice.type = 'hidden';
                            inputPrice.name = 'price';
                            inputPrice.value = price;
                            form.appendChild(inputDesc);
                            form.appendChild(inputPrice);
                            document.body.appendChild(form);
                            form.submit();
                        }
                    }

                    // 评价按钮点击事件
                    var reviewBtn = document.getElementById('review-btn');
                    if (reviewBtn) {
                        reviewBtn.onclick = function (e) {
                            e.preventDefault();
                            goToReview();
                        }
                    }
                });

                // 跳转到评价页面
                function goToReview() {
                    var desc = document.querySelectorAll('.result-value')[0].innerText.trim();
                    var price = document.querySelectorAll('.result-value')[1].innerText.trim();

                    if (desc && desc !== 'null') {
                        // 解析饮品信息
                        var beverageInfo = parseBeverageInfo(desc);

                        // 跳转到评价页面
                        var url = 'review?beverageType=' + beverageInfo.type +
                            '&beverageName=' + encodeURIComponent(beverageInfo.name) +
                            '&decorators=' + encodeURIComponent(beverageInfo.decorators);
                        window.location.href = url;
                    } else {
                        alert(currentLang === 'zh' ? '请先选择饮品' : 'Please select a drink first');
                    }
                }

                // 解析饮品描述，提取饮品类型、名称和配料
                function parseBeverageInfo(desc) {
                    var beverageInfo = {
                        type: '',
                        name: '',
                        decorators: ''
                    };

                    // 提取饮品名称
                    if (desc.includes('可乐')) {
                        beverageInfo.type = 'coca';
                        beverageInfo.name = '可乐';
                    } else if (desc.includes('咖啡')) {
                        beverageInfo.type = 'coffee';
                        beverageInfo.name = '咖啡';
                    } else if (desc.includes('果汁')) {
                        beverageInfo.type = 'juice';
                        beverageInfo.name = '果汁';
                    } else if (desc.includes('奶茶')) {
                        beverageInfo.type = 'milktea';
                        beverageInfo.name = '奶茶';
                    }

                    // 提取配料信息
                    var decoratorList = [];
                    if (desc.includes('冰块')) {
                        decoratorList.push('冰块');
                    }
                    if (desc.includes('牛奶')) {
                        decoratorList.push('牛奶');
                    }
                    if (desc.includes('珍珠')) {
                        decoratorList.push('珍珠');
                    }
                    if (desc.includes('椰果')) {
                        decoratorList.push('椰果');
                    }
                    if (desc.includes('布丁')) {
                        decoratorList.push('布丁');
                    }
                    if (desc.includes('糖')) {
                        decoratorList.push('糖');
                    }

                    beverageInfo.decorators = decoratorList.join('、');

                    return beverageInfo;
                }
            </script>
        </body>

        </html>