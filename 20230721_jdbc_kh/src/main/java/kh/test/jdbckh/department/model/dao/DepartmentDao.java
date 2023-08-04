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
	public List<DepartmentDto> selectList(Connection conn) {
		System.out.println("[Dept Dao selectList]");
		String query = "select DEPARTMENT_NO, DEPARTMENT_NAME, CATEGORY, OPEN_YN, CAPACITY from tb_department";
		List<DepartmentDto> result = new ArrayList<DepartmentDto>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next() == true) {
//				DEPARTMENT_NO
//				DEPARTMENT_NAME
//				CATEGORY
//				OPEN_YN
//				CAPACITY
				DepartmentDto dto = new DepartmentDto();
				dto.setDepartmentNo(rs.getString("DEPARTMENT_NO"));
				dto.setDepartmentName(rs.getString("DEPARTMENT_NAME"));
				dto.setCategory(rs.getString("CATEGORY"));
				dto.setOpenYn(rs.getString("OPEN_YN"));
				dto.setCapacity(rs.getInt("CAPACITY"));
				result.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("[Dept Dao selectList] return:" + result);
		return result;
	}

	// 한 행 읽기 - PK로where조건
	public DepartmentDto selectOne(Connection conn, String departmentNo) {
		System.out.println("[Dept Dao selectOne] departmentNo:" + departmentNo);
		DepartmentDto result = null;
		String query = "select DEPARTMENT_NO, DEPARTMENT_NAME, CATEGORY, OPEN_YN, CAPACITY from tb_Department"
				+ " where DEPARTMENT_NO = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, departmentNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = new DepartmentDto(rs.getString("DEPARTMENT_NO"), rs.getString("DEPARTMENT_NAME"),
						rs.getString("CATEGORY"), rs.getString("OPEN_YN"), rs.getInt("CAPACITY"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("[Dept Dao selectOne] return:" + result);
		return result;
	}

	// 한 행 삽입 - DepartmentDto 자료형을 받아와야 함.
	public int insert(Connection conn, DepartmentDto dto) {
		System.out.println("[Dept Dao insert] dto:" + dto);
		int result = 0;
		// TODO
		System.out.println("[Dept Dao insert] return:" + result);
		return result;
	}

	// 한 행 수정 - DepartmentDto 또는 경우에 따라서 특정 컬럼값만 받아오기도 함.
	public int update(Connection conn, DepartmentDto dto) {
		System.out.println("[Dept Dao update] dto:" + dto);
		int result = 0;
		// TODO
		System.out.println("[Dept Dao update] return:" + result);
		return result;
	}

	// 한 행 삭제 - 주로 PK로 where조건
	public int delete(Connection conn, String departmentNo) {
		System.out.println("[Dept Dao delete] departmentNo:" + departmentNo);
		int result = 0;
		// TODO
		System.out.println("[Dept Dao delete] return:" + result);
		return result;
	}

	//// 추가
	// 페이징 처리(pageSize!=0아닐때) + 검색(있다면 where처리)
	public int getTotalCount(Connection conn, String searchWord) {
		System.out.println("[Dept Dao getTotalCount] searchWord:" + searchWord);

		int result = 0;
		String query = "select count(*) cnt from tb_student ";
		if (searchWord != null) { // 검색(있다면 where처리)
			query += " where DEPARTMENT_NAME like ? or DEPARTMENT_NAME like ? or CATEGORY like ? ";
			searchWord = "%" + searchWord + "%";
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(query);
			if (searchWord != null) { // 검색(있다면 where처리)
				pstmt.setString(1, searchWord);
				pstmt.setString(2, searchWord);
				pstmt.setString(3, searchWord);
			}
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("[Dept Dao getTotalCount] return:" + result);
		return result;
	}

	public List<DepartmentDto> selectList(Connection conn, int currentPage, int pageSize, int totalCount,
			String searchWord) {
		System.out.println("[Dept Dao selectList] currentPage:" + currentPage + ",pageSize:" + pageSize + ",totalCount:"
				+ totalCount + ",searchWord:" + searchWord);

		// 페이징처리 방정식
		int startRownum = 0;
		int endRownum = 0;
		if (pageSize > 0) { // 페이징 처리(pageSize!=0아닐때)
			startRownum = (currentPage - 1) * pageSize + 1;
			endRownum = ((currentPage * pageSize) > totalCount) ? totalCount : (currentPage * pageSize);
			System.out.println("startRownum:" + startRownum + ", endRownum:" + endRownum);
		}

		List<DepartmentDto> result = new ArrayList<DepartmentDto>();
		String subquery = " select DEPARTMENT_NO, DEPARTMENT_NAME, CATEGORY, OPEN_YN, CAPACITY from tb_department ";
		if (searchWord != null) { // 검색(있다면 where처리)
			subquery += " where DEPARTMENT_NAME like ? or DEPARTMENT_NAME like ? or CATEGORY like ? ";
			searchWord = "%" + searchWord + "%";
		}
		subquery += " order by OPEN_YN desc, CATEGORY asc, DEPARTMENT_NAME asc"; // 정렬순서
		String query = subquery;
		if (pageSize > 0) { // 페이징 처리(pageSize!=0아닐때)
			query = " select * from ( select ROWNUM rnum, tb1.* from " + "(" + subquery + ") tb1 " + " )";
			query += " where rnum between ? and ?";
		}

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(query);
			if (searchWord != null) { // 검색(있다면 where처리)
				pstmt.setString(1, searchWord);
				pstmt.setString(2, searchWord);
				pstmt.setString(3, searchWord);
			}
			if (searchWord != null && pageSize > 0) { // 검색(있다면 where처리) // 페이징 처리(pageSize!=0아닐때)
				pstmt.setInt(4, startRownum);
				pstmt.setInt(5, endRownum);
			} else if (searchWord == null && pageSize > 0) {// 페이징 처리(pageSize!=0아닐때)
				pstmt.setInt(1, startRownum);
				pstmt.setInt(2, endRownum);
			}
			rs = pstmt.executeQuery();

			while (rs.next() == true) {
//				DEPARTMENT_NO
//				DEPARTMENT_NAME
//				CATEGORY
//				OPEN_YN
//				CAPACITY
				DepartmentDto dto = new DepartmentDto();
				dto.setDepartmentNo(rs.getString("DEPARTMENT_NO"));
				dto.setDepartmentName(rs.getString("DEPARTMENT_NAME"));
				dto.setCategory(rs.getString("CATEGORY"));
				dto.setOpenYn(rs.getString("OPEN_YN"));
				dto.setCapacity(rs.getInt("CAPACITY"));
				result.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("[Dept Dao selectList] return:" + result);
		return result;
	}

	// 학생등록시 필요한 학과정보 리스트 읽기
	public List<DepartmentDto> selectListForStudent(Connection conn) {
		System.out.println("[Dept Dao selectList]");
		String query = "select DEPARTMENT_NO, DEPARTMENT_NAME from tb_department where open_yn='Y'";
		List<DepartmentDto> result = new ArrayList<DepartmentDto>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next() == true) {
//					DEPARTMENT_NO
//					DEPARTMENT_NAME
//					CATEGORY
//					OPEN_YN
//					CAPACITY
				DepartmentDto dto = new DepartmentDto();
				dto.setDepartmentNo(rs.getString("DEPARTMENT_NO"));
				dto.setDepartmentName(rs.getString("DEPARTMENT_NAME"));
				result.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("[Dept Dao selectList] return:" + result);
		return result;
	}
}
