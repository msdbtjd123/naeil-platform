$(document).ready(function(){
    // 팝업 검은부분 클릭
    $('#layer_popup').click(function(){
        $(this).hide();
        $('#popup_window').children().css("display", "none");
        $('#popup_window').css("display", "none");
        $('#voice_popup').css("display", "none");
        popup_listening = false;
    });

    // 팝업 X버튼 클릭
    $('#popup_close_button').click(function(){
        $("#layer_popup").hide();
        $('#popup_window').children().css("display", "none");
        $('#popup_window').css("display", "none");
    });

	/*
    // 로그인/로그아웃 클릭
    $("#login-out_btn").click(function(){
        var con = document.getElementById("user_signup_form");
        if (con.style.display == 'none') {
                con.style.display = 'block';
        } else {
                con.style.display = 'none';
        }	
    });
    
    // 회원가입/마이페이지 클릭
    $("#signup-mypage_btn").click(function(){
    });
    
    function popup_on(job){
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
        
        $('#layer_popup').css({'width':maskWidth, 'height':maskHeight});
        $('#layer_popup').fadeTo("slow", 0.8);
        
        $('#'+job).css("display", "block");
        $('#popup_window').css("display", "block");
        $('#popup_window span').css("display", "block");
    }
    */
   var today = new Date();
   var temp = new Date();
    $("#calender .dates").each(function(i) {
        var days = ['일', '월', '화', '수', '목', '금', '토'];
        temp.setDate(today.getDate() + i);
        var now_day = days[temp.getDay()];
        var texts = "<span style='font-size:12px'>"+now_day + "</span><br>";
        texts = texts + "<span style='font-size:22px'>"+temp.toISOString().substring(8, 10) + "</span><br>";
        texts = texts + "<span style='font-size:12px'>" +temp.toISOString().substring(0, 4);
        texts = texts + "." + temp.toISOString().substring(5, 7) + "</span>";
        $(this).html(texts);
    });
});

function show_time(play_video_id) {				
    var vid = document.getElementById("vid");  
    var currentTime = Math.floor(vid.currentTime,3);
	//console.log(currentTime);
	//console.log(play_video_id);

    $.ajax({
        url : "video_time.jsp",
        type : "POST",
        dataType : 'json',
        data : {currentTime: currentTime, play_video_id : play_video_id}
    });
}


