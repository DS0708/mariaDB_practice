package bookshop.main;

import java.util.List;
import java.util.Scanner;

import bookshop.dao.BookDao;
import bookshop.vo.BookVo;

public class BookShop {
	private static Scanner scanner = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		
		while(true) {
			showBookInfo();
			System.out.print("\n대여 하고 싶은 책의 번호를 입력하세요(exit:0):");
			Long no = scanner.nextLong();
			
			if(no==0) break;
			
			BookRent(no);
			
		}
		
		scanner.close();
	}



	private static void BookRent(Long no) {
		// TODO Auto-generated method stub
		boolean is_n = new BookDao().rent(no);
		
		if(!is_n) {
			boolean check = new BookDao().update_rent(no);
			
			if(check) System.out.println("Update Complete!!");
			else System.out.println("Update failed");
		}
		else {
			System.out.println("이미 대여중입니다.");
		}
	}



	private static void showBookInfo() {
		// TODO Auto-generated method stub
		System.out.println("\t\t*****도서 정보 출력하기******");
		displayBookInfo();
	}

	private static void displayBookInfo() {
		// TODO Auto-generated method stub
		List<BookVo> list = new BookDao().findAll();
		
		for(BookVo i : list) {
			System.out.println(i.getNo() + ". Title : "+ i.getTitle() + ", Author : " + i.getAuthorName() + ", Rental :" 
		+ ( ( i.getRent().equals("n") ) ? "재고있음" : "대여중") );
		}
	}
}