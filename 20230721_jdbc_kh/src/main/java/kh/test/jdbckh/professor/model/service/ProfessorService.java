package kh.test.jdbckh.professor.model.service;

import static kh.test.jdbckh.common.jdbc.JdbcTemplate.close;
import static kh.test.jdbckh.common.jdbc.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import kh.test.jdbckh.department.model.dto.DepartmentDto;
import kh.test.jdbckh.professor.model.dao.ProfessorDao;
import kh.test.jdbckh.professor.model.vo.Professor;

public class ProfessorService {
	private ProfessorDao dao = new ProfessorDao();
	
	// 학생등록시 필요한 학과정보 리스트 읽기
	public List<Professor> selectList(){
		List<Professor> result = null;
		Connection conn = getConnection();
		result = dao.selectList(conn);
		close(conn);
		return result;
	}

}
