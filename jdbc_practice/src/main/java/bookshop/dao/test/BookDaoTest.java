package bookshop.dao.test;

import bookshop.dao.BookDao;
import bookshop.vo.BookVo;

public class BookDaoTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BookDao dao = new BookDao();
		BookVo vo = new BookVo();
		
		vo.setTitle("트와일라잇");
		vo.setAuthorNo(1l);
		dao.insert(vo);
		
		vo.setTitle("뉴문");
		vo.setAuthorNo(1l);
		dao.insert(vo);
		
		vo.setTitle("이클립스");
		vo.setAuthorNo(1l);
		dao.insert(vo);
		
		vo.setTitle("브레이킹던");
		vo.setAuthorNo(1l);
		dao.insert(vo);
		
		vo.setTitle("아리랑");
		vo.setAuthorNo(2l);
		dao.insert(vo);
		
		vo.setTitle("젊은그들");
		vo.setAuthorNo(3l);
		dao.insert(vo);
		
		vo.setTitle("아프니깐 청춘이다");
		vo.setAuthorNo(4l);
		dao.insert(vo);
		
		vo.setTitle("귀천");
		vo.setAuthorNo(5l);
		dao.insert(vo);
		
		vo.setTitle("태백산맥");
		vo.setAuthorNo(2l);
		dao.insert(vo);
		
		vo.setTitle("풀하우스");
		vo.setAuthorNo(6l);
		dao.insert(vo);
		
	}

}
