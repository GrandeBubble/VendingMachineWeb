package org.example.vendingmachineweb.controller;

import org.example.vendingmachineweb.model.Beverage;

public class NoBeverage extends Beverage {
    String description = "没有您所点的饮料，请重新点(coca 或 coffee)。";
    public String getDescription(){
        return description;
    }
    public double getCost() {
        return 0;
    }
}
