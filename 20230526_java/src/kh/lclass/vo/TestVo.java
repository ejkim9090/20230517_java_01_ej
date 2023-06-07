package kh.lclass.vo;

public class TestVo {
	private int boardNum = 1;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private String boardDate;

// 생성자
	// public TestVo() {}
	public TestVo(int num) {
//		boardNum = num+1000;
		boardNum = (int)System.currentTimeMillis() + num;
	}

// all arguments 생성자  == 초기값설정
	public TestVo(int a, String writer) {
		this(a);
		//boardNum = a+1000;
		boardWriter = writer;
	}

	public TestVo(int boardNum, String boardWriter, String boardTitle, String boardContent, String boardDate) {
		this(boardNum, boardWriter);
//		this.boardNum = boardNum+1000;
//		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
	}

// getter
// setter
// toString
	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

}
