package exhibition.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import exhibition.model.Exhibition;
import exhibition.model.ExhibitionDao;

@Controller
public class ExhibitUserSearchController {
	
	@Autowired
	private ExhibitionDao edao;
	
	private final String command = "/userSearchCate.ex";
	private final String gotoPage = "userSearchList";
	
	@RequestMapping(command)
	public String doAction(@RequestParam(value="category")String category,Model model) {
		
		List<Exhibition> slist = edao.SearchCategory(category);
		List<Exhibition> list = edao.ListExhibition();
		model.addAttribute("slist", slist);
		model.addAttribute("list", list);
		return gotoPage;
	}
	
}
