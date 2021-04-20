package exhibition.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import exhibition.model.Exhibition;
import exhibition.model.ExhibitionDao;
import utility.Paging;

@Controller
public class ExhibitListController {
	
	@Autowired
	private ExhibitionDao edao;
	
	private final String command = "/exhibitList.ex";
	private final String gotoPage = "exhibitList";
	
	@RequestMapping(command)
	public String doAction(@RequestParam(value="whatColumn",required = false)String whatColumn,
			@RequestParam(value="keyword",required = false)String keyword,
			@RequestParam(value="pageSize",required = false)String pageSize,
			@RequestParam(value="pageNumber",required = false)String pageNumber,
			Model model,HttpServletRequest request) {
		
		Map<String,String> map = new HashMap<String,String>();  
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = edao.totalCount(map);
		
		String url = request.getContextPath()+command;
		Paging pageInfo = new Paging(pageNumber,pageSize,totalCount,url,whatColumn,keyword);
		
		List<Exhibition> list = edao.SelectExhibition(map,pageInfo);
		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);
		
		return gotoPage;
	}
}
