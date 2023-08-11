package kh.test.mybatis.department.model.service;

import java.sql.Connection;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kh.test.mybatis.common.MyBatisTemplate;
import kh.test.mybatis.department.model.dao.DepartmentDao;
import kh.test.mybatis.department.model.dto.DepartmentDto;

public class DepartmentService {
	private DepartmentDao dao = new DepartmentDao();

	public List<DepartmentDto> selectList() {
		System.out.println("selectList");
		List<DepartmentDto> result = null;
		return result;
	}

	

}
