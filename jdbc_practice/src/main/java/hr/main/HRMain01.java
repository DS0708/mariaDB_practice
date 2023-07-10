package hr.main;

import java.util.List;
import java.util.Scanner;

import hr.dao.EmployeeDao;
import hr.vo.EmployeeVo;

public class HRMain01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			Scanner scanner = new Scanner(System.in);
			
			while(true) {
				System.out.print("Input name >");
				String keyword = scanner.nextLine();
				
				if("quit".equals(keyword)) break;
				
				List<EmployeeVo> list = new EmployeeDao().findByName(keyword);	
				
				for(EmployeeVo vo : list) {
					System.out.println(vo.getNo() + ":" + vo.getFirstName() + ":"+ vo.getLastName() + ":" + vo.getHireDate());
				}
			}
			
			scanner.close();
	}

}
