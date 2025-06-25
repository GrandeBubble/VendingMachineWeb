package org.example.vendingmachineweb.model;

public class Coca extends Beverage {
    // 这是 Coca 本身的描述和价格
    public Coca() {
        this.description = "Coca Beverage";
    }

    public double getCost() {
        return 1;
    }
}
