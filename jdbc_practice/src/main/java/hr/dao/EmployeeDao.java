package hr.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hr.vo.EmployeeVo;

public class EmployeeDao {

	public List<EmployeeVo> findByName(String keyword) {
		List<EmployeeVo> result = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			//1. JDBC Driver Class Loading (Library Loading)
			Class.forName("org.mariadb.jdbc.Driver");	//이것은 변하지 않는다. driver마다 정해져있음.
			
			//2. Connection
			String url = "jdbc:mariadb://192.168.0.153:3306/employees?charset=utf8";		//이것도 드라이버마다 정해져 있음.
			// mac에서는 옵션을 더 줘야할 수도 있다. 
			conn = DriverManager.getConnection(url,"ds_employees","ds");		//id, password
			
			//3. Statement 생성 
			String sql = "select emp_no, first_name, last_name, date_format(hire_date,'%Y-%m-%d') "
					+ "	from employees\n"
					+ "where first_name like ? "
					+ "	or last_name like ? "
					+ "order by hire_date desc";
			stmt = conn.prepareStatement(sql);
			
			//4. SQL 실행 
			 	//select는 이게 다르다.
			
			//5. binding 
			 stmt.setString(1,"%"+keyword+"%");		//%까지 String 변수에 넣어 줘야한다고 생각해야한다.
			 stmt.setString(2,"%"+keyword+"%");
			 
			 rs = stmt.executeQuery();
			 
			//6. 결과 처리 
			while(rs.next()) {
				Long no = rs.getLong(1);
				String first_name = rs.getString(2);
				String last_name = rs.getString(3);
				String hire_date = rs.getString(4);
				
				EmployeeVo vo = new EmployeeVo();
				vo.setNo(no);
				vo.setFirstName(first_name);
				vo.setLastName(last_name);
				vo.setHireDate(hire_date);
				
				result.add(vo);
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("Failed Driver Loading");
		}catch (SQLException e) {
			System.out.println("Error"+e);
		} finally {
			//7. 자원 정리 
			try {
				if(rs!=null)	rs.close();
				if(conn!=null)	conn.close();
				if(stmt!=null)	stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return result;
	}

	public List<EmployeeVo> findBySalary(int min, int max) {
		// TODO Auto-generated method stub
		List<EmployeeVo> result = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			//1. JDBC Driver Class Loading (Library Loading)
			Class.forName("org.mariadb.jdbc.Driver");	//이것은 변하지 않는다. driver마다 정해져있음.
			
			//2. Connection
			String url = "jdbc:mariadb://192.168.0.153:3306/employees?charset=utf8";		//이것도 드라이버마다 정해져 있음.
			// mac에서는 옵션을 더 줘야할 수도 있다. 
			conn = DriverManager.getConnection(url,"ds_employees","ds");		//id, password
			
			//3. Statement 생성 
			String sql = "select a.emp_no, a.first_name, a.last_name, b.salary "
					+ "from employees a, salaries b "
					+ "where a.emp_no =  b.emp_no "
					+ "	and b.to_date > curdate() "
					+ "    and b.salary between ? and ? "
					+ "    order by b.salary "
					+ "    limit 0, 100;";
			stmt = conn.prepareStatement(sql);
			
			
			//5. binding 
			 stmt.setLong(1,min);	
			 stmt.setLong(2,max);
			 
			 rs = stmt.executeQuery();
			 
			//6. 결과 처리 
			while(rs.next()) {
				Long no = rs.getLong(1);
				String first_name = rs.getString(2);
				String last_name = rs.getString(3);
				Long salary = rs.getLong(4);
				
				EmployeeVo vo = new EmployeeVo();
				vo.setNo(no);
				vo.setFirstName(first_name);
				vo.setLastName(last_name);
				vo.setSalary(salary);
				
				result.add(vo);
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("Failed Driver Loading");
		}catch (SQLException e) {
			System.out.println("Error"+e);
		} finally {
			//7. 자원 정리 
			try {
				if(rs!=null)	rs.close();
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
