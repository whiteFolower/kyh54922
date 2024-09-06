<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">객실 판매 현황</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 관리</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 관리 리스트</a></li>
						</ul>
					</div>

<%-- 					<form:form id="searchform" method="get" modelAttribute="condition"> --%>
<%-- 						<form:hidden path="searchType"/> --%>
<%-- 						<form:hidden path="searchWord"/> --%>
<!-- 						<input type="hidden" name="page" /> -->
<%-- 					</form:form> --%>

					<form method="post" action="">
						<input type="date" name="today">
						<button type="submit">전송</button>
					</form>

					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<th>객실 호수</th>
											<th>객실 등급</th>
											<th>투숙객 객 명</th>
											<th>투숙 인원</th>
											<th>투숙 기간</th>
											<th>요금 발생일시</th>
											<th>요금 내용</th>
											<th>수량</th>
											<th>총액</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty todaySalesList }">
											<c:forEach items="${todaySalesList }" var="todaySalesList">
												<tr>
													<td>${todaySalesList.roomId }</td>
													<td>${todaySalesList.roomtypeNm }</td>
													<td>${todaySalesList.memName }</td>
													<td>${todaySalesList.trevAdult
													 +todaySalesList.trevChild}</td>
													 <td>${todaySalesList.htrevChkin }
												 	~ ${todaySalesList.htrevChkout }</td>
												 	<td>${todaySalesList.extcrgDate }</td>
												 	<td>${todaySalesList.etNm }</td>
												 	<td>${todaySalesList.extcrgQty }</td>
												 	<td>${todaySalesList.extcrgQty*todaySalesList.etPrice }</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty todaySalesList }">
											<tr >
												<td colspan="9">기타 요금 발생 내역 없음</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="page-footer">
						<div class="paging paging-area">
							${pagingHTML }
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>