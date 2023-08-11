package kh.test.mybatis.student.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kh.test.mybatis.student.model.vo.StudentVo;

public class StudentDao {

	// sql 명령어 별로 메소드 관리함.
	public List<StudentVo> selectList(SqlSession session){
		List<StudentVo> result = session.selectList("student1.selectList0");// "namespace.id"	
		return result;
	}
	public StudentVo selectOne(SqlSession session, String studentNo4){
		StudentVo result = session.selectOne("student1.selectOne0", studentNo4);// "namespace.id", parameter		
		return result;
	}
	public int insert(SqlSession session, StudentVo vo) {
		int result = session.insert("student1.insert0", vo);
		return result;
	}
}
