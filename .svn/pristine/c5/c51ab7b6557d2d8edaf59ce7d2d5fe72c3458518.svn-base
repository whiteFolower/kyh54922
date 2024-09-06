package kr.or.ddit.housekeeping.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.HousekeepingVO;




public interface HousekeepingService {

	/**
	 * 리스트
	 * @return
	 */
	public List<HousekeepingVO> readKeepingList(PaginationInfo paging);

	/**
	 * 하우스키핑 상세조회
	 * @param hkbNo
	 * @return
	 */
	public HousekeepingVO readKeeping(int hkpNo);

	/**
	 * 하우스키핑 추가 등록
	 * @param rental
	 */
	public void createKeeping(HousekeepingVO keeping);


	/**
	 * 하우스키핑 정보 수정
	 * @param rental
	 */
	public void modifyKeeping(HousekeepingVO keeping);


}
