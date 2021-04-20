package exhibition.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import exhibition.model.Exhibition;
import exhibition.model.ExhibitionDao;

@Controller
public class ExhibitUserDetailController {
	
	@Autowired
	private ExhibitionDao edao;
	
	private final String command = "/userExhibitDetail.ex";
	private final String gotoPage = "userExhibitDetail";
	
	@RequestMapping(command)
	public String doAction(@RequestParam(value="num")int num,Model model) {
		Exhibition exhibit = edao.DetailExhibition(num);
		model.addAttribute("exhibit", exhibit);
		
		return gotoPage;
	}
	
}
