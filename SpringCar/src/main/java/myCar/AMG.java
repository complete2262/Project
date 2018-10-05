package myCar;

public class AMG implements Car{
	private String name;
	private String color;
	private int zeroBack;
	private Handle amgHandle;

	//�����ڷ� value�� �����ϸ� constructor-arg value�� �� ����. type���� ��Ʈ�� index�� ���� ��������
	public AMG(String name, String color, int zeroBack,Handle amgHandle) {
		this.name = name;
		this.color = color;
		this.zeroBack = zeroBack;
		this.amgHandle = amgHandle;
	}

	public void startCar() {
		System.out.println("name =>" + name);
		System.out.println("color =>" + color);
		System.out.println("zeroBack =>" + zeroBack);
		amgHandle.getHandle();
	}

	public void stopCar() {
		System.out.println(name+"���̽�����");
	}
	
}