<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">분실물및보관 리스트</h3>

					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav">
							<a href="#insert" class="btn btn-primary" data-bs-toggle="modal"
								data-bs-target="#insert"
								data-insert-url="/lostitem/lostitemInsert.do">등록</a>
						</nav>
						<div class="right">
							<nav class="nav-select-box">
								<div class="custom-select">
									<form:select path="condition.searchType">
										<option value>검색</option>
										<option value="0">등록날짜</option>
										<option value="1">습득장소</option>
										<option value="2">물품명</option>
									</form:select>
								</div>
							</nav>
							<nav class="nav-search d-lg-flex input-search table-nav ms-1">
								<div class="input-group">
									<input type="text" placeholder="Search..." class="form-control">
									<div class="input-group-prepend">
										<button type="submit" class="btn btn-search pe-1">
											<i class="fa fa-search search-icon"></i>
										</button>
									</div>
								</div>
							</nav>
						</div>
					</div>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<th>물품번호</th>
											<th>등록날짜</th>
											<th>습득장소</th>
											<th>습득자</th>
											<th>물품명</th>
											<th>담당자</th>
											<th>비고</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty lostitemList }">
												<c:forEach items="${lostitemList }" var="lostitem">
													<tr>
														<td id="${lostitem.hksNo }">${lostitem.hksNo }</td>
														<td>${lostitem.hksDate }</td>
														<td>${lostitem.hksPlace }</td>
														<td>${lostitem.hksAcquirer }</td>
														<td><a href="#detail" class="test"
															data-bs-toggle="modal" data-bs-target="#detail"
															data-hksno="${lostitem.hksNo}"
															data-hksDate="${lostitem.hksDate}"
															data-hksPlace="${lostitem.hksPlace}"
															data-hksAcquirer="${lostitem.hksAcquirer}"
															data-hksKind="${lostitem.hksKind}"
															data-hksRegi="${lostitem.hksRegi}">
																${lostitem.hksKind}</a></td>
														<td>${lostitem.hksRegi }</td>
														<td>${lostitem.hksNote }</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="7">상품 없음.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="page-footer">
						<div class="paging paging-area">${pagingHTML }</div>
					</div>

				</div>
				<form:form id="searchform" method="get" modelAttribute="condition">
					<input type="hidden" name="page" />
				</form:form>
			</div>
		</div>
	</div>
</div>


<!-- Modal detail부분	 -->
<div class="modal fade" id="detail" tabindex="-1" data-bs-backdrop="#"
	data-bs-keyboard="false" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 class="modal-title">
					<span class="fw-mediumbold">대여물품 상세</span>
				</h5>
				<button type="button" class="close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<table class="table table-bordered">
					<tr>
						<th>물품번호</th>
						<td><input type="number" id="hksNo" name="hksNo"
							 class="form-control" readonly /></td>
					</tr>
					<tr>
						<th>날짜</th>
						<td><input type="date" id="hksDate" name="hksDate"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>습득한곳</th>
						<td><input type="text" id="hksPlace" name="hksPlace"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>습득자</th>
						<td><input type="text" id="hksAcquirer" name="hksAcquirer"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>물품명</th>
						<td><input type="text" id="hksKind" name="hksKind"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>담당자</th>
						<td><input type="text" id="hksRegi" name="hksRegi"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>비고</th>
						<td><textarea id="hksNote" name="hksNote"
								class="form-control"></textarea></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer border-0">
				<button type="button" onclick="updatelostitem()" id="updateButton" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal insert부분	 -->
<div class="modal fade" id="insert" tabindex="-1" data-bs-backdrop="#"
	data-bs-keyboard="false" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 class="modal-title">
					<span class="fw-mediumbold">보관및분실물 등록</span>
				</h5>
				<button type="button" class="close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<table class="table table-bordered">
					<tr>
						<th>등록날짜</th>
						<td><input type="date" id="hksDateinsert" name="hksDateinsert"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>습득장소</th>
						<td><input type="text" id="hksPlaceinsert" name="hksPlaceinsert"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>습득자</th>
						<td><input type="text" id="hksAcquirerinsert" name="hksAcquirerinsert"
							class="form-control" /></td>
					</tr>
					<tr>
					<th>물품명</th>
						<td><input type="text" id="hksKindinsert" name="hksKindinsert"
							class="form-control" /></td>
					</tr>
					<tr>
					<th>담당자</th>
						<td><input type="text" id="hksRegiinsert" name="hksRegiinsert"
							class="form-control" /></td>
					</tr>
					<tr>
						<th>비고</th>
						<td><textarea id="hksNoteinsert" name="hksNoteinsert"
								class="form-control"></textarea></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer border-0">
				<button type="button" onclick="lostitemInsert()" id="insertButton" class="btn btn-primary" data-bs-dismiss="modal">등록</button>
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<script src="${cPath }/resources/js/pms/lostitemDetail.js"></script>
