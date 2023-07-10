package bookshop.dao.test;

import bookshop.dao.AuthorDao;
import bookshop.vo.AuthorVo;

public class AuthorDaoTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AuthorDao dao = new AuthorDao();
		AuthorVo vo = new AuthorVo();
		
//		vo.setName("스테파니메이어");
//		dao.insert(vo);
		
		vo.setName("조정래");
		dao.insert(vo);
		vo.setName("김동인");
		dao.insert(vo);
		vo.setName("김난도");
		dao.insert(vo);
		vo.setName("천상병");
		dao.insert(vo);
		vo.setName("원수연");
		dao.insert(vo);
	}

}
