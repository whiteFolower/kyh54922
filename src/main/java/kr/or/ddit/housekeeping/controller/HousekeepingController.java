package kr.or.ddit.housekeeping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.housekeeping.service.HousekeepingService;
import kr.or.ddit.vo.HousekeepingVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/housekeeping")
public class HousekeepingController {

	@Autowired
	private HousekeepingService service;

	@GetMapping("/keepingList.do")
	public String list(@RequestParam(required = false ,defaultValue = "1") int page
							, @ModelAttribute("condition") SimpleCondition simpleCondition
							, Model model) {

		PaginationInfo paging = new PaginationInfo(20, 5);
		paging.setPage(page); //페이지 셋팅
		paging.setSimpleCondition(simpleCondition); //검색조건 셋팅

		List<HousekeepingVO> keepingList = service.readKeepingList(paging);
		model.addAttribute("keepingList", keepingList);

		DefaultPaginationRenderer rederer = new DefaultPaginationRenderer();
		String pagingHTML = rederer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:housekeeping/keepingList";

	}

	@GetMapping("/keepingDetail.do")
	@ResponseBody   // JSON으로 쓰려면 필요한 부분
	public HousekeepingVO detail(@RequestParam("what") String hkpNo) {
		HousekeepingVO keeping = service.readKeeping(Integer.parseInt(hkpNo));
		return keeping;
	}


	@GetMapping
	public String formUI() {
		return "tiles:housekeeping/keepingList";
	}

	@PostMapping("/keepingUpdate.do")
	@ResponseBody
	public String keepingUpdate (@ModelAttribute("keeping") HousekeepingVO keeping
			, Errors errors
			, RedirectAttributes redirectAttributes) {

		List<ObjectError> errorList = errors.getAllErrors();
		for (ObjectError objectError : errorList) {
			log.info("formDataProcess errors : {}", objectError.getCode() );
			log.info("formDataProcess errors : {}", objectError.getObjectName());
			log.info("formDataProcess errors : {}", objectError.getDefaultMessage());
		}

		String lvn = "";

		if(errors.hasErrors()) {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, errors);
			lvn = "redirect:/housekeeping/keepingUpdate.do?what="+keeping.getHkpNo();
		}else {
			service.modifyKeeping(keeping);
			lvn = "redirect:/housekeeping/keepingList.do";
		}
		return lvn;

	}

}
