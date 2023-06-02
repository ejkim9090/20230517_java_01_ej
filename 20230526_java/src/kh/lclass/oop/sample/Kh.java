package kh.lclass.oop.sample;

import java.io.Serializable;

public class Kh implements TestInterface, Serializable {
	// The serializable class Kh does not declare a static final serialVersionUID field of type long
//	static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private static final long serialVersionUID = 4332607456787281223L;

	public void khSpecial() {
		int a = Integer.parseInt("aaa");
	}
	@Override
	public void method1() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String method2() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int method3(int a, int b) {
		// TODO Auto-generated method stub
		return 0;
	}

}
