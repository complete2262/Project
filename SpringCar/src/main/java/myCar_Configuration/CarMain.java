package myCar_Configuration;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

public class CarMain {
public static void main(String[] args) {
	AnnotationConfigApplicationContext cc = new AnnotationConfigApplicationContext(Configuration12.class);
	Car car1 = cc.getBean("M5GO",Car.class);
	car1.startCar();
	
	
	//AMGGO �̸����� configuration���� �޼��� �ۼ�
	Car car2 = cc.getBean("AMGGO",Car.class);
	car2.startCar();
	
}
}
