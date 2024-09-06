package kr.or.ddit.housekeeping.service.rental;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.housekeeping.dao.RentalMapper;
import kr.or.ddit.vo.RentalVO;
import kr.or.ddit.vo.def.RentalprodVO;
import lombok.RequiredArgsConstructor;

@Service
public class RentalServiceImpl implements RentalService{

	@Autowired
	private RentalMapper mapper;

	@Override
	public void createRental(RentalVO rental) {
		mapper.insertRenal(rental);
		mapper.updaterentalprod(rental);
	}

	@Override
	public List<RentalVO> readRentalList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.RentalList(paging);
	}

	@Override
	public RentalVO readRental(int hkrNo) {
		return mapper.seletRental(hkrNo);
	}


	@Override
	public void modifyRental(RentalVO rental) {
		mapper.updateRental(rental);
	}





}
