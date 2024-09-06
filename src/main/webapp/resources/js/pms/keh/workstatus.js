let empId;

document.addEventListener('DOMContentLoaded', function() {
    const empIdElement = document.getElementById('currentUserId');
    if(empIdElement && empIdElement.value){
        empId = empIdElement.value;
        initializeCalendar();
    } else {
        console.log("아이디 없음");
    }
});

function initializeCalendar() {
    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next',
            center: 'title',
            right: 'month,agendaWeek',
        },
        firstDay: 7,
        defaultDate: new Date(),
        navLinks: true,
        editable: true,
        eventLimit: true,
        height: 800,
        locale: 'ko',
        events: function(start, end, timezone, callback) {
            worktime(start, end, callback);
        },
    });
}

// DB에서 받아온거 캘린더 모양으로 출력
function worktime(start, end, callback){
    $.ajax({
        url:'/pmsworkstatus/worktime',
        method : 'GET',
        data: {
            start: start.format('YYYY-MM-DD'),
            end: end.format('YYYY-MM-DD'),
            empId: empId // 사용자 ID 추가
        },
        success: function(response) {
            let events = response.map(function(e) {
                return {
                    title: formatEventTitle(e),
                    start: e.workDate + 'T' + e.workStart,
                    end: e.workEnd ? e.workDate + 'T' + e.workEnd : null,
                    allDay: false,
                    color: getEventColor(e.workStatus) // 이벤트 색상 지정
                };
            });
			console.log("체크");
            callback(events);
        },
        error: function(xhr, status, error) {
           console.error("Error fetching work schedule:", error);
            swal('근무일정 불러오기 실패', "", "warning");
        }
    });
}

function formatEventTitle(event) {
    let title = event.workStatus + ': ' + formatTime(event.workStart);
    if (event.workEnd) {
        title += ' - ' + formatTime(event.workEnd);
    }
    return title;
}

function formatTime(timeString) {
    return timeString.substring(0, 5); // HH:mm 형식으로 변환
}

function getEventColor(workStatus) {
    switch(workStatus) {
        case '출근':
            return '#4CAF50'; // 녹색
        case '퇴근':
            return '#F44336'; // 빨간색
        default:
            return '#2196F3'; // 파란색
    }
}

function updateWorkStatusCalendar() {
    if ($('#calendar').fullCalendar) {
        $('#calendar').fullCalendar('refetchEvents');
    } else {
        console.error('캘린더가 초기화되지 않았습니다.');
    }
}