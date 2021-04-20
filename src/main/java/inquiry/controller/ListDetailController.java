package inquiry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import inquiry.model.Inquiry;
import inquiry.model.InquiryDao;

@Controller
public class ListDetailController {
	
	@Autowired
	InquiryDao inqDao;
	
	@RequestMapping(value = "/listdetail.inq")
	public String doAction(
							@RequestParam(value = "num", required = true) int num, 
							@RequestParam(value = "pageNumber", required = true) int pageNumber,
							Model model) {
		inqDao.updateViewCnt(num);
		Inquiry inq = inqDao.getInqByNum(num);
		model.addAttribute("inq", inq);
		model.addAttribute("pageNumber", pageNumber);
		return "listdetail";
	}

}
