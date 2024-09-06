package kr.or.ddit.housekeeping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.HousekeepingVO;



@Mapper
public interface HousekeepingMapper {

    /**
     * 하우스키핑 추가
     * @param keeping
     * @return
     */
    public int insertHousekeeping(HousekeepingVO keeping);

	/**
	 * 하우스키핑 전체 리스트
	 * @return
	 */
	public List<HousekeepingVO> HousekeepingList(PaginationInfo paging);


	/**
	 * 하우스키핑 정보 상세 조회
	 * @param hksNo
	 * @return
	 */
	public HousekeepingVO seletHousekeeping(int hkpNo);

    /**
     * 하우스키핑 정보 수정
     * @param keeping
     * @return
     */
    public int updateHousekeeping(HousekeepingVO keeping);


	public int selectTotalRecord(PaginationInfo paging);

}