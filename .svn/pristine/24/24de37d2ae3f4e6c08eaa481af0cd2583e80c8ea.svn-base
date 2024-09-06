package kr.or.ddit.housekeeping.service.broken;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.BrokenRoomVO;



public interface BrokenroomService {

	/**
	 *  리스트
	 * @return
	 */
	public List<BrokenRoomVO> readBrokenList(PaginationInfo paging);

	/**
	 * 고장객실 상세조회
	 * @param hkbNo
	 * @return
	 */
	public BrokenRoomVO readBroken(int hkbNo);

	/**
	 * 고장객실 추가 등록
	 * @param broken
	 */
	public void createBroken(BrokenRoomVO broken);


	/**
	 * 고장객실정보 수정
	 * @param broken
	 */
	public void modifyBroken(BrokenRoomVO broken);

}
