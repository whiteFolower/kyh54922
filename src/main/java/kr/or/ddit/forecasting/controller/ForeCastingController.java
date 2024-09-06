package kr.or.ddit.forecasting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/forecasting/forecasting.do")
public class ForeCastingController {

	@GetMapping
	public String foreCastingRetrieveController(Model model) {

		return "tiles:forecasting/forecasting";
	}

}
