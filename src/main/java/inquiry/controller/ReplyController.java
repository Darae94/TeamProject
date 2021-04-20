package inquiry.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import inquiry.model.Inquiry;
import inquiry.model.InquiryDao;

@Controller
public class ReplyController {
	
	@Autowired
	InquiryDao inqDao;
	
	@RequestMapping(value = "/reply.inq", method = RequestMethod.GET)
	public String doAction(
							@RequestParam(value = "num") int num,
							@RequestParam(value = "pageNumber") int pageNumber,
							Model model) {
		Inquiry inq = inqDao.getInqByNum(num);
		model.addAttribute("inq", inq);
		model.addAttribute("pageNumber", pageNumber);
		return "reply_form";
	}
	
	@RequestMapping(value = "/reply.inq", method = RequestMethod.POST)
	public String doAction(
							Inquiry inq, 
							@RequestParam(value = "pageNumber") int pageNumber, 
							HttpServletRequest request, Model model) {
		//아이피 설정
		String ip = request.getRemoteAddr();
		inq.setIp(ip);
		
		inqDao.insertReply(inq);
		model.addAttribute("pageNumber", pageNumber);
		return "redirect:/list.inq";
	}
}
