package kr.or.ddit.housekeeping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.BrokenRoomVO;


@Mapper
public interface BrokenroomMapper {


	/**
	 * 고장객실 등록
	 * @param broken
	 * @return
	 */
	public int insetBrokenRoom(BrokenRoomVO broken);

	/**
	 * 고장객실 전체 조회
	 * @param paging
	 * @return
	 */
	public List<BrokenRoomVO> selectBrokenList(PaginationInfo paging);


	/**
	 * 선택한 고장객실 정보 보기
	 * @param paging
	 * @returnBrokenRoomVO
	 */
	public BrokenRoomVO seletBrokenRoom(int hkbNo);


	/**
	 * 고장객실 정보 및 상태 변경
	 * @param broken
	 * @return
	 */
	public int updateBrokenroom(BrokenRoomVO broken);

	public int selectTotalRecord(PaginationInfo paging);

	public int updateStatus(BrokenRoomVO broken);

}
