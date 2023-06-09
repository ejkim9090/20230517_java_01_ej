package kh.lclass.thread.run;

import kh.lclass.thread.ThreadAaa;
import kh.lclass.thread.ThreadBbb;

public class Run {
	public static void main(String[] args) {
		
//		Runnable ra = new ThreadAaa();
//		Thread ta = new Thread(ra);
		Thread ta = new Thread(new ThreadAaa());
		ta.setPriority(1);
		ta.start();

		Thread tb = new ThreadBbb();
		tb.setPriority(10);
		tb.start();
		
		Thread tbb = new ThreadBbb();
		tbb.start();
		
// run 일반 메소드 호출하듯 하면 Thread 동작 안함		
//		ta.run();
//		tb.run();
		
		for(int i=0; i<500; i++) {
			System.out.println(i+"*");
		}
		System.out.println("**main 끝***********");
	
	}
}
