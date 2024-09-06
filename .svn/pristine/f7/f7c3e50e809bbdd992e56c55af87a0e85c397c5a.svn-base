package kr.or.ddit.approval.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.approval.service.ApprovalFormService;
import kr.or.ddit.vo.AttencanceVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PmsApprovalVO;

@Controller
@RequestMapping("/approval")
public class ApprovalUpdateController {
    @Autowired
    private ApprovalFormService service;

//	@ModelAttribute("pmsapproval")
//	public PmsApprovalVO pmsapproval() {
//		return new PmsApprovalVO();
//	}



    @GetMapping("/annual.do")
    public String showAnnualForm(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        EmpVO empvo = (EmpVO)session.getAttribute("empvo");
        System.out.println("empvo"+empvo);
        AttencanceVO attvo = service.retrieveAttencanceByEmpId(empvo.getEmpId());
        empvo.setAttencance(attvo);

        model.addAttribute("empvo", empvo);
//        model.addAttribute("attvo", attvo);

        return "pms/approval/annual";
    }

    @PostMapping("/annual.do")
    public String updateAnnual(@ModelAttribute("empvo") EmpVO empvo,
                               Errors errors,
                               RedirectAttributes redirectAttributes) {
        if(errors.hasErrors()) {
            return "pms/approval/annual";
        } else {
            service.annualcreate(empvo.getPmsapproval());
            return "redirect:/approval/annual";
        }
	}
}
