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
		System.out.println(name + "�ڵ� ����");
		System.out.println(plusSpeed+"��ŭ ���ǵ�����");
		
	}
}
