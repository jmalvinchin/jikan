$(document).ready(function(){
    var start_year = $("#start_year").val();
    var start_month = $("#start_month").val();
    var start_day = $("#start_day").val();
    var start_hour = $("#start_hour").val();
    var start_min = $("#start_min").val();
    var start_sec = $("#start_sec").val();
    var start_time = new Date(start_year, start_month, start_day, start_hour, start_min, start_sec, 0);
    var diff

    if ($("#end_time").val() == "") {
        var current_time = new Date();
        diff = current_time.getTime() - start_time.getTime();
        $('#demo1').stopwatch({startTime: diff}).stopwatch('start');
    }

    $('#clock_hou').jClocksGMT({
        offset: '+8', 
        hour24: false,
        digital: true
    });
});