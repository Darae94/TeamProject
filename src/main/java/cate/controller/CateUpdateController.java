package cate.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cate.model.Cate;
import cate.model.CateDao;

@Controller
public class CateUpdateController {
	
	@Autowired
	private CateDao cdao;
	
	private final String command = "/cateUpdate.ca";
	private final String gotoPage = "cateUpdateForm";
	private final String viewPage = "redirect:/cateList.ca";
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doActionGET(@RequestParam(value="num")int num, 
			@RequestParam(value="pageNumber")int pageNumber,
			Model model) {
		
		Cate cate = cdao.DetailCate(num);
		model.addAttribute("cate", cate);
		model.addAttribute("pageNumber", pageNumber);
		return gotoPage;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView doAcationPOST(@Valid Cate cate, BindingResult result,
			@RequestParam(value="pageNumber")int pageNumber) {
		
		ModelAndView mav = new ModelAndView();
		
		if(result.hasErrors()) {
			System.out.println("유효성 검사 오류");
			mav.addObject("pageNumber", pageNumber);
			mav.setViewName(gotoPage);
			return mav;
		}
		
		cdao.UpdateCate(cate);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName(viewPage);
		return mav;
		
	}
}
