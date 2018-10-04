package myCar_Component;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CarMain {
public static void main(String[] args) {
	AbstractApplicationContext cc = new GenericXmlApplicationContext("myCar_Component/applicationContext.xml");
	// car1은 component로 car2는 xml로
	Car car1 = cc.getBean("M5GO1",Car.class);
	car1.startCar();
	System.out.println("");
	Car car2 = cc.getBean("AMGGO1",Car.class);
	car2.startCar();
	
	
}
}
