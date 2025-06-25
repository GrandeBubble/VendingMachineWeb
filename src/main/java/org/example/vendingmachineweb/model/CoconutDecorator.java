package org.example.vendingmachineweb.model;

public class CoconutDecorator extends Decorator {
    Beverage beverage;

    public CoconutDecorator(Beverage beverage) {
        this.beverage = beverage;
    }

    @Override
    public String getDescription() {
        return beverage.getDescription() + " + 椰果";
    }

    @Override
    public double getCost() {
        return beverage.getCost() + 1.0;
    }
}