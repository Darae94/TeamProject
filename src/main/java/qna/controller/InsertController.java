package qna.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import qna.model.Qna;
import qna.model.QnaDao;

@Controller
public class InsertController {
	
	@Autowired
	QnaDao qnaDao;
	
	@RequestMapping(value = "/insert.qna", method = RequestMethod.GET)
	public String doAction() {
		return "insertform";
	}
	
	@RequestMapping(value = "/insert.qna", method = RequestMethod.POST)
	public String doAction(@ModelAttribute("qna") @Valid Qna qna, BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			model.addAttribute("qna", qna);
			return "insertform";
		}
		qnaDao.insertQna(qna);
		return "redirect:/list.qna";
	}
}