package hr.main;

import java.util.List;
import java.util.Scanner;

import hr.dao.EmployeeDao;
import hr.vo.EmployeeVo;

public class HRMain02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("salary[min max]>");
		int minSalary = scanner.nextInt();
		int maxSalary = scanner.nextInt();
		
		System.out.println(minSalary + "~" + maxSalary);
		
		List<EmployeeVo> list = new EmployeeDao().findBySalary(minSalary,maxSalary);	
		
		for(EmployeeVo vo : list) {
			System.out.println(vo.getNo() + ":" + vo.getFirstName() + ":"+ vo.getLastName() + ":" + vo.getSalary());
		}
		
		scanner.close();
	}

}
