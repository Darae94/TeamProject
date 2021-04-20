package reserve.controller;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.Member;
import order.model.CartList;
import order.model.OrderDao;
import orderdetail.model.OrderDetail;
import orderdetail.model.OrderDetailDao;

@Controller
public class CartCalculatorController {

	private final String command = "/account.re";
	private final String gotoPage = "redirect:/order.re";
	
	@Autowired
	OrderDao odao; // 주문 추가
	
	@Autowired
	OrderDetailDao oddao; // 주문 상세 추가
	
	@RequestMapping(command)
	public String doAction(HttpSession session, HttpServletResponse response) {
		CartList cart = (CartList) session.getAttribute("cart"); // 장바구니 호출
		Map<String, Integer> mapCart = cart.getAllOrderLists();
		
		Set<String> keys = mapCart.keySet();
		
		Member mb = (Member) session.getAttribute("loginInfo");
		String mid = mb.getId(); // 회원 아이디
		//System.out.println("cart Cal => "+mid);
		odao.insertData(mid); // 주문 테이블(구매목록)에 등록
		
		int maxOnum = odao.getMaxOrderOnum(); // 젤 큰(마지막) 주문 번호
		//System.out.println("cart Cal 주문번호 => "+maxOnum);
		for(String key : keys) {
			String[] info = key.split("/");
			OrderDetail odetail = new OrderDetail(); // 주문 상세 테이블 정보 한출 처리
			odetail.setOnum(maxOnum); // 현재 등록하는 주문 번호
			odetail.setPnum(Integer.parseInt(info[0]));
			odetail.setOday(info[1]);
			odetail.setOtime(info[2]);
			odetail.setOqty(mapCart.get(key));
			//System.out.println("orderDetail : "+odetail);
			oddao.insertData(odetail); // 주문 상세 테이블 추가
		}
		
		session.setAttribute("cart", null); // 장바구니 비우기
		
		return gotoPage;
	}
	
}
