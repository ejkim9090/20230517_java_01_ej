package kh.lclass.oop.sample;

// The type Student cannot subclass the final class Person
// class 예약어키워드 abstract는 해당 클래스 내에 abstract메소드가 0개 이상 있을 것이라는 것을 의미함.
public /* abstract */ class Student extends Person {
	private String name;  // 학생증용이름
//	private int age;
//	private char gender;
	private int score;
	private int grade;
	private final int maxCount=10;
	{
		
	}
	// 생성자에서 주로 하는 일은 초기값 설정
	public Student() {
		super(); // Person()
		System.out.println("반가워요");
		name = "홍길동";
		//super("홍길동", 22, '남'); // Person("김말똥", 22, '남')
	}

	public Student(String name, char gender, int age, int grade) {
		super(name, age, gender, 10);
		this.name = name;
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "Student [name=" + name + ", score=" + score + ", grade=" + grade 
				+ ", toString()=" + super.toString()
				+ "]";
	}

	@Override
	public String getName() {
		return this.name;
	}
	
	@Override   
	// Overriding 
	// 재정의 - 
	// 조건 : 
	// 상속한 클래스의  
	// 동일한 메소드명
	// 매개변수 자료형, 개수 동일  // The method getAge(int) of type Student must override or implement a supertype method
	// 리턴타입 동일  // The return type is incompatible with Person.getAge()
	// 단 접근제한자는 달라도 됨- 부모메소드의 접근제한자보다 넓은범위접근제한자를사용.  // Cannot reduce the visibility of the inherited method from Person
	public int getAge() {
		return super.getAge()+1;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getGrade() {
		return grade;
	}

	// 변수 선언
	// 메소드 정의  // 이 기능은 이런이런이런기능으로 되어있어...
	
	// 메소드 선언  // 이 기능이 있을거야. 있어야해.
	// The abstract method setGrade in type Student can only be defined by an abstract class
	public/* abstract */void setGrade(int grade){
		this.grade = grade;
	}

//	public void setName(String name) {
//		this.name = name;
//	}
	
}
















