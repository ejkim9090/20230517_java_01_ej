package kh.lclass.oop.sample;

public class Car {
	private int price;
	
	public Car() {}
	public Car(int price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "Car [price=" + price + "]";
	}
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void defaultFun() {
		System.out.println("Car 기본기능");
	}
	
	public void moveCar() {
		System.out.println("Car move");
	}
}
