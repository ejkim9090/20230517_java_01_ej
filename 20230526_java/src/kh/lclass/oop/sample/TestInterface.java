package kh.lclass.oop.sample;

import java.awt.im.spi.InputMethod;
import java.io.Serializable;

public interface TestInterface extends /* InputMethod, */Serializable {
	int MAXCNT = 10;
	public static final int MAXCNT2 = 10;
	public void method1() ;  // 능력단위별 평가보기
	public String method2();  // 평가안내
	public int method3(int a, int b);  // 평가리뷰
	
//	public int method3();  // 평가리뷰
	
//	int insertBoard(Car vo);
//	int deleteBoard(Car vo);
//	int updateBoard(Car vo);
//	Car selectOne(int boardNo);
//	Car[] selectList();
//	Car[] selectList(String searchWord);
//	List<Car> selectListList(String searchWord);
//	Car[] searchSelectBoard(String word);
}
