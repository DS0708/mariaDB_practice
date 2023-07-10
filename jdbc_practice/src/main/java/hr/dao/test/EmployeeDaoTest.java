package hr.dao.test;

import java.util.List;

import hr.dao.EmployeeDao;
import hr.vo.EmployeeVo;

public class EmployeeDaoTest {		//test코드 만들면서 설계한다는 생각 .

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//findByNameTest("mahe");
		testFindBySalary(100000,200000);
	}
	
	private static void testFindBySalary(int min, int max) {
		List<EmployeeVo> list =  new EmployeeDao().findBySalary(min,max);
		
		for(EmployeeVo vo : list) {
			System.out.println(vo);
		}
	}

	public static void findByNameTest(String keyword) {						//여기서 메소드 이름이 결정된다.
		List<EmployeeVo> list = new EmployeeDao().findByName(keyword);				//class name이 결정 
		//junit 이라는 테스트를 할 수 있는 것을 사용하는게 좋다 ? 
		
		//일단 그냥 테스트 
		for(EmployeeVo vo : list) {
			System.out.println(vo);
		}
	}
	
}
