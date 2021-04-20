package reserve.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import exhibition.model.Exhibition;
import exhibition.model.ExhibitionDao;
import order.model.CartList;
import orderdetail.model.OrderDetail;

@Controller
public class CartAddContoller { // 상품 보기에서 결재 or 장바구니 클릭시 이동

	private final String command = "/add.re"; // 장바구니 추가
	private final String getPage = "reserveForm";
	private final String gotoPage = "redirect:/cart.re";
	
	@Autowired
	ExhibitionDao edao; // 상품 정보 가져오기
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(HttpSession session, @RequestParam("num") int num, HttpServletRequest request) {
		if(session.getAttribute("loginInfo") == null) {
			session.setAttribute("destination", "redirect:/userExhibitDetail.ex?num="+num);
			return "redirect:/loginForm.me";
		} else {
			Exhibition exhi = edao.DetailExhibition(num);
			request.setAttribute("exhi", exhi);
			return getPage;
		}
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doAction(HttpSession session,
				OrderDetail od,
				HttpServletRequest request
			){		
		if(session.getAttribute("loginInfo") == null) {
			session.setAttribute("destination", "redirect:/userExhibitDetail.ex?num="+od.getPnum());
			return "redirect:/loginForm.me";
		} else {
			//if(result.hasErrors()) { -> 오류가 남...
				//System.out.println("유효성 검사 오류");
				//System.out.println("num => "+od.getPnum());
				//return "redirect:/add.re?num="+od.getPnum();
			//}
			CartList cart = (CartList) session.getAttribute("cart"); // 저장되어 있는 장바구니 호출
			if(cart == null) { // 장바구니에 저장한게 없음
				cart = new CartList();
			}
			//System.out.println(od.getOday()+"/"+od.getOqty()+"/"+od.getOtime());
			// 1/2021-1-1/11
			String pInfo = od.getPnum() + "/" + od.getOday() + "/" + od.getOtime();
			cart.addOrder(pInfo, od.getOqty());
			session.setAttribute("cart", cart); // 장바구니에 저장
			return gotoPage;
		}
	}
	
}
