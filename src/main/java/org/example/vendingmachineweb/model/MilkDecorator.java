package org.example.vendingmachineweb.model;

/* MilkDecorator的构造方法里传入需要装饰的饮料(反过来看就是把milk加到饮料中
去)，这样就可以引用被装饰的饮料的描述和价格了。 */

public class MilkDecorator extends Decorator {
    Beverage beverage;

    public MilkDecorator(Beverage beverage) {
        this.beverage = beverage;
    }
    @Override
    /* 这里返回饮料的信息和装饰者本身的信息，
    Milk 是该装饰者(MilkDecorator)的描述，0.5 是价格。 */
    public String getDescription() {
        return beverage.getDescription()+" 加 Milk";
    }

    public double getCost() {
        return beverage.getCost()+0.5;
    }
}
