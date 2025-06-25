package org.example.vendingmachineweb.controller;

import org.example.vendingmachineweb.model.Decorator;

public class NoDecorator extends Decorator {
    String description = "没有您所点的配料，请重新点(milk 或 ice)。";
    public String getDescription() {
        return this.description;
    }
    public double getCost() {
        return 0;
    }
}
