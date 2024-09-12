<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


 <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<div class="container">
	<div class="page-inner">
		<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4">
			<div>
				<h3 class="fw-bold mb-3"> ${empvo.empName}

				</h3>
				<h6 class="op-7 mb-2">${empvo.department.depNm }/${empvo.position.posiNm }</h6>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-4 ">
				<div class="card-stats card-round">
					<div class="card card-stats card-round card-my-height" >
						<div class="indexplus">
							<a href="${cPath }/pmsworkstatus/workstatus.do" class="buttonbak">
								<i class="fa-regular fa-square-plus "></i>
							</a>
						</div>
						<div class="card-body">
							<div>
								<div class="card-title">근태현황</div>
								<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" />
									<br>
								<div>
									<span id="currentTime"></span>
								</div>
							</div>
							<div class="card-list py-4">
								<input type="hidden" id="currentUserId" value="${empvo.empId }">
								<div class="item-list">
									<ul class="info-user indextime">
										<li class="work">
											<dl class="d-flex justify-content-between align-items-center">
												<dt class="time">출근시간</dt>
												<dd class="worktime" id="checkInTime">
													<span id="checkInText">미등록</span>
												</dd>
											</dl>
										</li>
										<li class="work">
											<dl class="d-flex justify-content-between align-items-center">
												<dt class="time">퇴근시간</dt>
												<dd class="worktime" id="checkOutTime">
													<span id="checkOutText">미등록</span>
												</dd>
											</dl>
										</li>
									</ul>
								</div>
								<div class="card-tools indexwork">
									<ul class="info-user">
										<li>
											<a href="#" id="checkInBtn" class="btn btn-label-success btn-round btn-lg me-2"> 출근 </a>
											<a href="#" id="checkOutBtn" class="btn btn-label-info btn-round btn-lg">퇴근 </a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="card card-stats card-round card-my-height">
						<div class="card-header">
							<div class="card-head-row card-tools-still-right">
								<h4 class="card-title">결재진행내역</h4>
							</div>
						</div>
						<div class="col-md12">
							<div class="table-responsive table-hover table-sales">
								<table class="table">
									<tbody>
										<tr>
											<td>결재상태</td>
											<td class="text-end">날짜</td>
											<td class="text-end">결재양식</td>
											<td class="text-end">제목</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-8 ">
				<div class="card card-stats card-round cal-height">
					<div class="card-body">
						<div id="calendar"></div>
					</div>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-md-8">
				<div class="card card-round" style="height: auto;">
					<div class="card-header">
						<div class="card-head-row card-tools-still-right">
							<div class="card-title">사내공지사항</div>
							<div class="card-tools">
								<div class="dropdown">
									<a href="${cPath }/empNotice/empNoticeList.do"><i class="fa-solid fa-list"></i></a>
								</div>
							</div>
						</div>
					</div>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<th>제목</th>
											<th>작성자</th>
											<th>첨부파일</th>
											<th>일시</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty recentNotices }">
												<c:forEach items="${recentNotices }" var="recentnotices">
													<tr>
														<td>
															<c:url value="/empNotice/empNoticeDetail.do" var="empNoticeDetailUrl">
																<c:param name="what" value="${recentnotices.empnotiNo }"></c:param>
															</c:url>
															<a href="${empNoticeDetailUrl }">${recentnotices.empnotiTitle }</a>
														</td>
														<td>${recentnotices.emonotiWriter }</td>
														<td>${recentnotices.empnotiFile }</td>
														<td>${recentnotices.empnotiDate }</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="5">조회 된 데이터 없음</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>



<script src="${cPath }/resources/js/pms/index.js"></script>
<script src="${cPath }/resources/js/pms/keh/worktime.js"></script>
