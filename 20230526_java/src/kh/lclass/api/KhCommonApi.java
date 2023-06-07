package kh.lclass.api;

public class KhCommonApi {
	public static boolean checkMenu(int start, int end, int value) {
		boolean result = false;
		if(value < start || value > end) {
			// 비정상 입력경우
			System.out.printf("%d-%d사이 선택해주세요.\n", start, end);
		} else {
			// 정상 입력
			result = true;
		}
		return result;
	}
}
