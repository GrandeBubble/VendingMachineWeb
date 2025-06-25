package org.example.vendingmachineweb.model;

public class MilkTea extends Beverage {
    public MilkTea() {
        description = "奶茶";
    }

    @Override
    public double getCost() {
        return 3.0;
    }
}