package kh.lclass.test;

import java.util.Scanner;

public class TestExam {
	public static void main(String[] args) {
		new TestExam().printGugudan();
	}
	public void printGugudan() {
		Scanner sc = new Scanner(System.in);
		int dan = sc.nextInt();
		// dan 이 2-9 사이 정수면
		if( 2 <= dan && dan <= 9) {
			//구구단 표현
			for(int su=1; su<10; su+=1 ) {
				System.out.println(dan +"*"+su+"="+dan*su);
			}
			
		} else {
			// 아니라면 "2-9사이정수를 입력해주세요"
			System.out.println("2-9사이 정수를 입력해주세요.");
		}
		
		// dan 이 2-9 사이 정수가 아니라면 
		if( 2 > dan || dan > 9 ) {
			// "2-9사이정수를 입력해주세요"
		} else {
		// 그외 정수라명
			//구구단 표현
		}
		
		// dan 이 2-9 사이 정수가 아니라면 
		if( !(2 <= dan && dan <= 9) ) {
			
		}else {
			
		}
	}
}
