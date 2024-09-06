package kr.or.ddit.empnotice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.EmpNoticeVO;

@Mapper
public interface EmpNoticeMapper {
	public int selectTotalRecord(PaginationInfo paging);
	
	public List<EmpNoticeVO> selectEmpNoticeList(PaginationInfo paging);
	public EmpNoticeVO selectEmpNotice(String empnotiNo);
	public int insertEmpNotice(EmpNoticeVO empNotice);
	public int updateEmpNotice(EmpNoticeVO empNotice);
	public int deleteEmpNotice(String empnotiNo);
}
