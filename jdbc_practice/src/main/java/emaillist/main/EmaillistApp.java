package emaillist.main;

import java.util.List;
import java.util.Scanner;

import emaillist.dao.EmaillistDao;
import emaillist.vo.EmaillistVo;

public class EmaillistApp {
	private static Scanner scan = new Scanner(System.in);
	private static Long email_count = 0l;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//init_emailCount();
		
		while(true) {
			System.out.println("(l)ist (d)elete (i)nsert (q)uit >");
			String command = scan.nextLine();
			
			//control code
			if("q".equals(command))	break;
			else if ("l".equals(command)) {
				doList(false);
			}else if ("d".equals(command)) {
				doDelete();
			}else if ("i".equals(command)) {
				doInsert();
			}else {
				System.out.println("올바른 값을 입력해주세요.");
			}
		}
		
		scan.close();
	}

	private static void init_emailCount() {
		email_count = new EmaillistDao().getCount();
		if(email_count==-1) {
			System.out.println("init email_count failed");
			System.exit(0);
		}
	}


	private static void doInsert() {
		// TODO Auto-generated method stub
		System.out.print("firstName :");
		String firstName = scan.nextLine();
		System.out.print("lastName :");
		String lastName = scan.nextLine();
		System.out.print("email :");
		String email = scan.nextLine();
		
		EmaillistVo vo = new EmaillistVo();
		vo.setFirstName(firstName);
		vo.setLastName(lastName);
		vo.setEmail(email);
		boolean check = new EmaillistDao().insert(vo);
		
		if(check) {
			System.out.println("Insert Success!!");
			//email_count++;
		}
		else System.out.println("Insert Failed");
	}

	private static void doDelete() {
		// TODO Auto-generated method stub
		doList(true);
		System.out.println("삭제할 이메일 리스트 번호 입력 :");
		
		Long no = Long.parseLong(scan.nextLine());
		
		//if(no>email_count) System.out.println("올바른 이메일리스트 번호 입력 요망.");
		
		boolean check = new EmaillistDao().delete(no);
			
		if(check) {
			System.out.println("Delete Success!!");
			//email_count--;
		}
		else System.out.println("일치하는 이메일 정보가 없습니다.");
		
	}

	private static void doList(boolean num) {
		// TODO Auto-generated method stub
		if(num) {
			List<EmaillistVo> list  = new EmaillistDao().findAll();
			
			for(EmaillistVo vo : list) {
				System.out.println(vo.getNo()+ ". " +vo.getFirstName()+" "+vo.getLastName()+" - " + vo.getEmail());
			}
		}else doList();
	}

	private static void doList() {
		// TODO Auto-generated method stub
		List<EmaillistVo> list  = new EmaillistDao().findAll();
		for(EmaillistVo vo : list) {
			System.out.println(vo.getFirstName()+" "+vo.getLastName()+" - " + vo.getEmail());
		}
	}
	
	
	
	

}
