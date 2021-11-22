var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var editIdol = $('#edit-idol');
var editGroup = $('#edit-group');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end) {

    $("#contextMenu").hide(); //메뉴 숨김

    modalTitle.html('새로운 일정');
    editTitle.val('');
    editStart.val(start);
    editEnd.val(end);
    editDesc.val('');
    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');
};

//새로운 일정 저장버튼 클릭
$('#save-event').unbind();
$('#save-event').on('click', function () {

    var eventData = {
        idol: editIdol.val(),
        group: editGroup.val(),
        title: editTitle.val(),
        start: editStart.val(),
        end: editEnd.val(),
        description: editDesc.val(),
        backgroundColor: editColor.val(),
        textColor: '#ffffff',
        allDay: false
    };

    if (eventData.start > eventData.end) {
        alert('끝나는 날짜가 앞설 수 없습니다.');
        return false;
    }

    if (eventData.title === '') {
        alert('일정명은 필수입니다.');
        return false;
    }

    var realEndDay;

    if (editAllDay.is(':checked')) {
        eventData.start = moment(eventData.start).format('YYYY-MM-DD');
        //render시 날짜표기수정
        eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
        //DB에 넣을때(선택)
        realEndDay = moment(eventData.end).format('YYYY-MM-DD');

        eventData.allDay = true;
    }

    $("#calendar").fullCalendar('renderEvent', eventData, true);
    eventModal.find('input, textarea').val('');
    editAllDay.prop	('checked', false);
    eventModal.modal('hide');
    
    console.log(eventData);
    
    //새로운 일정 저장
    $.ajax({
    	url: "calRegister.pick",
        type: "get",
        data: {
        	"idol" : eventData.idol,
            "group" : eventData.group,
            "title" : eventData.title,
            "start" : eventData.start,
            "end" : eventData.end,
            "description" : eventData.description,
            "backgroundColor" : eventData.backgroundColor,
//            textColor: '#ffffff',
            "allDay" : eventData.allDay
           },
        dataType : "json",
        success: function (response) {
        	if(response == "success"){
        		$('#calendar').fullCalendar('removeEvents');
        		$('#calendar').fullCalendar('refetchEvents');
        		consol.log(eventData);
        	}
        }
    });
});