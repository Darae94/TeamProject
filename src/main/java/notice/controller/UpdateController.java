package notice.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import notice.model.Notice;
import notice.model.NoticeDao;

@Controller
public class UpdateController {

	@Autowired
	NoticeDao noticeDao;
	
	@RequestMapping(value = "/update.nt", method = RequestMethod.GET)
	public String doAction(
							@RequestParam(value = "no", required = true) int no,
							@RequestParam(value = "pageNumber", required = true) int pageNumber,
							Model model) {
		Notice notice = noticeDao.getNoticeByNo(no);
		model.addAttribute("notice", notice);
		model.addAttribute("pageNumber", pageNumber);
		return "updateform";
	}
	
	@RequestMapping(value = "/update.nt", method = RequestMethod.POST)
	public String doAction(
							@ModelAttribute("notice") @Valid Notice notice,
							@RequestParam(value = "pageNumber") int pageNumber,
							BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("notice", notice);
			return "updateform";
		}
		noticeDao.updateNotice(notice);
		model.addAttribute("no", notice.getNo());
		model.addAttribute("pageNumber", pageNumber);
		return "redirect:/listdetail.nt";
	}
}
