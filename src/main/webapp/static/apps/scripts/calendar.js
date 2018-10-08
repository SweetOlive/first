var AppCalendar = function() {

    return {
        // main function to initiate the module
        init: function() {
            this.initCalendar();
        },

        initCalendar: function() {

            if (!jQuery().fullCalendar) {
                return;
            }

            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();

            var h = {};

            
                if ($('#calendar').parents(".portlet").width() <= 720) {
                    $('#calendar').addClass("mobile");
                    h = {
                        left: 'title, prev, next',
                        center: '',
                        right: 'today,month,agendaWeek,agendaDay'
                    };
                } else {
                    $('#calendar').removeClass("mobile");
                    h = {
                        left: 'title',
                        center: '',
                        right: 'prev,next,today,month,agendaWeek,agendaDay'
                    };
                }
            
            // predefined events
        

            $('#calendar').fullCalendar('destroy'); // destroy the calendar
            $('#calendar').fullCalendar({ // re-initialize the calendar
                header: h,
                defaultView: 'month', // change default view with available
										// options from
										// http://arshaw.com/fullcalendar/docs/views/Available_Views/
                slotMinutes: 15,
                editable: false,
                buttonText: {
                  today: '今日',
                  month: '月',
                  week: '周',
                  day: '日' 
                },

                dayNames: ["星期日", "星期一", "星期二", 　　　　// 设置星期简称
	                          "星期三", "星期四", "星期五", "星期六"
		                      ],

	             dayNamesShort: ["星期日", "星期一", "星期二", 　　　　// 设置星期简称
	                          "星期三", "星期四", "星期五", "星期六"
	                      ],

	                      monthNames: ["1月", "2月", "3月", "4月", 　// 设置月份名称，中英文均可
	                                   "5月", "6月", "7月", "8月", "9月",
	                                   "10月", "11月", "12月"
	                               ],
	                      monthNamesShort: ["1月", "2月", "3月", "4月", 　// 设置月份名称，中英文均可
	 	                                   "5月", "6月", "7月", "8月", "9月",
		                                   "10月", "11月", "12月"
		                               ],

                   views: {
                       month: { // name of view
                           titleFormat: 'YYYY年 MMMM'
                           // other view-specific options here
                       },
                       week: {
                     	  titleFormat: 'YYYY年 MMMM (D日) '
                       },
                       day: {
                     	  titleFormat: ' YYYY年 MMMM D日'
                       }
                   }, 
                droppable: true, // this allows things to be dropped onto the
									// calendar !!!
                drop: function(date, allDay) { // this function is called when
												// something is dropped

                    // retrieve the dropped element's stored Event Object
                    var originalEventObject = $(this).data('eventObject');
                    // we need to copy it, so that multiple events don't have a
					// reference to the same object
                    var copiedEventObject = $.extend({}, originalEventObject);

                    // assign it the date that was reported
                    copiedEventObject.start = date;
                    copiedEventObject.allDay = allDay;
                    copiedEventObject.className = $(this).attr("data-class");

                    // render the event on the calendar
                    // the last `true` argument determines if the event "sticks"
					// (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                    $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

                    // is the "remove after drop" checkbox checked?
                    if ($('#drop-remove').is(':checked')) {
                        // if so, remove the element from the "Draggable Events"
						// list
                        $(this).remove();
                    }
                },
                events: [{
                    title: 'Repeating Event',
                    start: new Date(y, m, d - 3, 16, 0),
                    allDay: false,
                    backgroundColor: App.getBrandColor('red')
                }, {
                    title: 'Repeating Event',
                    start: new Date(y, m, d + 4, 16, 0),
                    allDay: false,
                    backgroundColor: App.getBrandColor('green')
                }, {
                    title: 'Meeting',
                    start: new Date(y, m, d, 10, 30),
                    allDay: false,
                }]
            });

        }

    };

}();

jQuery(document).ready(function() {    
   AppCalendar.init(); 
});