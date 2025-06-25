package org.example.vendingmachineweb.factory;

import org.example.vendingmachineweb.controller.NoDecorator;
import org.example.vendingmachineweb.model.Beverage;
import org.example.vendingmachineweb.model.IceDecorator;
import org.example.vendingmachineweb.model.MilkDecorator;

public class DecoratorFactory implements Factory {
    private String decorator;
    private Beverage beverage;
    public Beverage getDecorator(String decorator,Beverage beverage){
        this.decorator = decorator;
        this.beverage = beverage;
        if(decorator.equals("milk"))
            beverage = new MilkDecorator(beverage);
        else if(decorator.equals("ice"))
            beverage = new IceDecorator(beverage);

        //这里的 NoDecorator 对象可以处理各种其他情况，具体实现见“非法请求处理”
        else beverage = new NoDecorator();
        return beverage;
    }
}
