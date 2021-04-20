package inquiry.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import inquiry.model.InquiryDao;

@Controller
public class InqDeleteController {

	@Autowired
	InquiryDao inqDao;
	
	@RequestMapping(value = "/delete.inq")
	public String doAction(
							@RequestParam(value = "num") int num,
							@RequestParam(value = "ref") int ref,
							@RequestParam(value = "restep") int restep,
							@RequestParam(value = "pageNumber") int pageNumber,
							Model model, HttpServletResponse response
							) throws IOException {
		
		int count = inqDao.getRefCount(ref);
		
		if(count>1) { //답글달린 본문+답변 게시글 중
			if(restep==0) { // 본문 -> 삭제 할 수 없음
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('답변이 달린 게시글은 삭제할 수 없습니다.'); history.go(-2);</script>");
				out.flush();
			} else { // 답변 -> 삭제 가능 (관리자만)
				inqDao.deleteInq(num);
				model.addAttribute("pageNumber", pageNumber);	
			}
		} else { //답변이 달리지 않은 게시글
			inqDao.deleteInq(num);
			model.addAttribute("pageNumber", pageNumber);	
		} //if문
		
		return "redirect:/list.inq";
	}
}
