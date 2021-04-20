package cate.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cate.model.Cate;
import cate.model.CateDao;

@Controller
public class CateInputController {
	
	@Autowired
	private CateDao cdao;
	
	private final String command = "/cateInput.ca";
	private final String gotoPage = "cateInputForm";
	private final String viewPage = "redirect:/cateList.ca";
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doActionGET() {
		return gotoPage;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView doAcationPOST(@Valid Cate cate, BindingResult result) {
		
		ModelAndView mav = new ModelAndView();
		
		if(result.hasErrors()) {
			System.out.println("유효성 검사 오류");
			mav.setViewName(gotoPage);
			return mav;
		}
		
		cdao.InsertCate(cate);
		mav.setViewName(viewPage);
		return mav;
	}
	
}
