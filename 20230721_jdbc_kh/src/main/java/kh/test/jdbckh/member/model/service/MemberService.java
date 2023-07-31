package kh.test.jdbckh.member.model.service;

import static kh.test.jdbckh.common.jdbc.JdbcTemplate.close;
import static kh.test.jdbckh.common.jdbc.JdbcTemplate.commit;
import static kh.test.jdbckh.common.jdbc.JdbcTemplate.getConnectionKhl;
import static kh.test.jdbckh.common.jdbc.JdbcTemplate.rollback;
import static kh.test.jdbckh.common.jdbc.JdbcTemplate.setAutoCommit;

import java.sql.Connection;
import java.util.List;

import kh.test.jdbckh.member.model.dao.MemberDao;
import kh.test.jdbckh.member.model.dto.Member;

public class MemberService {
	private MemberDao dao = new MemberDao();
	
	public List<Member> selectList(){
		List<Member> result = null;
		Connection conn = getConnectionKhl();
		result = dao.selectList(conn);
		close(conn);
		return result;
	}
	// 한 행 읽기 - PK로where조건
	public Member selectOne(int bno){
		Member result = null;
		Connection conn = getConnectionKhl();
		result = dao.selectOne(conn, bno);
		close(conn);
		return result;
	}
	// 한 행 삽입 - Member 자료형을 받아와야 함.
	public int insert(Member dto){
		int result = 0;
		Connection conn = getConnectionKhl();
		result = dao.insert(conn, dto);
		close(conn);
		return result;
	}
	// 한 행 수정 - Member 또는 경우에 따라서 특정 컬럼값만 받아오기도 함.
	public int update(Member dto){
		int result = 0;
		Connection conn = getConnectionKhl();
		result = dao.update(conn, dto);
		close(conn);
		return result;
	}
	// 한 행 삭제 - 주로 PK로 where조건
	public int delete(int bno){
		int result = 0;
		Connection conn = getConnectionKhl();
		result = dao.delete(conn, bno);
		close(conn);
		return result;
	}
	
	// 추가
	// login 
	public int login(Member vo) {
		int result = 0;
		Connection conn = getConnectionKhl();
		result = dao.login(conn, vo);
		close(conn);
		return result;
	}
	// login 
	public String login(String mid) {
		String result = null;
		Connection conn = getConnectionKhl();
		result = dao.login(conn, mid);
		close(conn);
		return result;
	}
}
