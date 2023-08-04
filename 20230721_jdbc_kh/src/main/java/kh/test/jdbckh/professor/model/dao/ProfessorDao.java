package kh.test.jdbckh.professor.model.dao;

import static kh.test.jdbckh.common.jdbc.JdbcTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kh.test.jdbckh.professor.model.vo.Professor;

public class ProfessorDao {
	// 학생등록시 필요한 학과정보 리스트 읽기
	public List<Professor> selectList(Connection conn) {
		System.out.println("[Prof Dao selectList]");
		String query = "select professor_no, professor_name from tb_professor";
		List<Professor> result = new ArrayList<Professor>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next() == true) {
//						DEPARTMENT_NO
//						DEPARTMENT_NAME
//						CATEGORY
//						OPEN_YN
//						CAPACITY
				Professor dto = new Professor(rs.getString("professor_no"), rs.getString("professor_name"));
				result.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("[Prof Dao selectList] return:" + result);
		return result;
	}
}
