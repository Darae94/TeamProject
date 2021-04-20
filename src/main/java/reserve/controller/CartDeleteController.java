package reserve.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import order.model.CartList;

@Controller
public class CartDeleteController {

	private final String command = "/delete.re"; // 장바구니 삭제
	private final String getPage = "redirect:/cart.re"; // 장바구니 목록
	
	@RequestMapping(value = command)
	public String doAction(HttpSession session, @RequestParam("pname") String pInfo, @RequestParam("pnum") int pnum) {
		String[] info = pInfo.split(" ");
		String[] time = info[4].split(":");
		String pd = pnum + "/" + info[2] + "/" + time[0];
		CartList cart = (CartList) session.getAttribute("cart"); // 장바구니 호출
		int cnt = cart.deleteOrder(pd); // 해당 상품 삭제
		//System.out.println("cart => "+cnt);
		if(cnt == 0) {
			session.setAttribute("cart", null);
		}
		return getPage;
	}
	
}
