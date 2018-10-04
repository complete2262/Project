package myCar;

public class Dcut implements Handle{
	private String name;
	private int plusSpeed;
	
	public void setPlusSpeed(int plusSpeed) {
		
		this.plusSpeed = plusSpeed;
	}
	public void setName(String name) {
		this.name = name;
	}

	public void getHandle() {
		System.out.println(name + "핸들 장착");
		System.out.println(plusSpeed+"만큼 스피드증가");
		
	}
}
