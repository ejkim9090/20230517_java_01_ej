package kh.test.jdbckh.department.model.service;

import java.sql.Connection;
import java.util.List;

import static kh.test.jdbckh.common.jdbc.JdbcTemplate.*;

import kh.test.jdbckh.department.model.dao.DepartmentDao;
import kh.test.jdbckh.department.model.dto.DepartmentDto;

public class DepartmentService {
	private DepartmentDao dao = new DepartmentDao();
	
	public List<DepartmentDto> selectList(){
		List<DepartmentDto> result = null;
		Connection conn = getConnection();
		result = dao.selectList(conn);
		close(conn);
		return result;
	}
	// 한 행 읽기 - PK로where조건
	public DepartmentDto selectOne(String departmentNo){
		DepartmentDto result = null;
		Connection conn = getConnection();
		result = dao.selectOne(conn, departmentNo);
		close(conn);
		return result;
	}
	// 한 행 삽입 - DepartmentDto 자료형을 받아와야 함.
	public int insert(DepartmentDto dto){
		int result = 0;
		Connection conn = getConnection();
		result = dao.insert(conn, dto);
		close(conn);
		return result;
	}
	// 한 행 수정 - DepartmentDto 또는 경우에 따라서 특정 컬럼값만 받아오기도 함.
	public int update(DepartmentDto dto){
		int result = 0;
		Connection conn = getConnection();
		result = dao.update(conn, dto);
		close(conn);
		return result;
	}
	// 한 행 삭제 - 주로 PK로 where조건
	public int delete(String departmentNo){
		int result = 0;
		Connection conn = getConnection();
		result = dao.delete(conn, departmentNo);
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
	public List<DepartmentDto> selectList(int currentPage, int pageSize, String searchWord){
		List<DepartmentDto> result = null;
		Connection conn = getConnection();
		int totalCount = getTotalCount(searchWord);
		result = dao.selectList(conn, currentPage, pageSize, totalCount, searchWord);
		close(conn);
		return result;
	}
	
	////추가 
	// 학생등록시 필요한 학과정보 리스트 읽기
	public List<DepartmentDto> selectListForStudent(){
		List<DepartmentDto> result = null;
		Connection conn = getConnection();
		result = dao.selectListForStudent(conn);
		close(conn);
		return result;
	}

}
