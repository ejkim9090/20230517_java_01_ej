package kh.test.jdbckh.department.model.dao;

import static kh.test.jdbckh.common.jdbc.JdbcTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kh.test.jdbckh.department.model.dto.DepartmentDto;

public class DepartmentDao {
	//// === 기본 5 개 
	// 모든 행 읽기
	public List<DepartmentDto> selectList(Connection conn){
		List<DepartmentDto> result = null;
		//TODO
		return result;
	}
	// 한 행 읽기 - PK로where조건
	public DepartmentDto selectOne(Connection conn, String departmentNo){
		DepartmentDto result = null;
		//TODO
		return result;
	}
	// 한 행 삽입 - DepartmentDto 자료형을 받아와야 함.
	public int insert(Connection conn, DepartmentDto dto){
		int result = 0;
		//TODO
		return result;
	}
	// 한 행 수정 - DepartmentDto 또는 경우에 따라서 특정 컬럼값만 받아오기도 함.
	public int update(Connection conn, DepartmentDto dto){
		int result = 0;
		//TODO
		return result;
	}
	// 한 행 삭제 - 주로 PK로 where조건
	public int delete(Connection conn,String departmentNo){
		int result = 0;
		//TODO
		return result;
	}
	
	//// 추가 
	// 페이징 처리 + 검색
	public int getTotalCount(Connection conn, String searchWord) {
		int result = 0;
		return result;
	}
	public List<DepartmentDto> selectList(Connection conn, int currentPage, int pageSize, String searchWord){
		List<DepartmentDto> result = new ArrayList<DepartmentDto>();
		String query = " select DEPARTMENT_NO, DEPARTMENT_NAME, CATEGORY, OPEN_YN, CAPACITY from tb_department ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next() == true) {
//				DEPARTMENT_NO
//				DEPARTMENT_NAME
//				CATEGORY
//				OPEN_YN
//				CAPACITY
				DepartmentDto dto = new DepartmentDto();
				dto.setDepartmentNo( rs.getString("DEPARTMENT_NO"));
				dto.setDepartmentName( rs.getString("DEPARTMENT_NAME"));
				dto.setCategory( rs.getString("CATEGORY"));
				dto.setOpenYn( rs.getString("OPEN_YN"));
				dto.setCapacity( rs.getInt("CAPACITY"));
				result.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
}
