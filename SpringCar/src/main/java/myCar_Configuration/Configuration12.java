package myCar_Configuration;

import org.springframework.context.annotation.Bean;

public class Configuration12 {

	@Bean
	public Handle dcutHandle() {
		Dcut dcut = new Dcut();
		dcut.setName("D cut");
		return dcut;
	}
	@Bean
	public Handle ccutHandle() {
		Ccut ccut = new Ccut();
		ccut.setName("C cut");
		return ccut;
	}
	
	@Bean
	public Car M5GO() {
		M5 m5 = new M5();
		
		m5.setName("M5");
		m5.setColor("white12");
		m5.setZeroBack(4);
		m5.setM5Handle(dcutHandle());
			return m5;
	}
	
	@Bean
	public Car AMGGO() {
		AMG amg = new AMG("AMGGT","blue",5,ccutHandle());
		return amg;
	}
			
			
}
		

