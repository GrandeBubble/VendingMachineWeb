package org.example.vendingmachineweb.model;

public class IceDecorator extends Decorator {
    /*
     * 同样 IceDecorator 的构造方法里传入需要装饰的饮料(反过来看就是把 ice 加到饮料中去) ,
     * 这样就可以引用被装饰的饮料的描述和价格。
     */

    Beverage beverage;

    public IceDecorator(Beverage beverage) {
        this.beverage = beverage;
    }

    /*
     * 这里返回饮料的信息和装饰者本身的信息，
     * Ice 是该装饰者(IceDecorator)的描述，0.5 是价格。
     */
    public String getDescription() {
        return beverage.getDescription() + " + 冰块";
    }

    public double getCost() {
        return beverage.getCost() + 0.5;
    }
}
