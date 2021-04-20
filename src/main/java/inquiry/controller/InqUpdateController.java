package inquiry.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import inquiry.model.Inquiry;
import inquiry.model.InquiryDao;

@Controller
public class InqUpdateController {

	@Autowired
	InquiryDao inqDao;
	
	@RequestMapping(value = "/update.inq", method = RequestMethod.GET)
	public String doAction(
							@RequestParam(value = "num") int num,
							@RequestParam(value = "ref") int ref,
							@RequestParam(value = "restep") int restep,
							@RequestParam(value = "pageNumber") int pageNumber,
							Model model, HttpServletResponse response) throws IOException {
		
		int count = inqDao.getRefCount(ref);
		
		if(count>1) { //답글달린 모든 게시글 중
			if(restep==0) { //본문 -> 수정불가
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('답변이 달린 게시글은 수정할 수 없습니다.'); history.go(-2);</script>");
				out.flush();
			} else { // 답변 -> 수정가능 (관리자만)
				Inquiry inq = inqDao.getInqByNum(num);
				model.addAttribute("inq", inq);
				model.addAttribute("pageNumber", pageNumber);
				return "reply_update";
			}
		} else { //답글이 안달린 본문
			Inquiry inq = inqDao.getInqByNum(num);
			model.addAttribute("inq", inq);
			model.addAttribute("pageNumber", pageNumber);
		} //if문
		
		return "inquiry_update_form";
	}
	
	
	@RequestMapping(value = "/update.inq", method = RequestMethod.POST)
	public String doAction(
							@ModelAttribute("inq") @Valid Inquiry inq, BindingResult result,
							@RequestParam(value = "pwcheck", required = false) String pwcheck,
							@RequestParam(value = "pageNumber") int pageNumber,
							Model model, HttpServletResponse response, HttpSession session) throws IOException {
		
		if(result.hasErrors()){
			model.addAttribute("inq", inq);
			model.addAttribute("pwcheck", pwcheck);
			model.addAttribute("pageNumber", pageNumber);
			return "inquiry_update_form";
		}
		
		//관리자는 수정하는데 비밀번호 필요x
		if(!session.getAttribute("loginId").equals("penguin")) {
			//비밀번호 일치하지 않는 경우
			if(!inq.getPw().equals(pwcheck)) { 
				response.setContentType("text/html; charset=UTF-8");
			    PrintWriter out = response.getWriter();
			    out.println("<script>alert('비밀번호가 일치하지 않습니다.'); history.go(-1); document.getElementById(pwcheck).focus();</script>");
			    out.flush();
			//일치하는 경우
			} else {
				inqDao.updateInq(inq);
				model.addAttribute("num", inq.getNum());
				model.addAttribute("pageNumber", pageNumber);
			}
		} else {
			System.out.println("관리자");
			inqDao.updateInq(inq);
			model.addAttribute("num", inq.getNum());
			model.addAttribute("pageNumber", pageNumber);
		} //if문
		
		return "redirect:/listdetail.inq";
	}
}
