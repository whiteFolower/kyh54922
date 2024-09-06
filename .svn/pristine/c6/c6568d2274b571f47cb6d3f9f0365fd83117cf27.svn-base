package kr.or.ddit.prod.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.lprod.dao.LprodMapper;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProdVO;

	@Controller
	@RequestMapping("/prod/prodInsert.do")
	public class ProdInsertController{
		@Autowired
		private ProdService service;
		@Autowired
		private LprodMapper lprodDAO;
		
		@ModelAttribute("lprodList")
		public List<LprodVO> addAttribute(HttpServletRequest req) {
			return lprodDAO.selectLprodList();
		}
		
		@ModelAttribute("prod")
		public ProdVO prod() {
			return new ProdVO();
		}
		
		@GetMapping
		public String formUI(){
			return "tiles:prod/prodInsert";
		}
		
		@PostMapping
		public String formDataProcess(
			@Validated(InsertGroup.class) @ModelAttribute("prod") ProdVO prod
			, Errors errors
		){
			String lvn = null;
			if(!errors.hasErrors()) {
				service.createProd(prod);
				lvn = "redirect:/prod/prodDetail.do?what="+prod.getProdId();
			}else {
				lvn = "tiles:prod/prodInsert";
			}
			return lvn;
		}
		
	}

