package kr.or.ddit.totalrev.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.totalrev.service.totalRevService;
import kr.or.ddit.vo.PossibleRoomsVO;
import kr.or.ddit.vo.WorkInRevVO;
import kr.or.ddit.vo.def.RoomtypeDefaultVO;
import kr.or.ddit.vo.def.TotalRevDefaultVO;
import kr.or.ddit.workinrev.dao.WorkInRevMapper;

@Controller
@RequestMapping("/totalRev")
public class totalRevController {
	
	@Autowired
	WorkInRevMapper workMapper;
	
	@Autowired
	totalRevService service;
	
	 @PostMapping("/totalRevDate")
	    public ResponseEntity<Map<String, String>> handleDateRange(@RequestBody Map<String, String> dateRange) {
	        String startDay = dateRange.get("startDay");
	        String lastDay = dateRange.get("lastDay");
	        
	        WorkInRevVO workInRev = new WorkInRevVO();
	        
	        workInRev.setHtrevChkin(startDay);
	        workInRev.setHtrevChkout(lastDay);
	        
	        List<PossibleRoomsVO> possibleRoomsList =  workMapper.selectPossibleRooms(workInRev);
	        
	        String roomType1 = "N";
	        String roomType2 = "N";
	        String roomType3 = "N";
	        String roomType4 = "N";
	        String roomType5 = "N";
	        
	        for (PossibleRoomsVO possibleRoomsVO : possibleRoomsList) {
	            switch (possibleRoomsVO.getRoomtypeId()) {
	                case "1":
	                    roomType1 = "Y";
	                    break;
	                case "2":
	                    roomType2 = "Y";
	                    break;
	                case "3":
	                    roomType3 = "Y";
	                    break;
	                case "4":
	                    roomType4 = "Y";
	                    break;
	                case "5":
	                    roomType5 = "Y";
	                    break;
	            }
	        }
	        Map<String, String> response = new HashMap<>();
	        response.put("roomType1", roomType1);
	        response.put("roomType2", roomType2);
	        response.put("roomType3", roomType3);
	        response.put("roomType4", roomType4);
	        response.put("roomType5", roomType5);

	        return ResponseEntity.ok(response);
	    }
	 
	 @PostMapping("/totalRevPayment")
	 public String totalRevPayment (
			 @RequestParam("roomId") String roomNo
			 , @RequestParam("humanNo") String humanNo
			 , @RequestParam("startDay") String startDay
			 , @RequestParam("lastDay") String lastDay
			 ,Model model) {
		 //전달할 값 방타입, 날짜, 인원수
		 char roomChar = roomNo.charAt(roomNo.length()-1);
		 String roomStr = roomChar+"";
		 RoomtypeDefaultVO roomType = service.roomTypeData(roomStr);
		 LocalDate date = LocalDate.now();
		 
		 String dateString = "2024-08-02";

		         // 날짜 형식 지정
		         DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		         // 문자열을 LocalDate 객체로 변환
		         LocalDate localDate = LocalDate.parse(dateString, formatter);
		 
		 
		 model.addAttribute("roomType",roomType);
		 model.addAttribute("date",date);
		 model.addAttribute("humanNo",humanNo);
		 model.addAttribute("startDay",startDay);
		 model.addAttribute("lastDay",lastDay);
		 return "wiles:/introduce/payDetail";
	 }
	 
}
