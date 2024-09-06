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
                                <li>객실 설명 : 킹 베드 2개, 2인(최대 3인)</li>
                                <li>인원수 :${humanNo }명</li>
                            </ul>
                        </div>
                        <div class="pay-day">
                            <div class="pay-res-period start-date">
                                <p id="start">${startDay }</p>
                                <p>15:00</p>
                            </div>
                            <div class="period">
								<p id="result"></p>
                            </div>
                            <div class="pay-res-period end-date">
                                <p id="last">${lastDay }</p>
                                <p>11:00</p>
                            </div>
                        </div>
                    </div>
                    <div class="room-all-pay">
                        <p>총금액 : 
						  <c:choose>
						    <c:when test="${not empty roomType.roomtypePtype}">
						      <span class="text-red">${roomType.roomtypePrice }* ()roomType.roomtypePtype * 0.1)}</span>원
						    </c:when>
						    <c:otherwise>
						      <span class="text-red">${roomType.roomtypePrice}</span>원
						    </c:otherwise>
						  </c:choose>
						</p>
                    </div>
                    <div class="total-info">
                        <div class="pay-res-person">
                            <div>
                                <div class="pay-res-info-top">
                                    <p class="pay-res-title">예약자 정보입력</p>
                                    <label class="input-container">
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                        <span class="input-text">회원정보 동일</span>
                                    </label>
                                </div>
                                <table class="pay-res-info">
                                    <colgroup>
                                        <col width="20%"/>
                                        <col width="80%" />
                                    </colgroup>
                                    <tr>
                                        <th>예약자명<span class="text-red">*</span></th>
                                        <td><input class="res-pay-input" type="text"  /></td>
                                    </tr>
                                    <tr>
                                        <th>생년월일<span class="text-red">*</span></th>
                                        <td><input class="res-pay-input" type="text"  /></td>
                                    </tr>
                                    <tr>
                                        <th>연락처<span class="text-red">*</span></th>
                                        <td><input class="res-pay-input" type="text"  /></td>
                                    </tr>
                                    <tr>
                                        <th>이메일</th>
                                        <td><input class="res-pay-input" type="text"  /></td>
                                    </tr>
                                    <tr>
                                        <th>요청사항</th>
                                        <td><input class="res-pay-input" type="text"  /></td>
                                    </tr>
                                </table>
                            </div>
                            <div>
                                <div class="pay-res-info-top">
                                    <p class="pay-res-title">결제 정보</p>
                                </div>
                                <div class="pay-res-info-content">
                                    <div class="pay-info-select">
                                        <div class="payment-method">
                                            <label class="radio-container">
                                                <input type="radio" name="payment">
                                                <span class="radio-checkmark"></span>
                                                <span>카카오 페이</span>
                                            </label>
                                            <label class="radio-container">
                                                <input type="radio" name="payment">
                                                <span class="radio-checkmark"></span>
                                                <span>신용카드</span>
                                            </label>
                                        </div>
                                        <div class="total-meny-box">
                                            <p>총결제 금액 : <span class="text-red">${roomType.roomtypePrice}</span>원</p>
                                        </div>
                                    </div>
                                    <div class="pay-res-btn-bottom">
                                        <button class="pay-res-btn cancel">취소</button>
                                        <a class="pay-res-btn confirm" href="${cPath }/web/payComplate">결제</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>