package org.example.vendingmachineweb.model;

public class SugarDecorator extends Decorator {
    Beverage beverage;

    public SugarDecorator(Beverage beverage) {
        this.beverage = beverage;
    }

    @Override
    public String getDescription() {
        return beverage.getDescription() + " + 糖";
    }

    @Override
    public double getCost() {
        return beverage.getCost() + 0.2;
    }
}