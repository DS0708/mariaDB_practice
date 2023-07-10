package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SelectTest02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		list();
	}
	
	public static void list() {
		boolean result = false;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			//1. JDBC Driver Class Loading (Library Loading)
			Class.forName("org.mariadb.jdbc.Driver");	//이것은 변하지 않는다. driver마다 정해져있음.
			
			//2. Connection
			String url = "jdbc:mariadb://192.168.0.153:3306/webdb?charset=utf8";		//이것도 드라이버마다 정해져 있음.
			// mac에서는 옵션을 더 줘야할 수도 있다. 
			conn = DriverManager.getConnection(url,"webdb","webdb");		//id, password
			
			//3. Statement 생성 
			String sql = 
					"select no, name " +
					"from dept "+
					"order by no ";
			stmt = conn.prepareStatement(sql);
			
			//4. SQL 실행  주의 : ';'를 쓰면 안됨.
			 rs = stmt.executeQuery();	//select는 이게 다르다.
			
			// binding 할게 없음 . 
			 
			//5. 결과 처리 
			while(rs.next()) {
				Long no = rs.getLong(1);
				String name = rs.getString(2);
				
				System.out.println(no + ":" + name);
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("Failed Driver Loading");
		}catch (SQLException e) {
			System.out.println("Error"+e);
		} finally {
			//6. 자원 정리 
			try {
				if(rs!=null)	rs.close();
				if(conn!=null)	conn.close();
				if(stmt!=null)	stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
