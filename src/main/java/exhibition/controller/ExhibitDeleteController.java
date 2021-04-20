package exhibition.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import exhibition.model.Exhibition;
import exhibition.model.ExhibitionDao;

@Controller
public class ExhibitDeleteController {
	
	@Autowired
	private ExhibitionDao edao;
	
	@Autowired
	ServletContext servletContext;
	
	private final String command = "/exhibitDelete.ex";
	private final String gotoPage = "redirect:/exhibitList.ex";
	
	@RequestMapping(command)
	public String doAction(@RequestParam(value="num")int num,
			@RequestParam(value="pageNumber")int pageNumber,Model model) {
	
		Exhibition exhibition = edao.DetailExhibition(num);
		String dbimg = exhibition.getImg();
		
		String uploadPath = servletContext.getRealPath("/resources");
		File dir = new File(uploadPath);
		File delFile = new File(dir, dbimg);
		delFile.delete();
		
		edao.DeleteExhibition(num);
		model.addAttribute("pageNumber", pageNumber);
		return gotoPage;
	}
	
}
