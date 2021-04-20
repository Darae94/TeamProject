package qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import notice.model.NoticeDao;
import qna.model.QnaDao;

@Controller
public class DeleteController {
	
	@Autowired
	QnaDao qnaDao;
	
	@RequestMapping(value = "/delete.qna")
	public String doAction(
							@RequestParam(value = "no", required = true) int no, 
							@RequestParam(value = "pageNumber", required = true) int pageNumber,
							Model model) {
		qnaDao.deleteQna(no);
		model.addAttribute("pageNumber", pageNumber);
		return "redirect:/list.qna";
	}
}
