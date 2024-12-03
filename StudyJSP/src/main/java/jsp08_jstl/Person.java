package jsp08_jstl;


class Student {
	
}

public class Person {
	//멤버변수 정의(외부에서 변수값을 변경 불가능하도록 접근제한자 private 사용)
	
	private int idx;
	private String name;
	
	public Person (int idx, String name) {
		this.idx=idx;
		this.name=name;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	

	
	
	// 멤버 변수에 직접 접근하는 대신 값을 주고 받을 수 있도록 Getter/Setter 메서드 정의
	// 알트 + 쉬프트+ 에스
	
	
}
