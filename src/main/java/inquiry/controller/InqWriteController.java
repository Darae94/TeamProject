package inquiry.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
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
public class InqWriteController {

	@Autowired
	InquiryDao inqDao;
	
	@RequestMapping(value = "/inqwrite.inq", method = RequestMethod.GET)
	public String doAction(HttpSession session) {
		if(session.getAttribute("loginId")==null) {
			return "redirect:/loginForm.me";
		}
		return "inquiry_form";
	}
	
	@RequestMapping(value = "/inqwrite.inq", method = RequestMethod.POST)
	public String doAction(
							@ModelAttribute("inq") @Valid Inquiry inq, BindingResult result,
							@RequestParam("pwcheck") String pwcheck,
							HttpServletResponse response, HttpServletRequest request, HttpSession session,
							Model model) throws IOException {
		
		if(result.hasErrors()){
			model.addAttribute("inq", inq);
			return "inquiry_form";
		}
		
		//비밀번호 일치하지 않는 경우
		if(!inq.getPw().equals(pwcheck)) { 
			response.setContentType("text/html; charset=UTF-8");
		    PrintWriter out = response.getWriter();
		    out.println("<script>alert('비밀번호가 일치하지 않습니다.'); history.go(-1); document.getElementById(pwcheck).focus();</script>");
		    out.flush();
		    
		//일치하는 경우
		} else {
			
			//아이피 설정
			String ip = request.getRemoteAddr();
			inq.setIp(ip);
			
			//아이디와 연결 시키기
			String id = (String) session.getAttribute("loginId");
			inq.setId(id);
			
			inqDao.insertInquiry(inq);
		}
		return "redirect:/list.inq";
	}
}


