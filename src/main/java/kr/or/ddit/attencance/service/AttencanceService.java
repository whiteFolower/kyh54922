package kr.or.ddit.attencance.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AttencanceVO;

public interface AttencanceService {

	public List<AttencanceVO> retrieveAttencanceList(PaginationInfo paging);

	public AttencanceVO retrieveAttencance(String atteId);

}
