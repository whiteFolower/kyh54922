package kr.or.ddit.housekeeping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.LostitemVO;

@Mapper
public interface LostitemMapper {

	/**
	 * 등록
	 * @param lostitem
	 * @return
	 */
	public int insertLostitem(LostitemVO lostitem);

	/**
	 * 리스트 조회
	 * @param paging
	 * @return
	 */
	public List<LostitemVO> lostitemList(PaginationInfo paging);

	/**
	 * 상세조회
	 * @param hksNo
	 * @return
	 */
	public LostitemVO selectLostitem(int hksNo);

	/**
	 * 업데이트
	 * @param lostitem
	 * @return
	 */
	public int updateLostitem(LostitemVO lostitem);

	/**
	 * 페이지 설정
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);

}
