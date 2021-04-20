package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberInfoController {
	private final String command = "/info.me";
	private final String getPage = "memberInfo";

	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(command)
	public String doAction(HttpSession session, Model model) {
		if(session.getAttribute("loginInfo") == null) {
			session.setAttribute("destination", "redirect:"+command);
			return "redirect:/loginForm.me";
		} else {
			Member member = memberDao.getData((String)session.getAttribute("loginId"));
			model.addAttribute("member", member);
			return getPage;
		}
	}
}
