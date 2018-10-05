package myCar_Configuration;

public class M5 implements Car{
	private String name;
	private String color;
	private int zeroBack;
	private Handle m5Handle;
	
	
	public void setName(String name) {
		this.name = name;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public void setZeroBack(int zeroBack) {
		this.zeroBack = zeroBack;
	}
	public void setM5Handle(Handle m5Handle) {
		this.m5Handle = m5Handle;
	}
	public void startCar() {
		System.out.println("name =>" + name);
		System.out.println("color =>" + color);
		System.out.println("zeroBack =>" + zeroBack);
		m5Handle.getHandle();
	}
	public void stopCar() {

	}

}
