document.addEventListener('DOMContentLoaded', function() {
		$('#calendar').fullCalendar({
			// 기본 옵션
			header : {
				left : 'prev,next',
				center : 'title',
				right : 'month,agendaWeek,agendaDay'
			},
			defaultDate : new Date(),
			navLinks : true,
			editable : true,
			eventLimit : true
		});

		function updateTime() {
			var now = new Date();
			var hours = now.getHours().toString().padStart(2, '0');
			var minutes = now.getMinutes().toString().padStart(2, '0');
			var seconds = now.getSeconds().toString().padStart(2, '0');

			var formattedTime = hours + ':' + minutes + ':' + seconds;

			document.getElementById('currentTime').innerHTML = formattedTime;
		}

		// 1초마다 updateTime 함수 실행
		setInterval(updateTime, 1000);

		// 페이지 로드 시 즉시 시간 표시
		updateTime();
	});
 document.querySelectorAll('.clickable-row').forEach(row => {
        row.addEventListener('click', () => {
            window.location.href = row.dataset.href;
        });
    });