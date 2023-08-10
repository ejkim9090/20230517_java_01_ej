package kh.test.mybatis.department.model.dto;

//  dao --> controller -- view return에 전달되는 (search/selectOne/selectList)
public class DepartmentRes {
//	DEPARTMENT_NO   NOT NULL VARCHAR2(10) 
//	DEPARTMENT_NAME NOT NULL VARCHAR2(40) 
//	CATEGORY                 VARCHAR2(40) 
//	OPEN_YN                  CHAR(1)      
//	CAPACITY                 NUMBER  
	private String departmentNo;
	private String departmentName;
	private String category;
	private String openYn;
	private Integer capacity;
	
	public DepartmentRes() {
	}
	public DepartmentRes(String departmentNo, String departmentName, String category, String openYn, Integer capacity) {
		this.departmentNo = departmentNo;
		this.departmentName = departmentName;
		this.category = category;
		this.openYn = openYn;
		this.capacity = capacity;
	}
	@Override
	public String toString() {
		return "DepartmentDto [departmentNo=" + departmentNo + ", departmentName=" + departmentName + ", category="
				+ category + ", openYn=" + openYn + ", capacity=" + capacity + "]";
	}
	public String getDepartmentNo() {
		return departmentNo;
	}
	public void setDepartmentNo(String departmentNo) {
		this.departmentNo = departmentNo;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getOpenYn() {
		return openYn;
	}
	public void setOpenYn(String openYn) {
		this.openYn = openYn;
	}
	public Integer getCapacity() {
		return capacity;
	}
	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}
	
	
}
