package kh.test.jdbckh.student.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kh.test.jdbckh.student.model.vo.StudentVo;

import static kh.test.jdbckh.common.jdbc.JdbcTemplate.*;

public class StudentDao {
// PPT 내용구현
	
	// DB에서 tb_student 테이블의 전달받은 학번을 통해 학생1명의 상세정보를 읽어옴
	public StudentVo selectOneStudent(String studentNo) {
		System.out.println("DAO selectOneStudent() arg:"+ studentNo);

		StudentVo result = null;
//		String query = "select * from tb_student join tb_department using(department_no) where student_no = "+"'"+studentNo+"'";
//		String query = "select s.*, department_name from tb_student s join tb_department d on(s.department_no=d.department_no) where student_no ="+"'"+studentNo+"'";
//		String query = "select s.* "
//				+ " , (select department_name from tb_department where department_no=s.department_no) department_name "
//				+ " from "
//				+ " tb_student s where student_no ="+"'"+studentNo+"'";
		String query = "select s.* "
			+ " , (select department_name from tb_department where department_no=s.department_no) department_name "
			+ " from "
			+ " tb_student s where student_no = ?";  
		// ? 위치홀더
//		String query = "select * from tb_student join tb_department using(department_no) where student_no = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			// pstmt 생성된 후  ---- execute실행하기 전
			// 여기서 ? 위치홀더에 값넣기
			pstmt.setString(1, studentNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = new StudentVo();
				// while 동작시킬필요없음. query 결과가 단일행일 것이므로
				result.setAbsenceYn(rset.getString("Absence_Yn"));
				result.setCoachProfessorNo(rset.getString("Coach_Professor_No"));
				result.setDepartmentNo(rset.getString("Department_No"));
				result.setEntranceDate(rset.getDate("Entrance_Date"));
				result.setStudentAddress(rset.getString("Student_Address"));
				result.setStudentName(rset.getString("student_Name"));
				result.setStudentNo(rset.getString("student_No"));
				result.setStudentSsn(rset.getString("Student_Ssn"));
				result.setDepartmentName(rset.getString("Department_Name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			close(conn);
		}

		System.out.println(result);
		return result;
	}
	
	// DB에서 tb_student 테이블의 있는 모든 내용을 읽어서 꺼냄.
	public List<StudentVo> selectListStudent() {  // 전체 보기
		List<StudentVo> result = null;
		
		String query= "select * from tb_student";
		
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 1. driver 있다면 로딩함. // 없다면 ClassNotFoundException 오류 발생
			// 2. Connection 객체 생성 // dbms와 연결
			conn = getConnection();
			// 3. Statement/PrepareStatement 객체 생성 -conn 객체로부터 - query 문을 실어보냄
//			stmt = conn.createStatement();
			pstmt = conn.prepareStatement(query);
			// 4. query 문을 실행해달라고 함.- 그 결과값을 return 받음.
			// select query 문이면 ResultSet 모양
			// insert/update/delete 문이면 int 모양
			rs = pstmt.executeQuery();
			
			// 5. ResultSet 에서 row(record)=한줄 읽어오기 위해 cursor(포인트)를 이동함.
			if(rs.next() ) {
				result = new ArrayList<StudentVo>();
				do {
				//  한줄row/record 를 읽을 준비 완료
				// 확인용도. System.out.println( rs.getString("STUDENT_NAME") );
				StudentVo vo = new StudentVo();
				vo.setStudentNo(rs.getString("Student_No"));
				vo.setDepartmentNo( rs.getString("department_no"));
				vo.setStudentName( rs.getString("Student_Name"));
				vo.setAbsenceYn( rs.getString("Absence_Yn"));
				vo.setCoachProfessorNo( rs.getString("Coach_Professor_No"));
				vo.setStudentAddress( rs.getString("Student_Address"));
				vo.setEntranceDate( rs.getDate("Entrance_Date") );
				
				result.add(vo);
				}while(rs.next() == true);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}

		//  확인용 System.out.println(result);
		return result;
	}
	// DB에서 tb_student 테이블의 있는 모든 내용을 읽어서 꺼냄.
	public List<StudentVo> selectListStudent(String searchWord) {  // 검색
		List<StudentVo> result = null;
		// 오류String query= "select * from tb_student where student_name like '%?%' or student_address like '%?%'";
		String query= "select * from tb_student where student_name like ? or student_address like ?";
		// like 연산자인 경우 위치홀더? 대신 연결자
//		String query= "select * from tb_student where student_name like '%"+searchWord+"%' or student_address like '%"+searchWord+"%'";
		
		
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 1. driver 있다면 로딩함. // 없다면 ClassNotFoundException 오류 발생
			// 2. Connection 객체 생성 // dbms와 연결
			conn =  getConnection();
			// 3. Statement/PrepareStatement 객체 생성 -conn 객체로부터 - query 문을 실어보냄
//			stmt = conn.createStatement();
			pstmt = conn.prepareStatement(query);
			// 3-4 사이 위치홀더 ? 에 값 설정
			searchWord = "%"+searchWord+"%";  //like 연산자인 경우 % 또는 _ 를 합쳐서 만듬
			pstmt.setString(1, searchWord);
			pstmt.setString(2, searchWord);
			// 4. query 문을 실행해달라고 함.- 그 결과값을 return 받음.
			// select query 문이면 ResultSet 모양
			// insert/update/delete 문이면 int 모양
			rs = pstmt.executeQuery();
			
			// 5. ResultSet 에서 row(record)=한줄 읽어오기 위해 cursor(포인트)를 이동함.
			result = new ArrayList<StudentVo>();
			while(rs.next() == true) {
				//  한줄row/record 를 읽을 준비 완료
				// 확인용도. System.out.println( rs.getString("STUDENT_NAME") );
				StudentVo vo = new StudentVo();
				vo.setStudentNo(rs.getString("Student_No"));
				vo.setDepartmentNo( rs.getString("department_no"));
				vo.setStudentName( rs.getString("Student_Name"));
				vo.setAbsenceYn( rs.getString("Absence_Yn"));
				vo.setCoachProfessorNo( rs.getString("Coach_Professor_No"));
				vo.setStudentAddress( rs.getString("Student_Address"));
				vo.setEntranceDate( rs.getDate("Entrance_Date") );
				
				result.add(vo);
			}
		} catch (SQLException e) {
			// 2. dbms에 연결 실패
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}

		//  확인용 System.out.println(result);
		return result;
	}

	
	public List<StudentVo> selectListStudent(int currentPage, int pageSize ) {  // 페이징처리
		List<StudentVo> result = new ArrayList<StudentVo>();
		
		String queryTotalCnt= "select count(*) cnt from tb_student";  
		String query= " select * from "
				+ " (\r\n"
				+ " select tb1.*, rownum rn from"
				+ "    (select * from tb_student order by student_no asc) tb1"
				+ " ) tb2"
				+ " where rn between ? and ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int totalCnt = 0;  // 총글개수
		int startRownum = 0;
		int endRownum = 0;
		try {
			conn = getConnection();
			// 총글개수 알아오기 위한 query 실행
			pstmt = conn.prepareStatement(queryTotalCnt);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//오류 함수는 컬럼명이 될수 없음 -  totalCnt = rs.getInt("count(*)");
				totalCnt = rs.getInt("cnt");
				//totalCnt = rs.getInt(1);
			}
			System.out.println("총글개수:"+totalCnt);
			startRownum = (currentPage-1)*pageSize +1;
			endRownum = ((currentPage*pageSize) > totalCnt) ? totalCnt: (currentPage*pageSize);
			System.out.println("startRownum:"+startRownum);
			System.out.println("endRownum:"+endRownum);

			// conn 생성으로 2개의 query(select)문을 실행할때
			close(rs);
			close(pstmt);
			
			// 페이지당 글 읽어오기 위한 query 실행
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRownum);
			pstmt.setInt(2, endRownum);
			rs = pstmt.executeQuery();
			
			// 5. ResultSet 에서 row(record)=한줄 읽어오기 위해 cursor(포인트)를 이동함.
			while(rs.next() == true) {
				//  한줄row/record 를 읽을 준비 완료
				// 확인용도. System.out.println( rs.getString("STUDENT_NAME") );
				StudentVo vo = new StudentVo();
				vo.setStudentNo(rs.getString("Student_No"));
				vo.setDepartmentNo( rs.getString("department_no"));
				vo.setStudentName( rs.getString("Student_Name"));
				vo.setAbsenceYn( rs.getString("Absence_Yn"));
				vo.setCoachProfessorNo( rs.getString("Coach_Professor_No"));
				vo.setStudentAddress( rs.getString("Student_Address"));
				vo.setEntranceDate( rs.getDate("Entrance_Date") );
				
				result.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}

		//  확인용 System.out.println(result);
		return result;
	}
}
