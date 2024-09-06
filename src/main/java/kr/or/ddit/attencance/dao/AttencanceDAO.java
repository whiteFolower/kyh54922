package kr.or.ddit.attencance.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AttencanceVO;

@Mapper
public interface AttencanceDAO {

	public int selectTotalRecord(PaginationInfo paging);

	public List<AttencanceVO> selectAttencanceList(PaginationInfo paging);

	public AttencanceVO selectAttencance(String atteId);


}
