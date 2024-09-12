<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- 연차신청 -->
<form method="post"  action="${cPath }/approvalform.do" id="annualForm">

<div class="tool col-lg-8">
	<div class="page-header">
		<h3 class="fw-bold mb-3">전자결재</h3>
		<ul class="breadcrumbs mb-3">
			<li class="nav-home">
				<a href="#"><i class="fa-solid fa-house"></i></a>
			</li>
			<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
			<li class="nav-item"><a href="#">기안문</a></li>
		</ul>
	</div>

<div>
		<div class="tool_bar">
			<div class="critical">
<!-- 			<button id="act_draft" class="btn_tool buttonbak" data-bs-toggle="modal" data-bs-target="#requestModal"> -->
			<button id="act_draft" class="btn_tool buttonbak" data-bs-toggle="modal">
			    <span class="ic_toolbar approval"></span>
			    <i class="fa-solid fa-pen-to-square approimo"></i>
			    <span class="txt buttonbak" >결재요청</span>
			</button>

			<div class="modal fade" id="requestModal" tabindex="-1"
				data-bs-keyboard="false" role="dialog">
				<div class="modal-dialog modal-dialog-centered"
					role="document">
					<div class="modal-content layer_normal">
						<div class="modal-header border-0">
							<h5 class="modal-title">
								<span class="fw-mediumbold">결재 요청</span>
							</h5>
							<button type="button" class="close" data-bs-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							결재신청을 하시겠습니까?
<!-- 							비밀번호 입력: <input type="password" > -->
						</div>

						<div class="modal-footer border-0">
							<button type="button" id="annsubmit"
								class="btn btn-primary btn-sm">확인</button>
							<button type="button" class="btn btn-outline-dark btn-sm"
								data-bs-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
<!-- 			 <button type="submit" id="submitButton" class="btn_tool buttonbak"> -->
<!-- 	            <span class="ic_toolbar approval"></span> -->
<!-- 	            <i class="fa-solid fa-pen-to-square approimo"></i> -->
<!-- 	            <span class="txt buttonbak">결재요청</span> -->
<!-- 	        </button> -->

			<span class="btn_tool_group">
					<a id="act_cancel_draft" class="btn_tool" data-role="button">
						<span class="ic_toolbar cancel"></span>
						<i class="fa-regular fa-circle-xmark approimo"></i>
						<button class="txt buttonbak">취소</button>
					</a>
				</span>
<!-- 		 <div class="d-flex align-items-left align-items-md-center flex-column pbot-4" > -->

			<!-- Button trigger modal -->
			<button type="button" class="btn_tool btn" data-bs-toggle="modal" data-bs-target="#approvalline">
			  <i class="fa-solid fa-file-export "></i>결재선
			</button>

		<!-- Modal -->
        <div class="modal fade" id="approvalline" tabindex="-1"   data-bs-keyboard="false" role="dialog" >
          <div class="modal-dialog modal-lg modal-dialog-centered"  role="document">
            <div class="modal-content layer_normal">
              <div class="modal-header border-0">
                <h5 class="modal-title">
                  <span class="fw-mediumbold">결재 정보</span>
                </h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="tab_menu_wrap">
				<ul class="maintab tab_menu">
					<li data-role="tab" data-tabid="apprline" class="active">
						<span class="ic_txt_change">*</span>
						<span class="txt">결재선</span>
					</li>
				</ul>
				</div>


				<div class="set_wrap wrap_approval_agree">
                 	  <div class="aside-apprline set_nav" style="display: block;">
				        <!-- 탭 -->
				       	 <ul class="sidetab tab_type3 tab_type3_column2">
				       		 <li data-role="tab" data-tabid="orgtree" class="selected first">
				       			 <a href="#" data-bypass="">
				       				 <span class="txt">조직도</span>
				       			 </a>
				        	</li>
				       		 <li data-role="tab" data-tabid="myapprline" class="last">
				       			 <a href="#" data-bypass="">
				       				 <span class="txt">나의 결재선</span>
				       			 </a>
				       		 </li>
				        </ul>
				        <div class="sidetab-item">
					  		<div id="aside-orgtree" class="tabview-orgtree" style="display: block;">
					  		<section class="search">
					  		  <div class="search_wrap">
						  		<form onsubmit="return false;">
						  		     <input id="org_tree_tab_search_input" class="search" type="text" placeholder="이름/부서" title="이름/부서">
						  		</form>
					  		  </div>
					  		 </section>
						  		 <div class="orgTree_wrap">
									<div class="orgTree content_tab_wrap">
						  		       	<div id="aside-orgtree-tree" class="jstree jstree-25 jstree-focused jstree-default " style="min-height: 306px; max-height: 306px;"></div>
									</div>
										<div id="aside-orgtree-search" class="cone" style="display: none; border: none; padding: 5px 0px 5px 0px;"></div>
								</div>
							</div>
						</div>
				   		</div>
				   		 <div class="maintab-item wrap_tab_data">
						    <div class="set_data wrap_approvalLine_set tabview-apprline" style="display: block;">
						        <table class="type_normal tb_approval_line">
						            <thead>
						                <tr>
						                    <th class="box"></th>
						                    <th class="kind">타입</th>
						                    <th class="name">이름</th>
						                    <th class="depart">부서</th>
						                    <th class="func"> </th>
						                    <th class="blank"></th>
						                </tr>
						            </thead>
						        </table>
						        <div id="activity_groups" class="list_approval_line_wrap">
						            <div class="activity_group ui-sortable" data-index="0"><!-- <div class="approval_line">  -->
						                <div class="tit_type3"><span class="txt">승인</span></div>


						                <div class="list_approval_line">
						                    <div class="btn_langth add_activity" title="추가" data-id="">
						                     	<i class="fa-solid fa-forward appimo"></i>
						                    </div>
						                    <div class="tb_approval_line_wrap">
						                        <table class="appr-activity-table type_normal tb_approval_line">
						                            <tbody>
						                                <tr>
						                                    <td class="kind"> 기안</td>
						                                     <td class="name">${empvo.empName }</td>
                                                             <td class="depart">${empvo.department.depNm }</td>
						                                    <td class="func"></td>
						                                </tr>
						                            </tbody>
						                        </table>
						                    </div>
						                </div>

						            </div>
						            <div class="activity_group hidden_and_empty_group" style="height: 249px;">
						                <div class="empty_approval_line" style="height: 100%">
						                    <table style="height: 100%">
						                        <tbody style="height: 100%">
						                            <tr class="appr-activity activity ui-droppable" data-isnullactivity="true"
						                                style="height: 100%">
						                                <td style="width: 100%; height: 100%"></td>
						                            </tr>
						                        </tbody>
						                    </table>
						                </div>
						            </div>
						        </div>

						        <div class="tit_type2">
						            <a class="save-myapprline-btn btn_fn6" href="#" data-bypass="">개인 결재선으로 저장</a>
						            <span class="horspace1"></span>
						            <span class="tit">합의방식 : </span>
						            <span class="option_wrap">
						                <input id="series" class="radioinput" type="radio" name="useParallelAgreement" value="false" checked="">
						                <label for="series">순차합의</label>
						            </span>
						            <span class="option_wrap">
						                <input id="parallel" class="radioinput" type="radio" name="useParallelAgreement" value="true">
						                <label for="parallel">병렬합의</label>
						            </span>
						        </div>
						    </div>
						</div>
				   	 </div>
               </div>

                        <div class="modal-footer border-0">
                          <button type="button" id="addRowButton" class="btn btn-primary btn-sm">
                            확인
                          </button>
                          <button type="button" class="btn btn-outline-dark btn-sm" data-bs-dismiss="modal">
                            닫기
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
				<a id="hiddenDownloadDoc" data-role="button" href="" style="display: none"></a>
			</div>
		</div>
	</div>




	<div class="headerline " >
		<div class="anntable">
<%-- 		<form:form method="post" modelAttribute="empvo" enctype="multipart/form-data" id="annform"> --%>

			<table class="__se_tbl"
				style="width: 800px; border-collapse: collapse !important; color: black; background: white; border: 0px solid black; font-size: 12px; font-family: malgun gothic, dotum, arial, tahoma;">
				<!-- Header -->
				<tbody>
					<tr>
						<td style="width: 300px; padding: 3px !important; border: 0px solid black; height: 90px !important; font-size: 22px; font-weight: bold; text-align: center; vertical-align: middle;"
							colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
							연차신청서<input type="hidden" id="aprTitle" name ="aprTitle" value="연차신청서"/></td>
					</tr>
					<tr>
						<td style="width: 300px; border: 0; padding: 0 !important"
							class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

							<table class="__se_tbl"
								style="background: white; margin: 0px; border: 1px solid black; border-image: none; color: black; font-family: malgun gothic, dotum, arial, tahoma; font-size: 12px; border-collapse: collapse !important;">
								<!-- User -->

								<tbody>
									<tr>
										<td
											style="width: 100px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: rgb(221, 221, 221); padding: 3px !important;">
											기안자</td>
										<td
											style="width: 200px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; padding: 3px !important;">
											<span unselectable="on" contenteditable="false" class="comp_wrap"
												data-cid="0" data-dsl="{{label:draftUser}}">
												<span class="comp_item">${empvo.empName }
													<input type="hidden"  id="aprWriter" name="aprWriter" value="${empvo.empId}"  />
													<input type="hidden"  id="empId" name="empId" value="${empvo.empId}"  />
												</span>

											</span>
										</td>
									</tr>
									<tr>
										<td
											style="width: 100px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">
											기안부서</td>
										<td
											style="width: 200px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;">
											<span unselectable="on" contenteditable="false" class="comp_wrap"
												data-cid="1" data-dsl="{{label:draftDept}}" >
												<span class="comp_item">
												${empvo.department.depNm }</span>

											</span>
										</td>
									</tr>
									<tr>
									    <td style="width: 100px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">
									        기안일
									    </td>
									    <td style="width: 200px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;">
									        <span class="comp_item">
									            <fmt:formatDate value="<%= new java.util.Date() %>" pattern="yyyy-MM-dd"/>
												<input type="hidden" id="aprRegdate" name="aprRegdate" value="${pmsapproval.aprRegdate }" />
									        </span>
									    </td>
									</tr>

									<tr>
										<td
											style="width: 100px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">
											문서번호</td>
										<td
											style="width: 200px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;">
											<span unselectable="on" contenteditable="false" class="comp_wrap"
												data-cid="3" data-dsl="{{label:docNo}}">
												<span class="comp_item">문서번호</span>
												<input type="hidden" id="formId" name="formId" value="${pmsapproval.formId }" />

											</span>
										</td>
									</tr>
								</tbody>
							</table>

						</td>
						<td style="padding: 0px !important; border: 0px currentColor !important; border-image: none !important !important;
							width: 500px; text-align: right; vertical-align: top !important;" class="singnewmember">
						<!-- 결재선 기본값으로 신청 1명, 승인 7명으로 설정-->
			    			 <span class="sign_type1_inline" style="line-height: normal; font-family: malgun gothic,dotum,arial,tahoma; font-size: 9pt; margin-top: 0px; margin-bottom: 0px;
			    			 	" data-group-seq="0" data-group-name="승인" data-group-max-count="7" data-group-type="type1" data-is-reception="">
			    				 <span class="sign_tit_wrap">
			    					 <span class="sign_tit">
			    						 <strong>승인</strong>
			    			 		</span>
				    			 </span>
				    			 <span class="sign_member_wrap" id="activity_">
				    			 	<span class="sign_member">
				    			 		<span class="sign_rank_wrap">
				    						 <span class="sign_posi">${empvo.position.posiNm }</span>
				    					 </span>
					    				 <span class="sign_wrap">
					    					 <span class="sign_name">${empvo.empName }</span>
					    			 	</span>
				    					 <span class="sign_date_wrap">
				    				 		<span class="sign_date" id="date_"></span>
				    			 		</span>
				    				 </span>
				    			 </span>
			    			 </span>
						</td>
					</tr>
				</tbody>
			</table>



			<table class="caltable" style="width: 800px; margin-top: 10px; border-collapse: collapse !important; color: black; background: white; border: 1px solid black; font-size: 12px; font-family: malgun gothic, dotum, arial, tahoma;">
				<tbody>
					<tr>
						<td
							style="background: rgb(221, 221, 221); width: 100px; padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
							휴가&nbsp;종류</td>
						<td style="background: rgb(255, 255, 255);  width: 300px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
						 <select id="leaveType" name="leaveType" class="editor_slt">
	                        <option value="연차">연차</option>
	                        <option value="조퇴">조퇴</option>
	                        <option value="지각">지각</option>
	                        <option value="경조">경조</option>
	                        <option value="공가">공가</option>
	                        <option value="질병휴가">질병휴가</option>
	                    </select>
	                    <input type="hidden" id="adCatagory" name="adCatagory" value="${attvo.adCatagory }" />
						</td>
					</tr>
					<tr>
						<td
							style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
							기간&nbsp;및&nbsp;일시</td>
						<td>
							  <div class="cal">
							        <input type="date" id="startDate" name="startDate"/> &nbsp;~&nbsp;
							        <input type="date" id="endDate" name="endDate" >
							        사용 일수: <input class="anninput" id="dayCount" readonly>
							         <input type="hidden" id="adStrDate" name="adStrDate" value="${attvo.adStrDate }" />
							          <input type="hidden" id="adEndDay" name="adEndDay" value="${attvo.adEndDay }" />
							    </div>
						</td>
					</tr>

					<tr>
						<td
							style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
							반차&nbsp;여부</td>
						<td
							style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
							<span id="vacationHalfArea"
								style="line-height: normal; font-family: malgun gothic, dotum, arial, tahoma; font-size: 11pt; margin-top: 0px; margin-bottom: 0px;">
								<span class="halfArea">
									<input type="radio" class="editor_opt" data-dsl="{{radio_오전_오후}}"
										name="radio_startHalf" id="startAMHalf" value="오전" data-autotype="false"
										data-require="false" data-label="오전" >
									<label class="editor_label" data-type="removeSpan">오전</label>
									<input type="radio" class="editor_opt" data-dsl="{{radio_오전_오후}}"
										name="radio_startHalf" id="startPMHalf" value="오후" data-autotype="false"
										data-require="false" data-label="오후">
									<label class="editor_label" data-type="removeSpan">오후</label>
								</span>

							</span>
						</td>
					</tr>
					<tr>
						<td
							style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
							연차&nbsp;일수</td>
						<td style="padding: 3px; border: 1px solid black;  height: 22px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; background: rgb(255, 255, 255);">
							총 연차 :&nbsp;<span>${empvo.attencance.atteAllAnLeave }</span>
							사용연차 :&nbsp;<span>${empvo.attencance.atteUseAnLeave }</span>
						</td>
					</tr>
					<tr>
						<td
							style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 80px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
							<b style="color: rgb(255, 0, 0);">*</b>&nbsp;휴가&nbsp;사유
						</td>
						<td style="padding: 3px; border: 1px solid black; height: 100px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; vertical-align: top; background: rgb(255, 255, 255);">
 								<textarea class="txta_editor"></textarea>
 							 <input type="hidden" id="adContent" name="adContent" value="${attvo.adContent }" />
						</td>
					</tr>
					<tr>
						<td colspan="2"
							style="width: 800px; padding: 20px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; background: #ddd;">
							1. 연차의 사용은 근로기준법에 따라 전년도에 발생한 개인별 잔여 연차에 한하여 사용함을 원칙으로 한다. 단, 최초
							입사시에는 근로 기준법에 따라 발생 예정된 연차를 차용하여 월 1회 사용 할 수 있다.<br> 2. 경조사
							휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출<br> 3.
							공가(예비군/민방위)는 사전에 통지서를, 사후에 참석증을 반드시 제출
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</div>
	</div>
</form>

<script>

$(document).ready(function(){
    $('#act_draft').click(function(e){
        e.preventDefault();
        $('#requestModal').modal('show');
    });

    $('#annsubmit').click(function(){
        // 폼 제출 전 데이터 설정
        insertSelect();
         insertDate();
        insertContent();

        $('#annualForm').submit();
    });

    // 휴가 종류 선택 시 자동 업데이트
    $('#leaveType').change(insertSelect);

//     // 날짜 선택 시 자동 업데이트
//     $('#startDate, #endDate').change(insertDate);
});


function insertContent(){
    var textarea = document.querySelector('.txta_editor');
    var hidden = document.getElementById('adContent');
    hidden.value = textarea.value;
}


function insertSelect(){
	var select = document.getElementById('leaveType');
	var hidden = document.getElementById('adCatagory');
	hidden.value = select.value;
}

function insertDate(){
	var startdate =  document.getElementById('startDate');
	var enddate =  document.getElementById('endDate');
	var starthidden =  document.getElementById('adStrDate');
	var endhidden =  document.getElementById('adEndDay');

	starthidden.value = startdate.value;
	endhidden.value = enddate.value;

}






// 사용일수 자동계산
function calculateDays() {
    const startDate = new Date(document.getElementById('startDate').value);
    const endDate = new Date(document.getElementById('endDate').value);

    if (!isNaN(startDate.getTime()) && !isNaN(endDate.getTime())) {
        const diffTime = Math.abs(endDate - startDate);
        const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
        document.getElementById('dayCount').value = diffDays;
    } else {
        document.getElementById('dayCount').value = '';
    }
}

document.getElementById('startDate').addEventListener('change', calculateDays);
document.getElementById('endDate').addEventListener('change', calculateDays);





</script>



