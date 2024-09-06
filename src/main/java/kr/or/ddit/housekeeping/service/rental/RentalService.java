package kr.or.ddit.housekeeping.service.rental;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.RentalVO;
import kr.or.ddit.vo.def.RentalprodVO;


public interface RentalService {

	/**
	 *  리스트
	 * @return
	 */
	public List<RentalVO> readRentalList(PaginationInfo paging);

	/**
	 * 대여물품 상세조회
	 * @param hkbNo
	 * @return
	 */
	public RentalVO readRental(int hkrNo);

	/**
	 * 대여물품 추가 등록
	 * @param rental
	 */
	public void createRental(RentalVO rental);


	/**
	 * 대여물품 정보 수정
	 * @param rental
	 */
	public void modifyRental(RentalVO rental);

}
