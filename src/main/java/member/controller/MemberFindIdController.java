package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberFindIdController {
	
	private final String command = "/findId.me";
	private final String getPage = "findIdForm";
	private final String gotoPage = "memberLoginForm";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value = command, method= RequestMethod.GET)
	public String doAction() {
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(Member member,  
							HttpServletResponse response) throws IOException {
		
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		
		Member findId = memberDao.findId(member);
		
		//System.out.println("회원정보:" + findId);

		if(findId == null) { // 비회원
			System.out.println("아이디가 존재하지 않습니다.");
			pw.print("<script type='text/javascript'>");
			pw.print("alert('해당 아이디가 존재하지 않습니다.')");
			pw.print("</script>");
			pw.flush();
			return getPage;
		} 
		else { // 회원
			String msg = "회원 아이디는 "+findId.getId()+"입니다.";
			System.out.println("아이디~:" + findId.getId());
			pw.print("<script type='text/javascript'>");
			pw.print("alert('"+msg+"')");
			pw.print("</script>");
			pw.flush();
			return gotoPage;
		}		
		
	}
}