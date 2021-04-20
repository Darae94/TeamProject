package member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cate.model.Cate;
import cate.model.CateDao;
import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberRegisterController {
	
	private final String command = "/registerForm.me";
	private final String getPage = "memberRegisterForm";
	private final String gotoPage = "redirect:/loginForm.me";
	
	@Autowired
	private CateDao cdao;
	
	@Autowired
	private MemberDao memberDao;

	@Autowired
	private CateDao cateDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(Model model, HttpSession session) {
		List<Cate> list = cdao.ListCate();
		model.addAttribute("list", list);
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("member") @Valid Member member, BindingResult result, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			System.out.println("유효성 검사 오류");
			List<Cate> list = cateDao.ListCate();
			mav.addObject("list", list);
			System.out.println("getPage로");
			mav.setViewName(getPage);
			return mav;
		}
		System.out.println("member => "+member.getCat());
		int cnt = memberDao.insertMember(member);
		mav.setViewName(gotoPage);
		return mav;
	}
}
