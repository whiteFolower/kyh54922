package kr.or.ddit.housekeeping.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.SmartValidator;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.housekeeping.service.broken.BrokenroomService;
import kr.or.ddit.vo.BrokenRoomVO;
import kr.or.ddit.vo.RoomVO;
import lombok.extern.slf4j.Slf4j;




@Slf4j
@Controller
@RequestMapping("/brokenroom")
public class BrokenroomController {

	@Autowired
	private BrokenroomService service;

	@GetMapping("/brokenList.do")
	public String list(@RequestParam(required = false ,defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model){
		PaginationInfo paging = new PaginationInfo(20, 5);
		paging.setPage(page); //페이지 셋팅
		paging.setSimpleCondition(simpleCondition); //검색조건 셋팅

		List<BrokenRoomVO> brokenList = service.readBrokenList(paging);
		model.addAttribute("brokenList", brokenList);

		DefaultPaginationRenderer rederer = new DefaultPaginationRenderer();
		String pagingHTML = rederer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:brokenroom/brokenList";

	}

	@GetMapping("/brokenroomDetail.do")
	@ResponseBody   // JSON으로 쓰려면 필요한 부분
	public BrokenRoomVO detail(@RequestParam("what") String hkbNo) {
		BrokenRoomVO broken = service.readBroken(Integer.parseInt(hkbNo));
		return broken;
	}


	@GetMapping
	public String formUI () {
		return "tiles:brokenroom/brokenList";
	}

	/**
	 * 고장객실 등록
	 * @param broken
	 * @param bindingResult
	 * @return
	 */
	@PostMapping("/brokenInsert.do")
	@ResponseBody
    public ResponseEntity<?> formDataProcess(
            @Valid @ModelAttribute("broken") BrokenRoomVO broken,
            BindingResult bindingResult) {

		// 검증 오류 처리
        if (bindingResult.hasErrors()) {
            // Validation errors, return error messages
            return ResponseEntity.badRequest().body(
                Collections.singletonMap("errorMessage", "Validation failed.")
            );
        }

        try {
            // 서비스 호출
            service.createBroken(broken);

            // 성공 메시지 반환
            return ResponseEntity.ok().body(
                Collections.singletonMap("successMessage", "Broken successfully created!")
            );
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(
                Collections.singletonMap("errorMessage", "Failed to create room.")
            );
        }
    }

	/**
	 * 고장객실 업데이트
	 * @param broken
	 * @param errors
	 * @param redirectAttributes
	 * @return
	 */
	@PostMapping("/brokenUpdate.do")
	public String updateBrokenroom(@ModelAttribute("broken")BrokenRoomVO broken
			, Errors errors
			, RedirectAttributes redirectAttributes ) {
		List<ObjectError> errorList = errors.getAllErrors();
		for (ObjectError objectError : errorList) {
			log.info("formDataProcess errors : {}", objectError.getCode() );
			log.info("formDataProcess errors : {}", objectError.getObjectName());
			log.info("formDataProcess errors : {}", objectError.getDefaultMessage());
		}

		String lvn ="";

		if(errors.hasErrors()) {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, errors);
			lvn="redirect:/brokenroom/brokenUpdate.do?what="+broken.getHkbNo();
		}else {
			service.modifyBroken(broken);
			lvn ="redirect:/brokenroom/brokenList.do";
		}

	return lvn;
	}

}
