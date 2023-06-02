package kh.lclass.oop.sample;

class Animal{
	public void move() {
		System.out.println("동물이 움직입니다.");
	}
}
class Human extends Animal{
	@Override
	public void move() {
		System.out.println("사람이 움직입니다.");
	}
}
public class AnimalTest {
	public static void main(String[] args) {
		new AnimalTest().moveAnimal(new Animal());
		new AnimalTest().moveAnimal(new Human());
	}
	public void moveAnimal(Animal a) {
		a.move();
		
	}
}
