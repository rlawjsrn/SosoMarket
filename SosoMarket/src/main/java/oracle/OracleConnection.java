package oracle;

import java.sql.*;

public class OracleConnection {
	
	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "sosomarket";
		String pw = "soso1234";
		Connection conn = null;
		
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2. db 연결
			conn = DriverManager.getConnection(url, id, pw);
			System.out.println("데이터베이스 연결 성공");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}