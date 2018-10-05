package myCar_Component;

import org.springframework.stereotype.Component;

@Component("dcut")
public class Dcut implements Handle{
	private String name = "Dcut";
	private int plusSpeed = 5;
	
	public void setPlusSpeed(int plusSpeed) {
		this.plusSpeed = plusSpeed;
	}
	public void setName(String name) {
		this.name = name;
	}

	public void getHandle() {
		System.out.println(name + "วฺต้ ภๅย๘");
		
	}
}
