<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
#prodOrderQty{
	width: 80px;
	text-align: center;
}
table thead tr {
    background-color: #D3D3D3;
    color: #000000;
    text-align: left;
    font-weight: bold;
}
button{
	 background-color: #A9A9A9;
	 color: #000000;
	 font-weight: bold;
}
</style>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">발주 저장</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="${cPath }/orders/ordersList.do">발주 현황리스트</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">발주 저장</a></li>
						</ul>
					</div>
					<div class="table-top-box right-side">
						<nav class="button-box table-nav">
						<button type="button" id="submitAllBtn" class="btn btn-primary">
													<iclass ="fa-regular fa-paper-plane>발주 저장
												</button>
										<c:url value="/prod/prodInput.do" var="ordersInsertUrl">
					</c:url> <a href="${ordersInsertUrl }" class="btn btn-primary">거래처 일괄발주</a>
										<a href="${cPath }/orders/ordersList.do" class="btn btn-primary">취소</a> 
						</nav>
					</div>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<form:form method="post" modelAttribute="orders"
									enctype="multipart/form-data">
									<h3 class="fw-bold mb-3">거래처 선택</h3>
									<table>
										<tr>
											<th>분류</th>
											<td><form:select path="orderLgu" required="required"
													class="form-control" id="orderLgu">
													<form:option value="" label="분류선택" />
													<c:forEach items="${lprodList }" var="lprod">
														<form:option value="${lprod.lprodGu }"
															label="${lprod.lprodNm }" />
													</c:forEach>
												</form:select> <form:errors path="orderLgu" cssClass="text-danger"
													element="span" /></td>
										</tr>
										<tr>
											<th>제조사</th>
											<td><form:select path="orderBuyer" required="required"
													class="form-control" id="orderBuyer">
													<form:option value="" label="거래처선택" />
												</form:select> <form:errors path="orderBuyer" cssClass="text-danger"
													element="span" /></td>
										</tr>
									</table>
								</form:form>
								<table>
									<thead>
										        <tr>
										            <th>재고번호</th>
										            <th>재고명</th>
										            <th>분류명</th>
										            <th>제조사명</th>
										            <th>구매가</th>
										            <th>현재고수</th>
										            <th>총재고수</th>
										            <th>재고상황</th>
										            <th>발주수량</th>
										            <th></th>
										        </tr>
										    </thead>
										    <tbody id="productTableBody">
										    
											</tbody>
								</table>
								
								<form id="orderForm" >
								<h3 class="fw-bold mb-3">발주 신청 리스트</h3>
									<table>
										<thead>
											<tr>
												<th>상품코드</th>
												<th>상품명</th>
												<th>구매가</th>
												<th>수량</th>
												<th>합계</th>
												<th></th>
											</tr>
										</thead>
										<tbody id="orderTbody">
												
										</tbody>
										
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(document).ready(function() {
    
        $('#orderLgu').change(function() {
            const selectedLprodGu = $(this).val();

            $.ajax({
                url: '${cPath}/orders/ordersInsert.do/getBuyersByLprodGu', 
                type: 'GET',
                data: { lprodGu: selectedLprodGu },
                success: function(data) {
                    updateBuyerDropdown(data);
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error('Error fetching buyer data:', textStatus, errorThrown);
                }
            });
        });

        $('#orderBuyer').change(function() {
            const selectedBuyerId = $(this).val();

            $.ajax({
                url: '${cPath}/orders/ordersInsert.do/getProductsByBuyerId',
                type: 'GET',
                data: { buyerId: selectedBuyerId },
                success: function(data) {
                    updateProductList(data);
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error('Error fetching product data:', textStatus, errorThrown);
                }
            });
        });
        function updateBuyerDropdown(buyerData) {
        	$('#orderBuyer').empty();
            $('#orderBuyer').append($('<option value="">').text('거래처선택'));

            $.each(buyerData, function(index, buyer) {
                const option = $('<option>').val(buyer.buyerId).text(buyer.buyerName);
                $('#orderBuyer').append(option);
            });
        }
        
        function updateProductList(productData) {
            $('#productTableBody').empty(); 

            $.each(productData, function(index, prod) {
                const newRow = $('<tr>');
                newRow.append($('<td id="prodId">').text(prod.prodId));
                newRow.append($('<td id="prodName">').text(prod.prodName));
                newRow.append($('<td id="lprodNm">').text(prod.lprod.lprodNm));
                newRow.append($('<td id="buyerName">').text(prod.buyer.buyerName));
                newRow.append($('<td id="prodPrice">').text(prod.prodPrice));
                newRow.append($('<td id="prodTotalstock">').text(prod.prodTotalstock));
                newRow.append($('<td id="prodProperstock">').text(prod.prodProperstock));
                const needStock = (prod.prodTotalstock) - (prod.prodProperstock);
                newRow.append($('<td id="needStock">').text(needStock));
                newRow.append($('<input type="number" id="prodOrderQty" min="1">'));
                newRow.append($('<td>').append('<button id="addBtn">추가</button>'));

                $('#productTableBody').append(newRow);
            });
        }
        $(document).on('click', '#addBtn', function() {
            // 클릭된 버튼이 속한 행(row)을 가져옵니다.
            const row = $(this).closest('tr');
            
            // 해당 행에서 각 값을 가져옵니다.
            const orderProdId = row.find("#prodId").text();
            const orderProdName = row.find("#prodName").text();
            const orderProdPriceText = row.find("#prodPrice").text();
            const orderProdQty = parseInt(row.find('#prodOrderQty').val());  // 올바른 행에서 값을 가져옴
            const orderProdPrice = parseInt(orderProdPriceText);
            
            // 총 주문 가격 계산
            const orderTotal = (orderProdPrice * orderProdQty);

            // 새로운 행을 추가합니다.
            const tbody = $("#orderTbody");
            const newRow = $('<tr>');
            newRow.append($('<td>').text(orderProdId));
            newRow.append($('<td>').text(orderProdName));
            newRow.append($('<td>').text(orderProdPrice));
            newRow.append($('<td>').text(orderProdQty));
            newRow.append($('<td>').text(orderTotal));
            newRow.append($('<td>').append('<button class="deleteBtn">삭제</button>'));

            tbody.append(newRow);
        });
     
    	$(document).on('click', '.deleteBtn', function() {
    		  $(this).closest('tr').remove();
    		});
        function submitFormData() {
    	    const formData = [];
    	    $('#orderTbody tr').each(function() {
    	        const prodId = $(this).find('td:eq(0)').text();
    	        const prodQty = $(this).find('td:eq(3)').text();
    	        const total = $(this).find('td:eq(4)').text();
    	        formData.push({
    	            orderId: prodId,
    	            orderProdQty: prodQty,
    	            orderTotal: total,
    	        });
    	    });
    	    if (formData.length === 0) {
    	        alert("신청 정보가 없습니다.");
    	        return false;
    	    }
    	    $.ajax({
    	        url: '${cPath}/orders/ordersInsert.do',
    	        type: 'POST',
    	        dataType: 'json',
    	        contentType: 'application/json; charset=UTF-8',
    	        data: JSON.stringify(formData),
    	        success: function(data) {
    	            alert("발주신청이 완료되었습니다.");
    	            var orderApplyNo = data.orderApplyNo;
    	            window.location.href = `${cPath}/orders/ordersDetail.do?what=` + orderApplyNo;
    	        },
    	        error: function(xhr, status, error) {
    	            console.error(error);   
    	        }
    	    });
    	}
        $('#submitAllBtn').click(function() {
            // 확인창 표시
            var isConfirmed = confirm("정말 신청하시겠습니까?");
            if (isConfirmed) {
                submitFormData();
            } else {
                console.log("신청이 취소되었습니다.");
            }
        });
    });
</script>
