package kr.or.ddit.housekeeping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.RentalVO;


@Mapper
public interface RentalMapper {

	/**
	 * 대여물품 작성
	 * @param rental
	 * @return
	 */
	public int insertRenal (RentalVO rental);


	/**
	 * 대여물품 전체 조회
	 * @param paging
	 * @return
	 */
	public List<RentalVO> RentalList(PaginationInfo paging);


	/**
	 * 대여물품 상제조회
	 * @param hkrNo
	 * @return
	 */
	public RentalVO seletRental(int hkrNo);


	/**
	 * 대여물품 정보 수정
	 * @param rental
	 * @return
	 */
	public int updateRental(RentalVO rental);



	public int selectTotalRecord(PaginationInfo paging);

	public int updaterentalprod(RentalVO rental);


}
