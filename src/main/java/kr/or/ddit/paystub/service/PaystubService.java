package kr.or.ddit.paystub.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.PaystubVO;

public interface PaystubService {
	public List<PaystubVO> retrievePaystubList(PaginationInfo paging);

	public PaystubVO retrievePaystub(String paystubId);

	public void createPaystub(PaystubVO paystubId);

//	public void modifyPaystub(PaystubVO paystubId);
//
//	public void removePaystub(String paystubId);

	public PaystubVO retrievePaystubListBasic();

	public void createPaystubList(List<PaystubVO> paystubList);

}
