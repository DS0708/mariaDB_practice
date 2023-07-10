package bookshop.main;

import java.util.List;
import java.util.Scanner;

import bookshop.dao.BookDao;
import bookshop.vo.BookVo;

public class BookShop {
	private static int books_num ;

	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		System.out.print("대여 하고 싶은 책의 번호를 입력하세요:");
		int num = scanner.nextInt();
		scanner.close();
		
		BookVo vo = new BookVo();
		vo.setNo(null);
		vo.setRent("y");
		
		System.out.println("*****도서 정보 출력하기******");
		displayBookInfo();
	}

	private static void displayBookInfo() {
		// TODO Auto-generated method stub
		List<BookVo> list = new BookDao().findAll();
		
		for(BookVo i : list) {
			System.out.println(i);
		}
	}
}