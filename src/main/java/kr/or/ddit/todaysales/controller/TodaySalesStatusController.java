package kr.or.ddit.todaysales.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.todaysales.service.TodaySalesService;
import kr.or.ddit.vo.TodaySalesVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/todaySales/salesStatus.do")
public class TodaySalesStatusController {

	@Autowired
	private TodaySalesService service;

	@GetMapping
	public String salesRetrieveController(
			@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model) {

		PaginationInfo paging = new PaginationInfo(10,2);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);

		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String today = sdf.format(cal.getTime());

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

        List<TodaySalesVO> todaySalesList = service.showTodaySalesList(today);

        model.addAttribute("todaySalesList", todaySalesList);
		model.addAttribute("pagingHTML", pagingHTML);
		return "tiles:todaySales/salesStatus";
	}

	@PostMapping
	@ResponseBody
	public List<TodaySalesVO> changeToday(@RequestBody String today){
		List<TodaySalesVO> todaySalesList = service.showTodaySalesList(today);

		log.info("151515151515151 : {}", today);

		return todaySalesList;
	}

}
