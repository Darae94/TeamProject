package member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberIdCheckController {
	
	private final String command = "/idcheck.me";
	
	@Autowired
	MemberDao memberdao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public void doAction(Member member, HttpServletResponse response
					, HttpServletRequest request ) {
		
		String userid = request.getParameter("userid");
		
		System.out.println("userid:" + userid);
		boolean isCheck = memberdao.searchId(userid);
		String str = "";
		if(isCheck==true) {
			str = "NO";
			System.out.println(str);
			try {
				response.getWriter().print(str);
			} catch (IOException e) {
				
				e.printStackTrace();
			}

		}else {
			str = "YES";
			System.out.println(str);
			try {
				response.getWriter().print(str);
			} catch (IOException e) {
				
				e.printStackTrace();
			}

		}
	}
}
