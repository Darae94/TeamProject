package cate.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cate.model.Cate;
import cate.model.CateDao;
import utility.Paging;

@Controller
public class CateListController {
	
	@Autowired
	private CateDao cdao;
	
	private final String command = "/cateList.ca";
	private final String gotoPage = "cateList";
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doActionGET(@RequestParam(value="whatColumn",required = false)String whatColumn,
			@RequestParam(value="keyword",required = false)String keyword,
			@RequestParam(value="pageNumber",required = false)String pageNumber,
			@RequestParam(value="pageSize",required = false)String pageSize,
			Model model, HttpServletRequest request) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = cdao.getCount(map);
		
		String url = request.getContextPath()+command;
		Paging pageInfo = new Paging(pageNumber,pageSize,totalCount,url,whatColumn,keyword);  
		
		List<Cate> list = cdao.SelectCate(map,pageInfo);
		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);
		return gotoPage;
	}
}
