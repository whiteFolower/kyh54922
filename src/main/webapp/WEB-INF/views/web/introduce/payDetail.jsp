<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <section>
        <div class="svisual payment">
            PAYMENT<br>
            <b>결제</b>
        </div>

        <div class="container pay-content">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-title">결제</h3>
                    <div class="page-progress">
                        <div class="progress-info">
                            <div class="progress-circle">
                                <i class="fa-solid fa-calendar-days"></i>
                            </div>
                            <p>객실선택</p>
                        </div>
                        <div class="progress-next">
                            <div class="circle"></div>
                            <div class="circle"></div>
                            <div class="circle"></div>
                        </div>
                        <div class="progress-info">
                            <div class="progress-circle active">
                                <i class="fa-regular fa-credit-card"></i>
                            </div>
                            <p>결제</p>
                        </div>
                        <div class="progress-next">
                            <div class="circle"></div>
                            <div class="circle"></div>
                            <div class="circle"></div>
                        </div>
                        <div class="progress-info">
                            <div class="progress-circle">
                                <i class="fa-solid fa-check"></i>
                            </div>
                            <p>결제완료</p>
                        </div>
                    </div>

                    <div class="room-detail-des">
                        <div>
                            <ul class="room-detail-list">
                                <li>객실타입 :${roomType.roomtypeNm }</li>
                                <c:if test="${roomType.roomtypeNm eq '스탠다드' }">
	                                <li>객실 설명 : 킹 베드 1개, 2인(최대 3인)</li>
                                </c:if>
                                <c:if test="${roomType.roomtypeNm eq '디럭스' }">
	                                <li>객실 설명 : 킹 베드 1개, 2인(최대 3인)</li>
                                </c:if>
                                <c:if test="${roomType.roomtypeNm eq '슈페리어' }">
	                                <li>객실 설명 : 킹 베드 1개, 2인(최대 3인)</li>
                                </c:if>
                                <c:if test="${roomType.roomtypeNm eq '이그제큐티브' }">
	                                <li>객실 설명 : 더블 베드 2개, 2인(최대 3인)</li>
                                </c:if>
                                <c:if test="${roomType.roomtypeNm eq '스위트' }">
	                                <li>객실 설명 : 킹 베드 2개, 2인(최대 3인)</li>
                                </c:if>
                                <li>인원수 :${humanNo }명</li>
                            </ul>
                        </div>
                        <div class="pay-day">
                            <div class="pay-res-period start-date">
                                <p id="start">${startDay }</p>
                                <p>15:00</p>
                            </div>
                            <div class="period">
								<p id="stayDay">${stayDay }박</p>
                            </div>
                            <div class="pay-res-period end-date">
                                <p id="last">${lastDay }</p>
                                <p>11:00</p>
                            </div>
                        </div>
                    </div>
                    <div class="room-all-pay">
                        <p>총금액 : 
						   <span class="text-red">${roomType.roomtypePrice}</span>원
						</p>
                    </div>
                    <div class="total-info">
                        <div class="pay-res-person">
                            <div>
                                <div class="pay-res-info-top">
                                    <p class="pay-res-title">예약자 정보입력</p>
                                </div>
                               <form method="post" action="${cPath }/totalRev/totalRevPaymentData">
                                <table class="pay-res-info">
                                    <colgroup>
                                        <col width="20%"/>
                                        <col width="80%" />
                                    </colgroup>
                                    <tr>
                                        <th>예약자명<span class="text-red">*</span></th>
                                        <td><input class="res-pay-input" type="text" name="name" value="${autentication.principal.realUser.memName }"/></td>
                                    </tr>
                                    <tr>
                                        <th>연락처<span class="text-red">*</span></th>
                                        <td><input class="res-pay-input" type="text" name="Phone" value="${autentication.principal.realUser.memTel }"/></td>
                                    </tr>
                                    <tr>
                                        <th>이메일</th>
                                        <td><input class="res-pay-input" type="text" name="email" value="${autentication.principal.realUser.memEmail }"/></td>
                                    </tr>
                                    <tr>
                                        <th>차량 번호</th>
                                        <td><input class="res-pay-input" type="text" name="carNo" /></td>
                                    </tr>
                                    <tr>
                                        <th>요청사항</th>
                                        <td><input class="res-pay-input" type="text" name="revCn" /></td>
                                    </tr>
                                    <tr>
                                        <th>마일리지</th>
                                        <td><input class="res-pay-input" type="text" name="memMil" id="memMil" readonly/></td>
                                    </tr>
                                </table>
                                    	<input class="res-pay-input" type="hidden" name="roomType" value="${roomType.roomtypeId }" />
                                    	<input class="res-pay-input" type="hidden" name="roomTypePrice" value="${roomType.roomtypePrice }" />
                                    	<input class="res-pay-input" type="hidden" name="startDay" value="${startDay }" />
                                    	<input class="res-pay-input" type="hidden" name="lastDay" value="${lastDay }" />
                                    	<input class="res-pay-input" type="hidden" name="stayDay" value="${stayDay }" />
                                    	<input class="res-pay-input" type="hidden" name="humanNo" value="${humanNo }" />
                                    	<input class="res-pay-input" type="hidden" name="memId" value="${autentication.principal.realUser.memId }" />
                               </form>
                            </div>
                            <div>
                                <div class="pay-res-info-top">
                                    <p class="pay-res-title">결제 정보</p>
                                </div>
                                <div class="pay-res-info-content">
                                    <div class="pay-info-select">
                                        <div class="payment-method">
                                        </div>
                                        <div class="total-meny-box">
                                            <p>총결제 금액 : <span class="text-red">${roomType.roomtypePrice}</span>원</p>
                                        </div>
                                    </div>
                                    <div class="pay-res-btn-bottom">
                                        <button class="pay-res-btn cancel">취소</button>
                                        <a class="pay-res-btn confirm">결제</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    
  <script>
  
  const paymentBtn = document.querySelector('.pay-res-btn.confirm');

  paymentBtn.addEventListener('click', () => {
      const form = document.querySelector('form');

      form.submit();
  });
  
  document.addEventListener('DOMContentLoaded', function() {
	    const memId = `${autentication.principal.realUser.memId}`;
	    if (memId) {
	        // memId가 존재하면 AJAX 요청을 보냄
	        $.ajax({
	            url: `${cPath}/totalRev/memMil`, // AJAX 요청을 보낼 URL
	            type: 'POST',
	            data: { memId: memId }, // 데이터 전송
	            success: function(response) {
	                console.log("Response:", response);

	                // id가 memMil인 요소를 찾아서 응답 값으로 업데이트
	                const memMilElement = document.getElementById('memMil');
	                if (memMilElement) {
	                    memMilElement.textContent = response; // 응답 값으로 업데이트
	                }
	            },
	            error: function(error) {
	                console.error("Error with AJAX request:", error);
	            }
	        });
	    }
	});
  </script>