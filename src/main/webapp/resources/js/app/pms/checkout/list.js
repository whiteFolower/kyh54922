/**
 *
 */
// 기타요금 타입
const extType = document.querySelector("#extType");

// 기타요금 가격
const extPrice = document.querySelector("#extPrice");

// 기타요금 개수
const extCnt = document.querySelector("#extCnt");

// 기타요금 합계
const extTotal = document.querySelector("#extTotal");

// exModal 추가 버튼
const extAdd = document.querySelector("#extAdd");

// 기타요금 selectbox onChange 이벤트
function extSelect(){
	let price = extType.value;

	if(extType.value == ""){
				alert("종류를 선택해 주세요");
				extPrice.value = "";
				extCnt.value = "";
				extTotal.value = "";
				extAdd.disabled = true;
	}else{
		extAdd.disabled = false;

		fetch(`${document.body.dataset.contextPath}/checkout/extPrice.do?what=${price}`, {
			method:"get",
			headers:{
				accept:"application/json"
			}
		}).then(resp => {
			resp.json().then(rslt => {

				console.log(rslt);
				extPrice.value = rslt;
				extCnt.value = "1";
				extTotal.value = extPrice.value;
			})
		})

	}

}

extCnt.addEventListener("blur", () => {
	extTotal.value = extPrice.value * extCnt.value;
})

// 페이지 로딩 후
document.addEventListener("DOMContentLoaded", () => {
	// contextPath
	const cPath = document.body.dataset.contextPath;

	// checkout-list
	const chkList = document.querySelector("#checkout-list");

	// checkout-paging
	const chkPaging = document.querySelector("#chkPaging");

	// modal open 버튼
	const mOpen = document.querySelector("#modalOpen");

	// modal close 버튼
	const mClose = document.querySelector("#modalClose");

	// checkoutSys-list
	const chkSysList = document.querySelector("#checkoutSys-list");

	// modal paging 버튼
	const mPaging = document.querySelector("#modalPaging");

	// payModal
	const pModal = document.querySelector("#payModal");

	// pModal 예약번호
	const pay1 = document.querySelector("#pay1");

	// pModal 고객명
	const pay2 = document.querySelector("#pay2");

	// pModal 룸타입
	const pay3 = document.querySelector("#pay3");

	// pModal 객실
	const pay4 = document.querySelector("#pay4");

	// pModal 객실요금
	const pay5 = document.querySelector("#pay5");

	// pModal close 버튼
	const pClose = document.querySelector("#payModalClose");

	// 기타요금 번호
	const extcrgNo = document.querySelector("#extcrgNo");

	// extModal
	const extModal = document.querySelector("#extModal");

	// 기타요금 tbody
	const extContent = document.querySelector("#extContent");

	// delModal
	const delModal = document.querySelector("#delModal");

	// chkListUI
	const chkListUI = (chkOut) => {
		return `
					<tr>
						<td style="text-align:left">${chkOut.rnum}</td>
						<td>${chkOut.htrevChkin}</td>
						<td>${chkOut.htrevChkout}</td>
						<td>${chkOut.trevId}</td>
						<td>${chkOut.memName}</td>
						<td style="text-align:left">${chkOut.roomtypeNm}</td>
						<td>${chkOut.roomId}</td>
						<td>${chkOut.htrevStay}</td>
						<td style="text-align:right">${chkOut.htrevTprice}</td>
						<td>${chkOut.trevCarno}</td>
						<td>
							<a data-bs-toggle="modal"
							data-bs-target="#payModal"
							href="#payModal"
							data-detail-url="${cPath}/checkout/pay.do?what=${chkOut.payId}">
							<button class="btn btn-primary" type="button">정산내역</button>
							</a>
						</td>
					</tr>
				`;
	};

	// chkSysListUI
	const chkSysListUI = (chkOut) => {
		return `
					<tr>
						<td style="text-align:left">${chkOut.rnum}</td>
						<td>${chkOut.htrevChkin}</td>
						<td>${chkOut.htrevChkout}</td>
						<td>${chkOut.trevId}</td>
						<td>${chkOut.memName}</td>
						<td style="text-align:left">${chkOut.roomtypeNm}</td>
						<td>${chkOut.roomId}</td>
						<td>${chkOut.htrevStay}</td>
						<td style="text-align:right">${chkOut.htrevTprice}</td>
						<td>${chkOut.trevCarno}</td>
						<td>
							<a data-bs-toggle="modal"
							data-bs-target="#payModal"
							href="#payModal"
							data-detail-url="${cPath}/checkout/pay.do?what=${chkOut.payId}">
							<button class="btn btn-primary" type="button">정산</button>
							</a>
						</td>
					</tr>
				`;
	};

	// exListUI
	const extListUI = (ext) => {
		return `
					<option value="${ext.etId}">${ext.etNm}</option>
				`;
	}

	const extcListUI = (extc) => {
		return `
					<tr>
						<td>${extc.etNm}</td>
						<td>${extc.etPrice}</td>
						<td>${extc.extcrgQty}</td>
						<td>
							<a data-bs-toggle="modal"
							href="#extModal"
							data-extc1 = "${extc.extcrgNo}"
							data-extc2 = "${extc.etNm}"
							data-extc3 = "${extc.etPrice}"
							data-extc4 = "${extc.extcrgQty}"
							data-extc5 = "${extc.etId}"
							>
							${extc.trevSt == "OUT" ? "" : `<button type="button">수정</button>`}
							</a>
							<a data-bs-toggle="modal"
							href="#delModal"
							data-detail-url = "${cPath}/checkout/extcDel.do?what1=${extc.extcrgNo}&what2=${extc.etId}"
							data-extc = "${extc.extcrgNo}">
							${extc.trevSt == "OUT" ? "" : `<button type="button">삭제</button>`}
							</a>
						</td>
					<tr>
				`;
	}


	// modalSearch submit 이벤트
	const chkSys = () => {
		modalSearch.addEventListener("submit", (e) => {
			e.preventDefault();

			let formData = new FormData(e.target);
			let data = new URLSearchParams(formData).toString();

			// console.log(e.target.chkout.value);
			console.log(new Date().toISOString().substring(0, 10));

				fetch(`${cPath}/checkout/syslist.do?${data}`, {
					method:"get",
					headers:{
						accept:"application/json"
					}
				}).then(resp => {
					resp.json().then(rslt => {
						// console.log(rslt);
						let trTags = null;
						if(rslt.checkoutSysList.length > 0){
							trTags = rslt.checkoutSysList.map(chkSysListUI).join("\n");
						}else{
							trTags = `
										<tr>
											<td colspan="10">퇴실 예정자가 없습니다.</td>
										</tr>
									`;
						}
						chkSysList.innerHTML = trTags;

						mPaging.innerHTML = rslt.pagingHTML;
					}).finally(() => {
					e.target.page.value = "";
				})
				})

			})
			modalSearch.requestSubmit();
	}

	// mOpen click 이벤트
	mOpen.addEventListener("click", () => {
		// console.log("환")
		chk();
	})

	// mClose click 이벤트
	mClose.addEventListener("click", () => {
		$("#modal").modal("hide");
	})

	// 기타요금 axios
	const extList = (param) => {
		axios.get(`${cPath}/checkout/extcList.do?what=${param}`)
				.then((resp) => {
					let rslt = resp.data;
					let trTags = "";
					console.log(rslt);
					console.log(rslt.extcList);
					if(rslt.extcList.length > 0){
						trTags = rslt.extcList.map(extcListUI).join("\n");
					}else{
						trTags = `
									<tr>
										<td colspan="4">기타요금이 없습니다.</td>
									</tr>
								`;
					}

					extContent.innerHTML = trTags;
				})
			}

	// payModal open event
	pModal.addEventListener("show.bs.modal", (e) => {
		console.log("환");

		let aTag = e.relatedTarget;
		let url = aTag.dataset.detailUrl;
		console.log(url);

		fetch(url, {
			method:"get",
			headers:{
				accept:"application/json"
			}
		}).then(resp => {
			resp.json().then(rslt => {
				console.log(rslt);
				pay1.innerHTML = `<label>예약번호</label>` + rslt.checkoutVO.trevId;
				pay2.innerHTML = `<label>고객명</label>` + rslt.checkoutVO.memName;
				pay3.innerHTML = `<label>룸타입</label>` + rslt.checkoutVO.roomtypeNm;
				pay4.innerHTML = `<label>객실</label>` + rslt.checkoutVO.roomId;
				pay5.innerHTML = `<label>객실요금(원)</label>` + rslt.checkoutVO.htrevTprice;
				extcrgNo.value = rslt.checkoutVO.extcrgNo;

				// 정산, 정산내역
				if(rslt.checkoutVO.trevSt == "OUT"){
					$("#payHeader").html(`<h5 class="modal-title">정산내역</h5>`);
					$("#extModalAdd").html("");
					$("#extSum").hide();
					$("#extList").show();
					$("#extPay").hide();
				}else{
					$("#payHeader").html(`<h5 class="modal-title">정산</h5>`);
					$("#extModalAdd").html(`<button data-bs-target="#extModal" data-bs-toggle="modal">등록</button>`);
					$("#extSum").hide();
					$("#extList").hide();
					$("#extPay").show();
				}

			extList(rslt.checkoutVO.extcrgNo);
			}).finally(() => {
				$("#extSum").click();
			})
		})

	})

	// pClose click 이벤트
	pClose.addEventListener("click", () => {
		$("#payModal").modal("hide");
	})

	// extModal open event
	extModal.addEventListener("show.bs.modal", (e) => {
		let aTag = e.relatedTarget;
		let extcrgNo = aTag.dataset.extc1;
		let etNm = aTag.dataset.extc2;
		let etPrice = aTag.dataset.extc3;
		let extcrgQty = aTag.dataset.extc4;
		let etId = aTag.dataset.extc5;

		$("#extCk").val(extcrgNo);

		if($("#extCk").val() == ""){
			fetch(`${cPath}/checkout/extList.do`, {
				method:"get",
				headers:{
					accept:"application/json"
				}
			}).then(resp => {
				resp.json().then(rslt => {
					console.log(rslt);
					let trTags = `<option value="">선택</option>`;
					trTags += rslt.extList.map(extListUI).join("\n");

					// 기타요금 selectbox
					extType.innerHTML = trTags;
				})
			})

			extType.value = "";
			extPrice.value = "";
			extCnt.value = "";
			extTotal.value = "";
			extAdd.disabled = true;

			$("#extAdd").show();
			$("#extUd").hide();
		}else{
			$("#extAdd").hide();
			$("#extUd").show();

			$("#extType").html(`<option value="${etId}">${etNm}</option>`);
			$("#extPrice").val(etPrice);
			$("#extCnt").val(extcrgQty);
			$("#extTotal").val(etPrice * extcrgQty);
			$("#extCkextcrgNo").val(extcrgNo);
			$("#extCketId").val(etId)
		}
	})

	// 기타요금 수정 버튼 click event
	$("#extUd").click(() => {
		console.log($("#extCnt").val())
		console.log($("#extCk").val())
		console.log($("#extCketId").val())
		let extcrgNo = $("#extCk").val();
		let etId = $("#extCketId").val();
		let extcrgQty = $("#extCnt").val();

		swal({
			  title: "수정하시겠습니까?",
			  text: "",
			  icon: "info",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
					    axios.post(`${cPath}/checkout/extcUd.do`, {
						extcrgNo:extcrgNo,
						etId:etId,
						extcrgQty:extcrgQty
					})
					.then(() => {
						swal("수정되었습니다.", "", "success");
					})
					.finally(() => {
						extList(extcrgNo);
						$("#extSum").click();
					})
			  } else {
			    swal("취소되었습니다.");
			  }
			})
			.finally(() => {
				$("#payModal").modal("show");
			});
	})


	// 기타요금 추가 버튼 click event
	extAdd.addEventListener("click", () => {
		extcrgNo1 = extcrgNo.value;
		extType1 = extType.value;
		extCnt1 = extCnt.value;
		console.log(extcrgNo.value);
		console.log(extType1.value);
		console.log(extCnt.value);

		swal({
			  title: "등록하시겠습니까?",
			  text: "",
			  icon: "info",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
					    axios.post(`${cPath}/checkout/extcAdd.do`, {
						extcrgNo:extcrgNo1,
						etId:extType1,
						extcrgQty:extCnt1
					})
					.then(() => {
						swal("등록되었습니다.", "", "success");
					})
					.catch(() => {
						swal("이미 등록되어 있습니다.", "수정버튼을 사용해 주세요.", "warning");
					})
					.finally(() => {
						$("#extSum").click();
						extList(extcrgNo1);
					})
			  } else {
			    swal("취소되었습니다.");
			  }
			})
			.finally(() => {
				$("#payModal").modal("show");
			});
	})

	// delModal show event
	delModal.addEventListener("show.bs.modal", (e) => {
		let aTag = e.relatedTarget;
		let url = aTag.dataset.detailUrl;
		let extc = aTag.dataset.extc;

			swal({
			  title: "삭제하시겠습니까?",
			  text: "",
			  icon: "info",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				fetch(url, {
					method:"get",
					headers:{
						"accept":"application/json",
					},
				}).finally(() => {
						swal("삭제되었습니다.", "", "success");
						$("#extSum").click();
						extList(extc);
				})
			  } else {
			    swal("취소되었습니다.");
			  }
			})
			.finally(() => {
				$("#delModal").modal("hide");
				$("#payModal").modal("show");
			});

		})

	// 기타요금 정산 axios
	const extS = (param) => {
		axios.get(`${cPath}/checkout/extcTotal.do?what=${param}`)
		.then((resp) => {
			let rslt = resp.data;
			console.log(rslt);
			$("#divExt").html(`<label>기타요금(원)</label>` + rslt.total);
		})
	}

	// extSum click event
	$("#extSum").click(() => {
		console.log("extSum");

		let extcrgNo = $("#extcrgNo").val();

		extS(extcrgNo);
	})

	// extPay click event
	$("#extPay").click(() => {
		console.log("extPay");
		let extcrgNo = $("#extcrgNo").val();
		let divExt = $("#divExt").html();
		let pay1 = $("#pay1").html();

		console.log(divExt.substring(22));
		let payExt = divExt.substring(22);
		let trevId = pay1.substring(19);
		console.log(trevId);

		swal({
			  title: "정산하시겠습니까?",
			  text: "",
			  icon: "info",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
					axios.post(`${cPath}/checkout/extcPay.do`, {
					payExt:payExt,
					extcrgNo:extcrgNo
				})
				.then((resp) => {
					let rslt = resp.data;
					console.log(rslt);

					axios.get(`${cPath}/checkout/checkoutOk.do?what=${trevId}`)
					.finally(() => {
						swal("정산되었습니다.", "", "success");

						chkSys();
						chk();
						$("#extList").click();
					})
				})
			  } else {
			    swal("취소되었습니다.");
			  }
			})
	})

	// searchform submit 이벤트
	const chk = () => {
		searchform.addEventListener("submit", (e) => {
			e.preventDefault();
			let formData = new FormData(e.target);
			let data = new URLSearchParams(formData).toString();

			fetch(`${cPath}/checkout/list.do?${data}`, {
				method:"get",
				headers:{
					"accept":"application/json"
				}
			}).then(resp => {
				resp.json().then(rslt => {
					let trTags = null;
					if(rslt.checkoutList.length > 0){
						trTags = rslt.checkoutList.map(chkListUI).join("\n");
					}else{
						trTags = `
									<tr>
										<td colspan="10">퇴실 목록이 없습니다.</td>
									</tr>
								`;
					}
					chkList.innerHTML = trTags;

					chkPaging.innerHTML = rslt.pagingHTML;
				}).finally(() => {
					e.target.page.value = "";
				})
			})
		})
		searchform.requestSubmit();
	}

	chkSys();
})