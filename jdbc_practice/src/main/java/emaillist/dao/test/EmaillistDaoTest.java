package emaillist.dao.test;

import java.util.List;

import emaillist.dao.EmaillistDao;
import emaillist.vo.EmaillistVo;

public class EmaillistDaoTest {

	public static void main(String[] args) {
		//testInsert();
//		testDelete(4l);
//		testFindAll();
//		testDelete(4l);
		Long e_count = testGetCount();
		System.out.println(e_count);
	}

	private static Long testGetCount() {
		// TODO Auto-generated method stub
		Long result =  -1l;
		result = new EmaillistDao().getCount();
		return result;
	}

	private static void testDelete(Long num) {
		boolean check = new EmaillistDao().delete(num);
		
		if(check) System.out.println("Delete Success!!");
	}

	private static void testInsert() {
		EmaillistVo vo = new EmaillistVo();
		vo.setFirstName("Shin");
		vo.setLastName("DongSeung");
		vo.setEmail("tlsehdtjd070@naver.com");
		boolean check = new EmaillistDao().insert(vo);
		
		if(check) System.out.println("Insert Successful");
	}

	private static void testFindAll() {
		// TODO Auto-generated method stub
		List<EmaillistVo> list  = new EmaillistDao().findAll();
		
		for(EmaillistVo vo : list) {
			System.out.println(vo);
		}
	}

}
