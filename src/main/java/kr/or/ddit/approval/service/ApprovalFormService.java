package kr.or.ddit.approval.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.ApprovalFormVO;
import kr.or.ddit.vo.AttencanceVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PmsApprovalVO;

public interface ApprovalFormService {

	public List<ApprovalFormVO> retrieveApprovalformList();

	public String getFileNameForTitle(String title);

	// 보관함 리스트
	public List<PmsApprovalVO> pmsapprovalboxList(PaginationInfo paging);

	public List<PmsApprovalVO> selectCompletedApprovals(PaginationInfo paging);

	public List<PmsApprovalVO> selectreturnApprovals(PaginationInfo paging);


	public AttencanceVO retrieveAttencanceByEmpId(String empId);


	/**
	 * annualupdate
	 * @param pmsapprovalvo
	 */
	public void annualcreate(PmsApprovalVO pmsapproval);


}
