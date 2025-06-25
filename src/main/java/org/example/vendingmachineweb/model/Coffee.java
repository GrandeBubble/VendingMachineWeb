package org.example.vendingmachineweb.model;

public class Coffee extends Beverage {
    // 这是 Coffee 本身的描述和价格
    public Coffee() {
        this.description = "Coffee Beverage";
    }

    public double getCost() {
        return 2;
    }
}
