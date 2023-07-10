package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.mariadb.jdbc.Statement;

public class InsertTest02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		insert("운영1");
		insert("운영2");
	}
	
	private static boolean insert(String deptName) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			//1. JDBC Driver Class Loading (Library Loading)
			Class.forName("org.mariadb.jdbc.Driver");	//이것은 변하지 않는다. driver마다 정해져있음.
			
			//2. Connection
			String url = "jdbc:mariadb://192.168.0.153:3306/webdb?charset=utf8";		//이것도 드라이버마다 정해져 있음.
			// mac에서는 옵션을 더 줘야할 수도 있다. 
			conn = DriverManager.getConnection(url,"webdb","webdb");
			
			//3. Statement Ready
			String sql = "insert into dept values (null,?)";
			pstmt = conn.prepareStatement(sql);
			
			//4. Binding
			pstmt.setString(1, deptName);	
			
			//5. Execute binding pstmt
			int count = pstmt.executeUpdate();
			
			
			//6. 결과 처리 
			//if(count==1) result=true;
			result = count ==1;
			
		} catch (ClassNotFoundException e) {
			System.out.println("Failed Driver Loading");
		}catch (SQLException e) {
			System.out.println("Error"+e);
		} finally {
			//7. 자원 정리 
			try {
				if(conn!=null)	conn.close();
				if(pstmt!=null)	pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}

}
