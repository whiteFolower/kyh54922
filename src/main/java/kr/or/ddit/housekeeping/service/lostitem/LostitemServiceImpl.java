package kr.or.ddit.housekeeping.service.lostitem;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.housekeeping.dao.LostitemMapper;
import kr.or.ddit.vo.LostitemVO;

@Service
public class LostitemServiceImpl implements LostitemService{

	@Autowired
	private LostitemMapper mapper;

	@Override
	public void createLostitem(LostitemVO lostitem) {
		mapper.insertLostitem(lostitem);
	}

	@Override
	public List<LostitemVO> readLostitemList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.lostitemList(paging);
	}

	@Override
	public LostitemVO readLostitem(int hksNo) {
		return mapper.selectLostitem(hksNo);
	}


	@Override
	public void modifyLostitem(LostitemVO lostitem) {
		mapper.updateLostitem(lostitem);

	}

}
