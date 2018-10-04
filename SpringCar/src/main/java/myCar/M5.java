package myCar;

public class M5 implements Car{
	private String name;
	private String color;
	private int zeroBack;
	private Handle m5Handle;
	
	public M5(String name, String color, int zeroBack, Handle m5Handle) {
		this.name = name;
		this.color = color;
		this.zeroBack = zeroBack;
		this.m5Handle = m5Handle;
	}
	public void startCar() {
		System.out.println("name =>" + name);
		System.out.println("color =>" + color);
		System.out.println("zeroBack =>" + zeroBack);
		m5Handle.getHandle();
	}
	public void stopCar() {
		System.out.println(name+"레이스종료");
	}

}
