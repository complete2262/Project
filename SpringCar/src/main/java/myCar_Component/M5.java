package myCar_Component;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("M5GO1")
public class M5 implements Car{
	private String name = "M5";
	private String color = "white";
	private int zeroBack = 4;
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
	
	@Autowired
	@Qualifier("dcut")
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
