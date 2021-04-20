package exhibition.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cate.model.Cate;
import cate.model.CateDao;
import exhibition.model.Exhibition;
import exhibition.model.ExhibitionDao;

@Controller
public class ExhibitInputController {
	
	@Autowired
	private CateDao cdao;
	
	@Autowired
	private ExhibitionDao edao;
	
	@Autowired
	ServletContext servletContext;
	
	private final String command = "/exhibitInput.ex";
	private final String gotoPage = "exhibitInputForm";
	private final String viewPage = "redirect:/exhibitList.ex";
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doActionGET(Model model) {
		
		List<Cate> list = cdao.ListCate();
		model.addAttribute("list", list);
		return gotoPage;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView doActionPOST(@Valid Exhibition exhibition, BindingResult result) {

		//System.out.println("servletContext:" + servletContext);
		//System.out.println("/:"+servletContext.getRealPath("/"));
		System.out.println("/resources:"+servletContext.getRealPath("/resources"));
		
		String img = exhibition.getImg();
		
		String uploadPath = servletContext.getRealPath("/resources");
		
		System.out.println("ExhibitInputController img: " + img);
		
		ModelAndView mav = new ModelAndView();
		
		MultipartFile multi = exhibition.getUpload();
		
		if(result.hasErrors()) {
			System.out.println("유효성 검사 오류");
			List<Cate> list = cdao.ListCate();
			mav.addObject("list", list);
			mav.setViewName(gotoPage);
			return mav;
		}else {
			int count = edao.InsertExhibit(exhibition);
			if(count == 1) {
				
				File f = new File(uploadPath+"\\"+img);
				try {
					multi.transferTo(f);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				mav.setViewName(viewPage);
			} else {
				mav.setViewName(gotoPage);
			}
			
		}
		
		return mav;
		
	}
	
}
