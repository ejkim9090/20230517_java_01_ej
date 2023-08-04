package kh.test.jdbckh.professor.model.vo;

public class Professor {
	private String professorNo;
	private String professorName;
	
	public Professor() {
	}
	public Professor(String professorNo, String professorName) {
		this.professorNo = professorNo;
		this.professorName = professorName;
	}
	@Override
	public String toString() {
		return "Professor [professorNo=" + professorNo + ", professorName=" + professorName + "]";
	}
	public String getProfessorNo() {
		return professorNo;
	}
	public void setProfessorNo(String professorNo) {
		this.professorNo = professorNo;
	}
	public String getProfessorName() {
		return professorName;
	}
	public void setProfessorName(String professorName) {
		this.professorName = professorName;
	}
	
}
