package org.example.vendingmachineweb.model;

public class PearlDecorator extends Decorator {
    Beverage beverage;

    public PearlDecorator(Beverage beverage) {
        this.beverage = beverage;
    }

    @Override
    public String getDescription() {
        return beverage.getDescription() + " + 珍珠";
    }

    @Override
    public double getCost() {
        return beverage.getCost() + 1.0;
    }
}