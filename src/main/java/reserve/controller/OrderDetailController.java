package reserve.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.Member;
import member.model.MemberDao;
import order.model.ShoppingInfo;
import orderdetail.model.OrderDetailDao;

@Controller
public class OrderDetailController {

	private final String command = "/detail.re";
	private final String getPage = "orderDetail";
	
	@Autowired
	MemberDao mdao;
	
	@Autowired
	OrderDetailDao oddao;
	
	@RequestMapping(command)
	public String doAction(@RequestParam("onum") String onum,
			@RequestParam("mid") String mid,
			HttpServletRequest request) {
		System.out.println(onum + "/" + mid );
		Member mb = mdao.getData(mid);
		
		List<ShoppingInfo> list = new ArrayList<ShoppingInfo>();
		list = oddao.getData(onum);
		
		request.setAttribute("list", list);
		request.setAttribute("mb", mb);
		request.setAttribute("onum", onum);
		
		return getPage;
	}
	
}
