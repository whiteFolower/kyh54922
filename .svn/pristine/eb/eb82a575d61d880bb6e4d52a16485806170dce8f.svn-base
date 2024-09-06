/**
 *
 */

function updatelostitem(){
	var hksNo		= document.getElementById("hksNo").value;
	var hksDate		= document.getElementById("hksDate").value;
	var hksPlace	= document.getElementById("hksPlace").value;
	var hksAcquirer = document.getElementById("hksAcquirer").value;
	var hksKind		= document.getElementById("hksKind").value;
	var hksRegi 	= document.getElementById("hksRegi").value;
	var hksNote 	= document.getElementById("hksNote").value;

	$.ajax({
		url: `/pms/lostitem/lostitemUpdate.do`,
		type: "POST",
		contenType : 'application/x-www-form-urlencoded',
		data: {
			"hksNo" : hksNo,
			"hksDate" : hksDate,
			"hksPlace" : hksPlace,
			"hksAcquirer" : hksAcquirer,
			"hksKind" : hksKind,
			"hksRegi" : hksRegi,
			"hksNote" : hksNote
		},
		success : function(response){
			console.log("성공", hksNo);
		},
		error : function(error){
			console.log("에러 발생", error);
		}
	})

}

function lostitemInsert(){
	var hksDate = document.getElementById("hksDateinsert").value;
	var hksPlace = document.getElementById("hksPlaceinsert").value;
	var hksAcquirer = document.getElementById("hksAcquirerinsert").value;
	var hksKind = document.getElementById("hksKindinsert").value;
	var hksRegi = document.getElementById("hksRegiinsert").value;
	var hksNote = document.getElementById("hksNoteinsert").value;


	console.log("hksDate :", hksDateinsert);

	$.ajax ({
		url: `/pms/lostitem/lostitemInsert.do`,
		type: "POST",
		contentType: 'application/x-www-form-urlencoded',
		data:{
			"hksDate" : hksDate,
			"hksPlace" : hksPlace,
			"hksAcquirer" : hksAcquirer,
			"hksKind" : hksKind,
			"hksRegi" : hksRegi,
			"hksNote" : hksNote,
		},
			success : function(response){
				console.log("성공함");

			},
			error : function(error){
				console.log("실패!!!", error);
			}
	});
}











document.addEventListener('DOMContentLoaded', function() {
    // 모든 테이블의 링크 요소를 가져옵니다.
    const detailLinks = document.querySelectorAll('.test');

    // 각 링크 요소에 클릭 이벤트를 추가합니다.
    detailLinks.forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault();  // 기본 동작을 막습니다.

            // 링크의 data- 속성에서 정보를 가져옵니다.
            const hksNo = link.getAttribute('data-hksno');
            const hksDate = link.getAttribute('data-hksDate');
            const hksPlace = link.getAttribute('data-hksPlace');
            const hksAcquirer = link.getAttribute('data-hksAcquirer');
            const hksKind = link.getAttribute('data-hksKind');
            const hksRegi = link.getAttribute('data-hksRegi');
            const hksNote = link.getAttribute('data-hksNote');
            // 모달의 input 요소에 데이터를 설정합니다.
            document.getElementById('hksNo').value = hksNo;
            document.getElementById('hksDate').value = hksDate;
            document.getElementById('hksPlace').value = hksPlace;
            document.getElementById('hksAcquirer').value = hksAcquirer;
            document.getElementById('hksKind').value = hksKind;
            document.getElementById('hksRegi').value = hksRegi;
            document.getElementById('hksNote').value = hksNote;

            // 모달을 띄웁니다. (이 부분은 이미 data-bs-toggle로 구현됨)
						// 모달 열기
			$("#detail").modal("show");


        });
    });
});