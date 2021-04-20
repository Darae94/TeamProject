package order.model;

import java.util.HashMap;
import java.util.Map;

public class CartList { // 장바구니

	private Map<String, Integer> cart = null; // 상품번호+날짜+시간, 주문 수량
	
	public CartList() {
		cart = new HashMap<String, Integer>();
	}
	
	public void addOrder(String pInfo, int oqty) {
		// 장바구니에 담겨있는 상품인지 확인
		if(cart.containsKey(pInfo)) {
			oqty += cart.get(pInfo);
		}
		cart.put(pInfo, oqty);
	}
	
	public Map<String, Integer> getAllOrderLists() {
		return cart;
	}
	
	public int deleteOrder(String pInfo) {
		cart.remove(pInfo);
		return cart.size();
	}
	
}
