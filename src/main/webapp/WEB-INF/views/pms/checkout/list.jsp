<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!-- 퇴실 목록 모달 -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog modal-xl" role="document">
		<div class="modal-content">

			<div class="modal-header border-0">
				<h5 class="modal-title">퇴실 목록</h5>
			</div>


			<div class="modal-body">

					<div id="searchUI">
								<form:form modelAttribute="hotelCondition">
									<table>
										<tr>
											<td>고객명</td>
											<td><form:input path="memName" class="form-control" /></td>
											<td>예약번호</td>
											<td><form:input path="revNum" class="form-control" /></td>
											<td>차량번호</td>
											<td><form:input path="Carno" class="form-control" /></td>
											<td><button type="button" id="searchBtn" class="btn btn-primary" >검색</button></td>
										</tr>
									</table>
								</form:form>
							</div>

				<table class="table-header-fix table-input-in">
					<thead>
						<tr>
							<th style="text-align:left">NO</th>
							<th>입실일</th>
							<th>퇴실일</th>
							<th>예약번호</th>
							<th>고객명</th>
							<th style="text-align:left">룸타입</th>
							<th>객실</th>
							<th>숙박일</th>
							<th style="text-align:right">객실요금(원)</th>
							<th>차량번호</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="checkout-list">
					</tbody>
				</table>
			</div>
			<div class="page-footer">
					<div class="paging paging-area" id="chkPaging"></div>
			</div>

			<form:form id="searchform" method="get"
					modelAttribute="hotelCondition">
					<form:hidden path="revNum" />
					<form:hidden path="memName" />
					<form:hidden path="Carno" />
					<input type="hidden" name="page" />
			</form:form>

			<div class="modal-footer border-0">
				<button id="modalClose" type="button" class="btn btn-danger"
					data-dismiss="modal">닫기</button>
			</div>

		</div>
	</div>
</div>

<!-- 정산 모달 -->
<div class="modal fade" id="payModal" tabindex="-1" role="dialog"
	aria-hidden="true">
	<input type="hidden" id="extcrgNo"/>
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header border-0" id="payHeader"></div>

			<div class="modal-body">
				<div class="row">
					<div class="col-md-6 pe-0">
						<div id="pay1" class="form-group form-group-default"></div>
					</div>
					<div class="col-md-6">
						<div id="pay2" class="form-group form-group-default"></div>
					</div>
					<div class="col-md-3 pe-0">
						<div id="pay3" class="form-group form-group-default"></div>
					</div>
					<div class="col-md-4 pe-0">
						<div id="pay4" class="form-group form-group-default"></div>
					</div>
					<div class="col-md-5">
						<div id="pay5" class="form-group form-group-default"></div>
					</div>
				</div>
					<div class="row">
							<div class="col-sm-12">
								<div id="pay6" class="form-group form-group-default">
									<label>기타요금</label>
									<table>
										<thead>
											<tr>
												<td>타입</td>
												<td>가격(원)</td>
												<td>개수</td>
												<td id="extModalAdd"></td>
											</tr>
										</thead>
										<tbody id="extContent">
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 pe-0">
								<div class="form-group form-group-default" id="divExt"></div>
							</div>
						</div>
			</div>

			<div class="modal-footer border-0">
				<button class="btn btn-primary" type="button" id="extPay">정산</button>
				<button class="btn btn-primary" type="button" id="extSum"></button>
				<button class="btn btn-primary" data-bs-target="#modal" data-bs-toggle="modal" id="extList">목록</button>
				<button id="payModalClose" type="button" class="btn btn-danger"
					data-dismiss="modal">닫기</button>
			</div>

		</div>
	</div>
</div>

<!-- 기타요금 모달 -->
<div class="modal fade" id="extModal" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		<input type="hidden" id="extCk">
		<input type="hidden" id="extCketId">

			<div class="modal-header border-0">
				<h5 class="modal-title">기타요금</h5>
			</div>

			<div class="modal-body">
				<div class="row">
					<div class="col-sm-12">
							<table>
								<thead>
									<tr>
										<td>타입</td>
										<td>가격(원)</td>
										<td>개수</td>
										<td>합계(원)</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<select id="extType" onChange="extSelect()"></select>
										</td>
										<td>
											<input type="text" id="extPrice" readonly>
										</td>
										<td>
											<input type="number" id="extCnt">
										</td>
										<td>
											<input type="number" id="extTotal" readonly/>
										</td>
									</tr>
								</tbody>
							</table>
					</div>
				</div>
			</div>

			<div class="modal-footer border-0">
				<button class="btn btn-primary" data-bs-toggle="modal" id="extAdd" disabled="true">등록</button>
				<button class="btn btn-primary" data-bs-toggle="modal" id="extUd">수정</button>
				<button class="btn btn-danger" data-bs-target="#payModal" data-bs-toggle="modal">닫기</button>
			</div>

		</div>
	</div>
</div>

<!-- 삭제 모달 -->
<div class="modal fade" id="delModal" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">

		<input type="hidden" id="del1">
		<input type="hidden" id="del2">

		</div>
	</div>
</div>

<!-- 퇴실/정산 조회 -->
<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">퇴실/정산</h3>

						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="${pageContext.request.contextPath }"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>

							<li class="nav-item"><a href="javascript:;">퇴실/정산</a></li>
						</ul>
					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav">
							<button
		                        class="btn btn-primary" type="button" id="modalOpen"
		                        data-bs-toggle="modal"
		                        data-bs-target="#modal">
			                      <i class="fa-solid fa-bars"></i>퇴실 목록
			                 </button>
						</nav>
					</div>
							<div id="modalSearchUI">
								<form:form modelAttribute="hotelCondition">
							<table>
								<tr>
									<td>퇴실일</td>
									<td><form:input type="date" path="chkout" class="form-control" /></td>
									<td>고객명</td>
									<td><form:input path="memName" class="form-control" /></td>
									<td>예약번호</td>
									<td><form:input path="revNum" class="form-control" /></td>
									<td>차량번호</td>
									<td><form:input path="Carno" class="form-control" /></td>
									<td><button type="button" id="modalsearchBtn" class="btn btn-primary" >검색</button></td>
								</tr>
							</table>
						</form:form>
							</div>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<th style="text-align:left">NO</th>
											<th>입실일</th>
											<th>퇴실일</th>
											<th>예약번호</th>
											<th>고객명</th>
											<th style="text-align:left">룸타입</th>
											<th>객실</th>
											<th>숙박일</th>
											<th style="text-align:right">객실요금(원)</th>
											<th>차량번호</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="checkoutSys-list">
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="page-footer">
						<div id="modalPaging">
						</div>
					</div>
					<form:form id="modalSearch" method="get"
							modelAttribute="hotelCondition">
							<form:hidden path="chkout" />
							<form:hidden path="revNum" />
							<form:hidden path="memName" />
							<form:hidden path="Carno" />
							<input type="hidden" name="page" />
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="${pageContext.request.contextPath }/resources/js/app/pms/checkout/list.js"></script>