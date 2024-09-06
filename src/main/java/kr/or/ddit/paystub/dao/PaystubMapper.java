package kr.or.ddit.paystub.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.PaystubVO;

@Mapper
public interface PaystubMapper {
	public int selectTotalRecord(PaginationInfo paging);

	public List<PaystubVO> selectPaystubList(PaginationInfo paging);
	public PaystubVO selectPaystub(String paystubId);
	public int insertPaystub(PaystubVO paystubId);

//	public int updatePaystub(PaystubVO paystubId);
//	public int deletePaystub(String paystubId);


	public PaystubVO selectPaystubListBasic();

	public int insertPaystubList(List<PaystubVO> paystubList);
}