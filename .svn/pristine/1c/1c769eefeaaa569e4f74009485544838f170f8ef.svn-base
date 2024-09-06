package kr.or.ddit.housekeeping.service.lostitem;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.LostitemVO;

public interface LostitemService {

	/**
	 * 리스트 조회
	 * @param paging
	 * @return
	 */
	public List<LostitemVO> readLostitemList(PaginationInfo paging);

	/**
	 * 상세조회
	 * @param hksNo
	 * @return
	 */
	public LostitemVO readLostitem(int hksNo);

	/**
	 * 등록
	 * @param lostitem
	 */
	public void createLostitem(LostitemVO lostitem);

	/**
	 * 수정
	 * @param lostitem
	 */
	public void modifyLostitem(LostitemVO lostitem);

}
