package org.example.vendingmachineweb.model;

public class Juice extends Beverage {
    public Juice() {
        description = "果汁";
    }

    @Override
    public double getCost() {
        return 2.5;
    }
}