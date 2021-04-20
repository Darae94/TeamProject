package notice.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import notice.model.Notice;
import notice.model.NoticeDao;

@Controller
public class WriteController {
	
	@Autowired
	NoticeDao noticeDao;
	
	@RequestMapping(value = "/write.nt", method = RequestMethod.GET)
	public String doAction() {
		return "writeform";
	}
	
	@RequestMapping(value = "/write.nt", method = RequestMethod.POST)
	public String doAction(	@ModelAttribute("notice") @Valid Notice notice, 
							BindingResult result, 
							Model model) {
		
		if(result.hasErrors()) {
			model.addAttribute("notice", notice);
			return "writeform";
		}
		noticeDao.insertNotice(notice);
		return "redirect:/list.nt";
	}
}