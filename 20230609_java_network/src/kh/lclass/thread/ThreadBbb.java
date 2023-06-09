package kh.lclass.thread;

public class ThreadBbb extends Thread {
	
	@Override
	public void run() {
		for(int dan=2; dan<101; dan++) {
			for(int su=1; su<10; su++) {
				System.out.printf("### %3d*%2d\n", dan, su, dan*su);
			}
			System.out.println("===");
		}
		System.out.println("**ThreadBbb 끝***********");
		return;
	}
}
