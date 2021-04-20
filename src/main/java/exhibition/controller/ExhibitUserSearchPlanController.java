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
public class ExhibitUserSearchPlanController {
	
	@Autowired
	private ExhibitionDao edao;
	
	private final String command = "/userSearchPlanCate.ex";
	private final String gotoPage = "userSearchPlanList";
	
	@RequestMapping(command)
	public String doAction(@RequestParam(value="month")int month,Model model) {
		
		//String st_month = Integer.toString(month);
		if(0<month && month<10) {
			String st_month = Integer.toString(month);	
			String result = "%/0"+st_month+"/%";
			System.out.println(result);
			List<Exhibition> mlist = edao.SelectMonth(result);
			System.out.println("mlist:"+mlist);
			model.addAttribute("mlist", mlist);
			model.addAttribute("month", month);
		}else {
			String st_month = Integer.toString(month);	
			String result = "%/"+st_month+"/%";
			System.out.println(result);
			List<Exhibition> mlist = edao.SelectMonth(result);
			System.out.println("mlist:"+mlist);
			model.addAttribute("mlist", mlist);
			model.addAttribute("month", month);
		}
	
		return gotoPage;
	}
	
}
