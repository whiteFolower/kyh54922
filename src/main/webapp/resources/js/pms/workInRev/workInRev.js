document.addEventListener("DOMContentLoaded", function() {
    const cPath = document.body.dataset.contextPath;
    const revform = document.querySelector("#revform");
	const isMember = document.querySelector("input[name='isMemberYN']:checked");
	const memId = document.querySelector("input[name=memId]");
	const memName = document.querySelector("input[name=memName]");
	const memTel = document.querySelector("input[name=memTel]");
	const trevCarno = document.querySelector("input[name=trevCarno]");
    const roomCnt = document.querySelectorAll("input[name='roomCnt']");
    const changeRoomCnt = document.querySelector("#changeRoomCnt");
	const adult = document.querySelector("input[name='trevAdult']");
	const child = document.querySelector("input[name='trevChild']")
    const resetRooms = document.querySelector("#resetRooms");
    const revGubun = document.querySelector("#revGubun");
    const roomTypes = document.querySelectorAll(".roomTypeName");
    const roomPrices = document.querySelectorAll(".roomPrices");
    const priceArea = document.querySelector("#price-area");
    const stayDays = document.querySelector("input[name='htrevStay']");
    const chkInDay = document.querySelector("input[name='htervChkin']");
    const chkOutDay = document.querySelector("input[name='htervChkout']");
    const overview = document.querySelector("#overview");

	const roomModal = document.querySelector("#roomModal");
	const revModalConfirmBtn = document.querySelector("#rev-confirm");
	const payModal = document.querySelector("#payModal");
    const payModalConfirmBtn = document.querySelector("#pay-confirm");

	const grades = document.querySelectorAll(".grade");

	const memRank = document.querySelector("#memRank");
	const memMil = document.querySelector("#memMileage");

	grades.forEach((g) => {g.style.display = "none";})

	let payState = 0;

	let newKey = "";
    let currentRow;
	let revRoom = [];
	let rPrice = [];
	let roomKeys = null;

	memName.addEventListener("focusout", function(e){
		let ismem = document.querySelector("input[name='isMemberYN']:checked");
		grades.forEach((gs)=>{gs.style.display = "block";})

		if(ismem.value=='y'){
			axios.post(`${cPath}/workInRev/getMember.do`, {
				memName:memName.value
			}).then(res=>{
				const memberVO = res.data;
				memId.value = memberVO.memId;
				memTel.value = memberVO.memTel;
				memRank.innerText = `${memberVO.rankName}(적립률 : ${memberVO.rankMlgPer}%)`;
				memMil.innerText = `${memberVO.memMil}`
			})
		}
	})

    chkOutDay.addEventListener("change", function(e) {
        let day1 = chkInDay.value;
        let day2 = e.target.value;

        let dayDiff = 0;

        if (day1) {
            const dayIn = new Date(day1);
            const dayOut = new Date(day2);

            const diff = dayOut.getTime() - dayIn.getTime();

            dayDiff = diff / (1000 * 60 * 60 * 24);

            if (diff < 0) {
                alert("날짜 확인!");
                chkInDay.value = "";
                e.target.value = "";
            } else {
                stayDays.value = dayDiff;
            }
        }
    });

    changeRoomCnt.addEventListener("click", function(e) {
        e.preventDefault();
        let tds = "";
        let stay = stayDays.value;
        let sum = 0;
		let isMem = isMember.value;

        for (let i = 0; i < roomTypes.length; i++) {
            let price = roomPrices[i].innerHTML;
            let cnt = roomCnt[i].value;
            let multiple = price * cnt * stay;
            sum += multiple;

            if (!cnt) {
                cnt = 0;
            }
            if (cnt != 0) {
                tds += `
                    <td>${roomTypes[i].innerHTML}</td>
                    <td><span class="price">${multiple.toLocaleString()}</span>원</td>
                `;
            }
        }
        tds += `
            <td>합계</td>
            <td><span class="price">${sum.toLocaleString()}</span>원</td>
			<td>마일리지 사용액<input type="number" name="mileage" id="useMailage" value=""></td>
			<td><button type="button" id="payment-btn" data-bs-toggle="modal" data-bs-target="#payModal"
			data-payment-price="${sum}">결제</button></td>
        `;
        priceArea.innerHTML = tds;

		const paymentBtn = document.querySelector("#payment-btn");

		paymentBtn.addEventListener("click", function(e){//여기에 모달 이벤트 추가
			const modalBody = document.querySelector("#pay-modal-body");
			const payPrice = parseInt(e.target.dataset.paymentPrice);
			const useMailage = document.querySelector("#useMailage");
			console.log(useMailage)
			FetchUtils.fetchForText(`${cPath}/workInRev/checkout.do`, {
				method:"post",
				headers:{"accept":"text/html"}
			}).then(res=>{
				modalBody.innerHTML = res;

				async function main() {
					const button = document.getElementById("payment-button");
					// ------  결제위젯 초기화 ------
					const clientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm";
					const tossPayments = TossPayments(clientKey);
					// 회원 결제
					const customerKey = "gVZHWfDCF-lsoILyPnvYw";

					if(useMailage.value==""||useMailage.value==null){
						useMailage.value = 0;
					}

					const widgets = tossPayments.widgets({
						customerKey,
					});
					// 비회원 결제
					// const widgets = tossPayments.widgets({ customerKey: TossPayments.ANONYMOUS });

					// ------ 주문의 결제 금액 설정 ------
					await widgets.setAmount({
						currency: "KRW",
						value: payPrice - useMailage.value,
					});

					await Promise.all([
						// ------  결제 UI 렌더링 ------
						widgets.renderPaymentMethods({
							selector: "#payment-method",
							variantKey: "DEFAULT",
						}),
						// ------  이용약관 UI 렌더링 ------
						widgets.renderAgreement({ selector: "#agreement", variantKey: "AGREEMENT" }),
					]);


					// ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
					button.addEventListener("click", async function() {
						widgets.requestPayment({
							orderId: "dnqvjMYSSmibSPJHnyNPZ",
							orderName: "객실 결제정보",
						}).then((res)=>{
							if(res){
								payState = 1;
								//payModal.hide.bs.modal();//모달 닫기 이벤트 발생
							}
							swal("결제가 완료되었습니다", "", {
								icon:"success",
								buttons:{
									confirm:{
										className:"btn btn-success",
									},
								}
							})
						}).catch((err)=>{
							console.log(err)
						})
					});
				}

				main();


			});

		});

































        let chkIn = chkInDay.value;
        let chkOut = chkOutDay.value;
        let roomNames = [];

        roomCnt.forEach((r) => {
            revRoom.push(parseInt(r.value) || 0);
        });

        axios.post(`${cPath}/workInRev/getRoomNumber.do`, {
            revRoom: revRoom,
			isMem:isMem,
            htrevChkin: chkIn,
            htrevChkout: chkOut
        })
        .then(function(res) {
            console.log(res.data);
			console.log("방 : ", revRoom)
			newKey = res.data.newKey;
			roomKeys = res.data.revRoomIds;
			memId.value = res.data.memKey;
			console.log(roomKeys);

            let posRooms = res.data.possibleRoomList;
            let rooms = [];
            for (let i = 1; i <= 5; i++) {
                rooms[i] = posRooms.filter(r => r.roomtypeId === String(i)).map(r => r.roomId);
            }

            roomTypes.forEach((rs) => {
                roomNames.push(rs.innerText);
            });

            let roomCntValues = Array.from(roomCnt).map(r => parseInt(r.value) || 0);
            let roomTypeNames = Array.from(document.querySelectorAll(".roomTypeName")).map(rt => rt.innerHTML);

            overview.innerHTML = "";

			roomPrices.forEach((rp) => {
				rPrice.push(rp.innerText);
			})

			console.log("rprice : ", rPrice);

            roomCntValues.forEach((count, index) => {
                if (count > 0) {
                    for (let i = 0; i < count; i++) {
						console.log("for in : ", rPrice);
						console.log("rp[] : ", rPrice[index]);
                        let row = `
                            <tr>
                                <td>${roomTypeNames[index]}</td>
                                <td><button type="button" class="sel-room" data-room-type="${index}"
									data-bs-toggle="modal" data-bs-target="#roomModal">
									선택</button></td>
                                <td class="roomNumber" data-rns="${index+1}" data-prs="${rPrice[index]}"></td>
                            </tr>
                        `;
                        overview.innerHTML += row;
                    }
                }
            });

            let btns = document.querySelectorAll(".sel-room");

            btns.forEach(btn => {
                btn.addEventListener("click", function() {
                    currentRow = this.parentNode.parentNode; // Store the row where the button was clicked
                    let roomTypeIndex = this.getAttribute("data-room-type");
                    let modalBody = roomModal.querySelector("#rev-modal-body");
                    let roomList = rooms[parseInt(roomTypeIndex) + 1];

                    // Function to chunk array into chunks of size
                    function chunkArray(array, size) {
                        const result = [];
                        for (let i = 0; i < array.length; i += size) {
                            result.push(array.slice(i, i + size));
                        }
                        return result;
                    }

                    // Create HTML for modal body with rooms in chunks of 10
                    let roomChunks = chunkArray(roomList, 5);
                    let modalContent = `
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>선택</th>
                                    <th>객실 번호</th>
                                </tr>
                            </thead>
                            <tbody>
                                ${roomChunks.map(chunk => `
                                    <tr>
                                        ${chunk.map(roomId => `
                                            <td><input type="radio" name="roomId" value="${roomId}"></td>
                                            <td class="roomIds">${roomId}</td>
                                        `).join('')}
                                    </tr>
                                `).join('')}
                            </tbody>
                        </table>
                    `;
                    modalBody.innerHTML = modalContent;
                });
            });

            // Handle modal confirm button click
            revModalConfirmBtn.addEventListener("click", function() {
                let selectedRoomId = document.querySelector("input[name='roomId']:checked");
                if (selectedRoomId) {
                    let selectedValue = selectedRoomId.value;
                    let roomNumberCell = currentRow.querySelector(".roomNumber");
                    roomNumberCell.innerHTML = selectedValue;
                }
            });

        }).catch(function(err) {
            console.log(err);
        });
    });

    resetRooms.addEventListener("click", function(e) {
        roomCnt.forEach((r) => { r.value = ""; });
        priceArea.innerHTML = "";
        overview.innerHTML = "";
    });

	//룸 가격 배열 roomPrices foreach로 돌아서 배열 하나 만들고
	//revRoom 내가 선택한 룸 타입별 개수
	// for문 돌려서 총액 산출해서 같이보내기

    revform.addEventListener("submit", function(e) {
        e.preventDefault();
        let url = e.target.action;
		let roomIds = document.querySelectorAll(".roomNumber");
		let roomData = [];//객실 호수들
		let memberId = memId.value;
		let memberName = memName.value;
		let carNumber = trevCarno.value;
		let trevAdult = adult.value;
		let trevChild = child.value;
		let trevRtype = revGubun.value;
		let htrevchkin = chkInDay.value;
        let htrevchkout = chkOutDay.value;
		let htrevStay = stayDays.value;
		let htrevTprice = 0;


		for(let i=0; i<rPrice.length; i++){
			htrevTprice += parseInt(rPrice[i])*parseInt(revRoom[i])*htrevStay;
		}

		roomIds.forEach((ids, index)=>{
			console.log("idsPrs : ", ids.dataset.prs)//ids.dataset.prs가 문제 : 하나만 들어감
			let obj = {
				"revroomId": roomKeys[index],
				"roomId" : ids.innerText,
				"htrevId" : newKey,
				"roomtypeId" : ids.dataset.rns,
				"revroomPrice" : ids.dataset.prs
			};
			roomData.push(obj);
		})//roomData : 예약 대상이되는 room_id

		console.log("roomData : ", roomData)
		console.log("roomKeys : ", roomKeys)
		/*
		axios.post(`${url}`, {
			trevId:newKey,
			memId:memberId,
			memName:memberName,
			memTel:memTel.value,
			trevCarno:carNumber,
			trevAdult:trevAdult,
			trevChild:trevChild,
			trevRtype:trevRtype,
			htrevChkin:htrevchkin,
			htrevChkout:htrevchkout,
			htrevStay:htrevStay,
			htrevTprice:htrevTprice,
			roomData:roomData,
			revRoomIds:roomKeys
		}).then(function(result){
			console.log("res : ", result)
		}).catch(function(error){
			console.log(error);
		})
*/
    });
});
