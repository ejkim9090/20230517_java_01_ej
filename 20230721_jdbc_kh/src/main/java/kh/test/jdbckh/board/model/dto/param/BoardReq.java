package kh.test.jdbckh.board.model.dto.param;

import java.util.List;

import kh.test.jdbckh.board.model.dto.AttachFileDto;
import kh.test.jdbckh.member.model.dto.Member;

public class BoardReq {
//	BNO         NOT NULL NUMBER         
//	BTITLE      NOT NULL VARCHAR2(300)  
//	BCONTENT             VARCHAR2(4000) 
//	BWRITE_DATE NOT NULL TIMESTAMP(6)   
//	MID         NOT NULL VARCHAR2(20)   
//	BREF        NOT NULL NUMBER         
//	BRE_LEVEL   NOT NULL NUMBER         
//	BRE_STEP    NOT NULL NUMBER
	private String btitle;
	private String bcontent;
	private String mid;
	// 1:n 관계
	//private List<String> filepathList;
	private List<AttachFileDto> attachFileList;// 옵션 경우 setter 작성

	// 기본생성자 만들지 않음.
	
	// 원본글 등록 view --> controller 생성하고 param으로 전달 --> dao
	// 필수 항목들은 생성자를 통해 빠짐없이 값들이 들어갈 수 있도록 함.
	public BoardReq(String btitle, String bcontent, String mid) {
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.mid = mid;
	}
	
	public String getBtitle() {
		return btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public String getMid() {
		return mid;
	}
	// 옵션 경우 setter 작성
	public void setAttachFileList(List<AttachFileDto> attachFileList) {
		this.attachFileList = attachFileList;
	}
	public List<AttachFileDto> getAttachFileList() {
		return attachFileList;
	}

	
}
