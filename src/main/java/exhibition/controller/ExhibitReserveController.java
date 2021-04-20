package exhibition.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExhibitReserveController {
	private final String command = "/reserve.ex";
	private final String gotoPage = "exhibitReserve";
	
	@RequestMapping(command)
	public String doAction() {
		return gotoPage;
	}
}
