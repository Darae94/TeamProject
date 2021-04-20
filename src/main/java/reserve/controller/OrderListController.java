package reserve.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.Member;
import order.model.Order;
import order.model.OrderDao;
import utility.Paging;

@Controller
public class OrderListController {

	private final String command = "/order.re";
	private final String getPage = "orderList";
	
	@Autowired
	OrderDao orderDao;
	
	@RequestMapping(command)
	public String doAction(
				HttpSession session,
				HttpServletRequest request,
				@RequestParam(value="pageSize",required = false)String pageSize,
				@RequestParam(value="pageNumber",required = false)String pageNumber
			) {
		Member loginInfo = (Member) session.getAttribute("loginInfo");
		if(loginInfo == null) {
			session.setAttribute("destination", "redirect:"+command);
			return "redirect:/loginForm.me";
		} else {
			List<Order> lists = new ArrayList<Order>();
			String mid = loginInfo.getId();
			//System.out.println("로그인 회원아이디 => "+mid);
			Map<String, String> map = new HashMap<String, String>();
			map.put("mid", mid);
			
			int totalCount = orderDao.totalCount(map);
			String url = request.getContextPath()+command;
			Paging pageInfo = new Paging(pageNumber,pageSize,totalCount,url);
			
			lists = orderDao.getAllData(map, pageInfo);
			System.out.println(lists.size());
			session.setAttribute("olists", lists);
			session.setAttribute("pageInfo", pageInfo);

			return getPage;
		}
	}
}
