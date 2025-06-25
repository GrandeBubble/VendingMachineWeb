package org.example.vendingmachineweb.model;

public class PuddingDecorator extends Decorator {
    Beverage beverage;

    public PuddingDecorator(Beverage beverage) {
        this.beverage = beverage;
    }

    @Override
    public String getDescription() {
        return beverage.getDescription() + " + 布丁";
    }

    @Override
    public double getCost() {
        return beverage.getCost() + 1.0;
    }
}