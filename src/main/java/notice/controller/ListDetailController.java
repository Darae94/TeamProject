package notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import notice.model.Notice;
import notice.model.NoticeDao;

@Controller
public class ListDetailController {

	@Autowired
	NoticeDao noticeDao;
	
	@RequestMapping(value = "/listdetail.nt")
	public String doAction(
							@RequestParam(value = "no", required = true) int no, 
							@RequestParam(value = "pageNumber", required = true) int pageNumber,
							Model model) {
		noticeDao.updateViewCnt(no);
		Notice notice = noticeDao.getNoticeByNo(no);
		model.addAttribute("notice", notice);
		model.addAttribute("pageNumber", pageNumber);
		return "listdetail";
	}
}