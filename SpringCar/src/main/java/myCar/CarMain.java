package myCar;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CarMain {
public static void main(String[] args) {
	AbstractApplicationContext cc = new GenericXmlApplicationContext("myCar/applicationContext.xml");
	Car car1 = cc.getBean("M5GO",Car.class);
	car1.startCar(); car1.stopCar();
	Car car2 = cc.getBean("AMGGO",Car.class);
	car2.startCar(); car2.stopCar();
	
	
}
}
