package reserve.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import orderdetail.model.OrderDetail;
import orderdetail.model.OrderDetailDao;

@Controller
public class ReserveCheckController {

	private final String command = "/check.re";
	
	@Autowired
	OrderDetailDao oddao;
	
	@RequestMapping(command)
	public void doAction(OrderDetail order, HttpServletResponse response) {
		//System.out.println("check: "+order.getPnum()+"/"+order.getOday()+"/"+order.getOtime());
		int count = oddao.getOqtySum(order); // 해당 상품, 선택 날짜, 선택 시간
		int reserveCount = 30 - count;
		//System.out.println("check: "+count+"=>"+result);
		try {
			response.getWriter().print(reserveCount);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
