package org.example.vendingmachineweb.controller;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.vendingmachineweb.factory.BeverageFactory;
import org.example.vendingmachineweb.factory.DecoratorFactory;
import org.example.vendingmachineweb.model.Beverage;
import org.example.vendingmachineweb.model.ShopClientBean;

public class ShopService extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Servlet 要继承 HttpServlet 类，然后才能实现对用户的服务功能。
        // 下面是参数定义
        String product;
        String decorator;
        String num;
        String description = "";
        double price;
        int number = 1;

        // 建立模型对象 bean，并把它置到请求头对象 request 中去
        ShopClientBean bean = new ShopClientBean();
        request.setAttribute("client", bean);

        /*
         * 建立饮料和配料的生产工厂，所有饮料和配料的实例均将通过它们获得。
         * 这里工厂的实现还是针对具体实现，实际上也可以通过接口 Factory 建立起与具体工厂无关的实现。
         */

        Beverage beverage = null;
        BeverageFactory factory = new BeverageFactory();
        DecoratorFactory deco = new DecoratorFactory();

        // 从请求头中获得各个参数的值
        product = request.getParameter("product");
        if (product != null)
            product = product.trim();
        decorator = request.getParameter("decorator").trim();
        num = request.getParameter("num").trim();
        if (num != null && !num.equals(""))
            number = Integer.parseInt(num);

        if (product == null || product.equals("")) {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('请先选择饮料');window.location='index.jsp';</script>");
            return;
        }

        if (product != null && product != "") {
            // 获得饮料对象
            beverage = factory.getBeverage(product);
            description = beverage.getDescription();

            if (!(beverage instanceof NoBeverage) && !decorator.equals("") && number != 0) {
                // 获得配料对象
                beverage = deco.getDecorator(decorator, beverage);

                if (beverage instanceof NoDecorator)
                    description = beverage.getDescription();
                else {
                    // 获得饮料被装饰后（即加入配料后）的描述
                    description = beverage.getDescription() + " " + number + "份";

                    for (int i = 1; i < number; i++) {
                        // 这个循环实现了添加多份配料
                        beverage = deco.getDecorator(decorator, beverage);
                    }
                }
            }
        }
        // 获得饮料被装饰后（即加入配料后）的价格
        price = beverage.getCost();

        // 把所有参数设定到模型 bean 中去
        bean.setProduct(product);
        bean.setDecorator(decorator);
        bean.setDescription(description);
        bean.setPrice(price);

        // 处理完毕后进行页面跳转，这是带参数形式的跳转，把请求头和响应对象返回给跳转的页面
        // 这样就可以使用 bean 里面的参数值
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
