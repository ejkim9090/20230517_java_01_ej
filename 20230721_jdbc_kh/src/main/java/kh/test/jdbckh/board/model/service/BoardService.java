package kh.test.jdbckh.board.model.service;

import static kh.test.jdbckh.common.jdbc.JdbcTemplate.close;
import static kh.test.jdbckh.common.jdbc.JdbcTemplate.getConnection;
import static kh.test.jdbckh.common.jdbc.JdbcTemplate.setAutoCommit;
import static kh.test.jdbckh.common.jdbc.JdbcTemplate.commit;
import static kh.test.jdbckh.common.jdbc.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import kh.test.jdbckh.board.model.dao.BoardDao;
import kh.test.jdbckh.board.model.dto.AttachFileDto;
import kh.test.jdbckh.board.model.dto.BoardDto;
import kh.test.jdbckh.member.model.dao.MemberDao;

public class BoardService {
	private BoardDao dao = new BoardDao();
	private MemberDao mdao = new MemberDao();
	
	public List<BoardDto> selectList(){
		List<BoardDto> result = null;
		Connection conn = getConnection();
		result = dao.selectList(conn);
		close(conn);
		return result;
	}
	// 한 행 읽기 - PK로where조건
	public BoardDto selectOne(int bno){
		BoardDto result = null;
		Connection conn = getConnection();
		result = dao.selectOne(conn, bno);
		if(result != null) {
			// 첨부파일들 읽어서 result에 넣기
			List<AttachFileDto> fileList = dao.selectAttachFileList(conn, bno);
			result.setAttachFileList(fileList);
		}
		close(conn);
		return result;
	}
	// 한 행 삽입 - BoardDto 자료형을 받아와야 함.
	public int insert(BoardDto dto, List<AttachFileDto> fileList){
		int result = 0;
		Connection conn = getConnection();
		setAutoCommit(conn, false);
		int nextval = dao.getSeqBoardBnoNexVal(conn);
		if(dto.getBno() == 0) { // 원본글작성
			result = dao.insert(conn, dto, nextval);
			if(fileList!=null && fileList.size()>0) {
				result = dao.insertAttachFileList(conn, fileList, nextval);
			}
		}else {   // 답글작성
			result = dao.update(conn, dto);
			if(result > -1) {
				result = dao.insertReply(conn, dto, nextval);
			}
			if(fileList!=null && fileList.size()>0) {
				result = dao.insertAttachFileList(conn, fileList, nextval);
			}
		}
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	// 한 행 수정 - BoardDto 또는 경우에 따라서 특정 컬럼값만 받아오기도 함.
	public int update(BoardDto dto){
		int result = 0;
		Connection conn = getConnection();
		result = dao.update(conn, dto);
		close(conn);
		return result;
	}
	// 한 행 삭제 - 주로 PK로 where조건
	public int delete(int bno){
		int result = 0;
		Connection conn = getConnection();
		result = dao.delete(conn, bno);
		close(conn);
		return result;
	}
	
	//// 추가 
	// 페이징 처리 + 검색
	public int getTotalCount(String searchWord) {
		int result = 0;
		Connection conn = getConnection();
		result = dao.getTotalCount(conn, searchWord);
		close(conn);
		return result;
	}
	public List<BoardDto> selectList(int currentPage, int pageSize, String searchWord){
		List<BoardDto> result = null;
		Connection conn = getConnection();
		int totalCount = getTotalCount(searchWord);
		result = dao.selectList(conn, currentPage, pageSize, totalCount, searchWord);
		close(conn);
		return result;
	}
}
