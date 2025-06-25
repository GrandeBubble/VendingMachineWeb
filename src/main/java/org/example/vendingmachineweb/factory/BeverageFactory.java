package org.example.vendingmachineweb.factory;

import org.example.vendingmachineweb.controller.NoBeverage;
import org.example.vendingmachineweb.model.Beverage;
import org.example.vendingmachineweb.model.Coca;
import org.example.vendingmachineweb.model.Coffee;

public class BeverageFactory implements Factory {

    private String beverageName;
    private Beverage beverage;

    public Beverage getBeverage(@org.jetbrains.annotations.NotNull String beverageName) {
        this.beverageName = beverageName;
        if (beverageName.equalsIgnoreCase("coca"))
            beverage = new Coca();
        else if (beverageName.equalsIgnoreCase("coffee"))
            beverage = new Coffee();

        // 这里的 NoBeverage 对象可以处理各种其他情况，具体实现见“非法请求处理”
        else
            beverage = new NoBeverage();

        return beverage;
    }
}