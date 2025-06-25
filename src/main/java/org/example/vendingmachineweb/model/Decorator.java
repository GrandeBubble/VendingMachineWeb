package org.example.vendingmachineweb.model;
/*
 * 这个抽象类是用来作为所有装饰者的父类，为了使其能够装饰饮料类，
 * 它继承了与饮料(Coca 和 Coffee)相同的父类 Beverage，也因此，
 * 对于 Beverage 来说是可以被装饰多次的。
 */
public abstract class Decorator extends Beverage {
    public abstract String getDescription();
}