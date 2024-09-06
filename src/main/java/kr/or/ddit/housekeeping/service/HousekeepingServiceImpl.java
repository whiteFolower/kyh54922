package kr.or.ddit.housekeeping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.housekeeping.dao.HousekeepingMapper;
import kr.or.ddit.room.dao.RoomMapper;
import kr.or.ddit.room.service.RoomServiceImpl;
import kr.or.ddit.vo.HousekeepingVO;
import lombok.RequiredArgsConstructor;

@Service
public class HousekeepingServiceImpl implements HousekeepingService {

	@Autowired
	private RoomMapper roomMapper;
	
	@Autowired
	private HousekeepingMapper mapper;

	@Override
	public void createKeeping(HousekeepingVO keeping) {
		mapper.insertHousekeeping(keeping);
	}

	@Override
	public List<HousekeepingVO> readKeepingList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.HousekeepingList(paging);
	}

	@Override
	public HousekeepingVO readKeeping(int hkpNo) {
		return mapper.seletHousekeeping(hkpNo);
	}


	@Override
	public void modifyKeeping(HousekeepingVO keeping) {
		mapper.updateHousekeeping(keeping);

	}




}
