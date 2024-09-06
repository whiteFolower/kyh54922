<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">근무표 등록</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">근무표</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">근무표등록</a></li>
						</ul>
					</div>


<%-- 					<form:form id="searchform" method="get" modelAttribute="condition"> --%>
<%-- 						<form:hidden path="searchType"/> --%>
<%-- 						<form:hidden path="searchWord"/> --%>
<!-- 						<input type="hidden" name="page" /> -->
<%-- 					</form:form> --%>
					<div class="row">
						<div class="col-lg-5">
							<div class="page-body-other">
								<div class="m-table-outer">
									<div class="m-table-inner">
										<h5>사원리스트</h5>
										<table class="table-header-fix table-input-in">
											<thead>
												<tr>
													<th>사번</th>
													<th>이름</th>
													<th>직책</th>
													<th>부서</th>
													<th>전화번호</th>
												</tr>
											</thead>
											<tbody id="list-body">

											</tbody>
										</table>


									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-7">
						<form method="get" id="workshift-search">
							<table id="workshift-list-search-table">
								<tr>
									<td><input type="text" id="chk"/></td>
									<td><input type="month" id="dal" name="dal" class="form-control"/></td>
									<td><button type="submit" id="searchBtn" class="btn btn-primary" >검색</button></td>
								</tr>
							</table>
						</form>
<%-- 						<form:form id="searchform" method="get"> --%>
<%-- 							<form:hidden path="dal"/> --%>
<%-- 							<form:hidden path="eName"/> --%>
<%-- 						</form:form> --%>

						<form method="post" id="workshift-form">
						<div class="table-top-box right-side">
							<button type="submit" class="btn btn-primary">저장</button>
						</div>
							<div class="page-body-other">
								<div class="m-table-outer">
									<div class="m-table-inner">
									<h5>근무스케줄</h5>

<%-- 										<form method="post" id="workshift-form"> --%>
		<!-- 								<button type="submit" class="btn btn-primary">저장</button> -->
		<!-- 						<div class="custom-select"> -->
		<!-- 							<select name="inputDate"> -->
		<!-- 								<option value>월선택</option> -->
		<!-- 								<option label="1월" value=""> -->
		<!-- 							</select> -->
		<!-- 						</div> -->
<!-- 									<nav class="button-box table-nav"> -->
<!-- 										<button type="submit" class="btn btn-primary">저장</button> -->
<!-- 									</nav> -->
											<table class="table-header-fix table-input-in">
												<thead>
													<tr>
														<td>사원명</td>
														<td>근무일자</td>
														<td>근무타입</td>
														<td>연차</td>
														<td>비고</td>
													</tr>
												</thead>

												<tbody id="list-body2">

												</tbody>
											</table>
												</div>
											</div>
										</div>
									</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

<script src="${cPath }/resources/js/pms/workshift/workshiftInsert.js"></script>
