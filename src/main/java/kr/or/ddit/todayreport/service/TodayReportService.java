package kr.or.ddit.todayreport.service;

import java.util.List;

import kr.or.ddit.vo.ExtraChargeSumVO;
import kr.or.ddit.vo.TodayReportPaymentVO;
import kr.or.ddit.vo.TodayReportRoomAndExtVO;
import kr.or.ddit.vo.TodayReportRoomVO;

public interface TodayReportService {

	/**
	 * 영업일보 중 객실 판매 현황(객실 판매액수만)을 보여주기 위한 서비스
	 * @param today
	 * @return TodayReportVO
	 */
	public TodayReportRoomVO showTodayReportRoom(String today);

	/**
	 * 영업일보 중 1. 객실 판매 현황(기타요금과 함께)을 보여주기 위한 서비스
	 * @param today
	 * @return TodayReportVO
	 */
	public TodayReportRoomAndExtVO showTodayReportRoomAndExt(String today);

	/**
	 * 영업일보 중 2. 일일객실 판매내역을 보여주기 위한 서비스
	 * @param today
	 * @return TodayReportVO
	 */
	public TodayReportPaymentVO showTodayReportTotalPay(String today);

	/**
	 * 영업일보 중 3. 추가요금 내역을 보여주기 위한 서비스
	 * @param today
	 * @return TodayReportVO
	 */
	public List<ExtraChargeSumVO> showTodayReportExtraCharge(String today);

}
