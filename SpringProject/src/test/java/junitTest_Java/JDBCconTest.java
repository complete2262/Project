package junitTest_Java;

import java.sql.DriverManager;

import org.junit.Test;

public class JDBCconTest {
	
	@Test
	public void dbConnect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@mydbinstance.cdm7oruelo16.ap-northeast-2.rds.amazonaws.com:1521:ORCL";
			System.out.println("JDBC 연결성공");
			DriverManager.getConnection(url, "complete2262", "pdictionary");
		} catch (Exception e) {
			System.out.println("JDBC 연결실패 =>"+e);
		}
	}//dbConnect
	
}
