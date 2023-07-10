package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateTest02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		update(1L,"개발1");
	}
	
	public static boolean update(Long deptNO, String deptName) {
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
			
			//3. Statement 생성 
			String sql = "update dept set name = ? where no = ?";
			pstmt = conn.prepareStatement(sql);
			
			//4. binding
			pstmt.setString(1, deptName);
			pstmt.setLong(2, deptNO);
			
			//5. SQL 실행  주의 : ';'를 쓰면 안됨.
			
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
