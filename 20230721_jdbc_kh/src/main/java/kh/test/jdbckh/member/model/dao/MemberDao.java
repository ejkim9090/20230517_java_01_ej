package kh.test.jdbckh.member.model.dao;

import static kh.test.jdbckh.common.jdbc.JdbcTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kh.test.jdbckh.member.model.dto.Member;

public class MemberDao {
	// 모든 행 읽기
	public List<Member> selectList(Connection conn) {
		System.out.println("[Member Dao selectList]");
		List<Member> result = new ArrayList<Member>();
		// TODO
		String query = "select * from member"; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next() == true) {
				Member dto = new Member(
							rs.getString("MID"),
							rs.getString("MNAME"),
							rs.getString("MEMAIL")
						);
				result.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("[Member Dao selectList] return:" + result);
		return result;
	}

	// 한 행 읽기 - PK로where조건
	public Member selectOne(Connection conn, int bno) {
		System.out.println("[Member Dao selectOne] bno:" + bno);
		Member result = null;
		// TODO
		System.out.println("[Member Dao selectOne] return:" + result);
		return result;
	}

	// 한 행 삽입 - Member 자료형을 받아와야 함.
	public int insert(Connection conn, Member dto) {
		System.out.println("[Member Dao insert] dto:" + dto);
		int result = 0;
		// TODO
		String query = "";

		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			// TODO
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("[Member Dao insert] return:" + result);
		return result;
	}

	// 한 행 수정 - Member 또는 경우에 따라서 특정 컬럼값만 받아오기도 함.
	public int update(Connection conn, Member dto) {
		System.out.println("[Member Dao update] dto:" + dto);
		int result = -1; 
		// TODO
		String query = "";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("[Member Dao update] return:" + result);
		return result;
	}

	// 한 행 삭제 - 주로 PK로 where조건
	public int delete(Connection conn, int bno) {
		System.out.println("[Member Dao delete] bno:" + bno);
		int result = 0;
		// TODO
		System.out.println("[Member Dao delete] return:" + result);
		return result;
	}

	
	// 추가
	// login : 성공 :1, 실패시:0  --> 암호화 적용 힘든 방식
	public int login(Connection conn, Member vo) {
		System.out.println("[Member Dao login] vo:" + vo);

		int result = 0;
		String query="select count(*) cnt from member where mid=? and mpwd=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpwd());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//result = rs.getInt(1);
				result = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("[Member Dao login] return:" + result);
		return result;
	}
	// login : mpwd를 return 함. id 존재하지 않으면 return null
	public String login(Connection conn, String mid) {
		System.out.println("[Member Dao login] mid:" + mid);

		String result = null;
		String query="select mpwd from member where mid=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString("mpwd");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("[Member Dao login] return:" + result);
		return result;
	}
}
