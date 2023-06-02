package kh.lclass.oop.sample;

public class Avante extends Car{
	public Avante() {
		super();
		setPrice(3000);
	}
	@Override
	public void moveCar() {
		System.out.println("Avante moveAvante");
	}
}
