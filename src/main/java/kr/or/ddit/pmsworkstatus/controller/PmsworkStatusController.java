package kr.or.ddit.pmsworkstatus.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.pmsworkstatus.service.WorkTimeService;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.WorkDateVO;

@Controller
@RequestMapping("/pmsworkstatus")
public class PmsworkStatusController {

	@Autowired
		private WorkTimeService timeservice;


	@GetMapping("workstatus.do")
	public String pmsworkstatus() {
		return "tiles:pmsworkstatus/workstatus";
	}


	@PostMapping("/attendance")
	@ResponseBody
	public ResponseEntity<?> recordAttendance(@RequestBody Map<String, String> request, HttpSession session ){
		String type = request.get("type");
		 String empId = getLoggedInEmpId(session);

		 if (empId == null) {
	            return ResponseEntity.badRequest().body("로그인 정보를 찾을 수 없습니다.");
	        }

		LocalDateTime now = LocalDateTime.now();
		WorkDateVO workdatevo = new WorkDateVO();
		workdatevo.setEmpId(empId);
		workdatevo.setWorkDate(now.toLocalDate());

		boolean success = false;
		if("checkIn".equals(type)) {
			workdatevo.setWorkStart(now);
			workdatevo.setWorkStatus("출근");
			success = timeservice.recordCheckIn(workdatevo);
		}else if("checkOut".equals(type)) {
			workdatevo.setWorkEnd(now);
			workdatevo.setWorkStatus("퇴근");
			success = timeservice.recordCheckOut(workdatevo);
		}else {
			return ResponseEntity.badRequest().body("잘못된 출석 값 ");
		}
		return ResponseEntity.ok().body(Collections.singletonMap("success", success));
	}


	@GetMapping("/worktime")
	@ResponseBody
	public ResponseEntity<List<WorkDateVO>> getWorkSchedule( @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate workStart,
															@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate workEnd, HttpSession session) {
		String empId = getLoggedInEmpId(session);
		  if (empId == null) {
	            return ResponseEntity.badRequest().body(null);
	        }
		 List<WorkDateVO> workSchedule = timeservice.getWorkSchedule(empId, workStart, workEnd);
		return ResponseEntity.ok(workSchedule);
	}


	private String getLoggedInEmpId(HttpSession session) {
		 EmpVO emp = (EmpVO) session.getAttribute("empvo");
	     return emp != null ? emp.getEmpId() : null;
	}





}
