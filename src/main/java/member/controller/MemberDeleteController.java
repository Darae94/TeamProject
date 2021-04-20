package member.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberDeleteController {
	private final String command ="/delete.me";
	private final String gotoPage = "redirect:/list.me";

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(command)
	public String doAction(@RequestParam(value="id", required=true) String id,
			@RequestParam(value="pageNumber", required=true) int pageNumber,
			Model model) {
		
		Member member = memberDao.getData(id);
		
		int cnt = memberDao.deleteData(id);
		
		model.addAttribute("pageNumber", pageNumber);
		
		return gotoPage;
		
	}
	
	
}
