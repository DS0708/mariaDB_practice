package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DeleteTest01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		boolean result = delete(4L);
		System.out.println(result ? "Success!" : "Failed");
	}

	private static boolean delete(Long no) {
		boolean result = false;
		Connection conn = null;
		java.sql.Statement stmt = null;
		
		try {
			//1. JDBC Driver Class Loading (Library Loading)
			Class.forName("org.mariadb.jdbc.Driver");	//이것은 변하지 않는다. driver마다 정해져있음.
			
			//2. Connection
			String url = "jdbc:mariadb://192.168.0.153:3306/webdb?charset=utf8";		//이것도 드라이버마다 정해져 있음.
			// mac에서는 옵션을 더 줘야할 수도 있다. 
			conn = DriverManager.getConnection(url,"webdb","webdb");
			
			//3. Statement 생성 
			stmt = conn.createStatement();
			
			//4. SQL 실행  주의 : ';'를 쓰면 안됨.
			String sql = "delete " +
						"from dept " +
						"where no =" + no ;
			int count = stmt.executeUpdate(sql);
			
			//5. 결과 처리 
			//if(count==1) result=true;
			result = count ==1;
			
		} catch (ClassNotFoundException e) {
			System.out.println("Failed Driver Loading");
		}catch (SQLException e) {
			System.out.println("Error"+e);
		} finally {
			//6. 자원 정리 
			try {
				if(conn!=null)	conn.close();
				if(stmt!=null)	stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
	
	
	
}
