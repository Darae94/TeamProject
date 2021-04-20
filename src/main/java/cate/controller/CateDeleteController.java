package cate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cate.model.CateDao;

@Controller
public class CateDeleteController {
	
	@Autowired
	private CateDao cdao;
	
	private final String command = "/cateDelete.ca";
	private final String gotoPage = "redirect:/cateList.ca";	
	
	@RequestMapping(command)
	public String doAction(@RequestParam(value="num")int num,
			@RequestParam(value="pageNumber")int pageNumber,Model model) {
		
		cdao.DeleteCate(num);
		model.addAttribute("pageNumber", pageNumber);
		return gotoPage;
	}
}
