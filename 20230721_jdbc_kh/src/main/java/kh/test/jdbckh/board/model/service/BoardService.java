package kh.test.jdbckh.board.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kh.test.jdbckh.board.model.dao.BoardDao;
import kh.test.jdbckh.board.model.dto.AttachFileDto;
import kh.test.jdbckh.board.model.dto.BoardDto;
import kh.test.jdbckh.common.jdbc.MyBatisTemplate;
import kh.test.jdbckh.member.model.dao.MemberDao;

public class BoardService {
	private BoardDao dao = new BoardDao();
	private MemberDao mdao = new MemberDao();
	
	public List<BoardDto> selectList(){
		List<BoardDto> result = null;
		SqlSession session = MyBatisTemplate.getSqlSession(true);
		//result = dao.selectList(session);
		session.close();
		return result;
	}
	// 한 행 읽기 - PK로where조건
	public BoardDto selectOne(int bno){
		BoardDto result = null;
		SqlSession session = MyBatisTemplate.getSqlSession(true);
		result = dao.selectOne(session, bno);
		if(result != null) {
			// 첨부파일들 읽어서 result에 넣기
			List<AttachFileDto> fileList = dao.selectAttachFileList(session, bno);
			result.setAttachFileList(fileList);
		}
		session.close();
		return result;
	}
	// 한 행 삽입 - BoardDto 자료형을 받아와야 함.
	public int insert(BoardDto dto, List<AttachFileDto> fileList){
		int result = 0;
		SqlSession session = MyBatisTemplate.getSqlSession(false);
		//setAutoCommit(conn, false);
		//int nextval = dao.getSeqBoardBnoNexVal(session);
		if(dto.getBno() == 0) { // 원본글작성
			//result = dao.insert(session, dto, nextval);
			if(fileList!=null && fileList.size()>0) {
			//	result = dao.insertAttachFileList(session, fileList, nextval);
			}
		}else {   // 답글작성
			//result = dao.update(session, dto);
			if(result > -1) {
				//result = dao.insertReply(session, dto, nextval);
			}
			if(fileList!=null && fileList.size()>0) {
				//result = dao.insertAttachFileList(session, fileList, nextval);
			}
		}
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}
	// 한 행 수정 - BoardDto 또는 경우에 따라서 특정 컬럼값만 받아오기도 함.
	public int update(BoardDto dto){
		int result = 0;
		SqlSession session = MyBatisTemplate.getSqlSession(true);
		//result = dao.update(session, dto);
		session.close();
		return result;
	}
	// 한 행 삭제 - 주로 PK로 where조건
	public int delete(int bno){
		int result = 0;
		SqlSession session = MyBatisTemplate.getSqlSession(true);
		//result = dao.delete(session, bno);
		session.close();
		return result;
	}
	
	//// 추가 
	// 페이징 처리 + 검색
	public int getTotalCount(String searchWord) {
		int result = 0;
		SqlSession session = MyBatisTemplate.getSqlSession(true);
		//result = dao.getTotalCount(session, searchWord);
		session.close();
		return result;
	}
	public List<BoardDto> selectList(int currentPage, int pageSize, String searchWord){
		List<BoardDto> result = null;
		SqlSession session = MyBatisTemplate.getSqlSession(true);
		//int totalCount = dao.getTotalCount(searchWord);
		//result = dao.selectList(session, currentPage, pageSize, totalCount, searchWord);
		session.close();
		return result;
	}
}
