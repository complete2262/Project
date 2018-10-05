package myCar;

public class AMG implements Car{
	private String name;
	private String color;
	private int zeroBack;
	private Handle amgHandle;

	//생성자로 value값 설정하면 constructor-arg value로 값 설정. type으로 스트링 index로 순서 결정가능
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
		System.out.println(name+"레이스종료");
	}
	
}
