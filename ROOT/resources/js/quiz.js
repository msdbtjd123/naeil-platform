$(document).ready(function(){
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=answer]").click(function(){
		console.log('click');
		var button_joinus = document.getElementById('next_button'); 
		console.log(button_joinus);
		button_joinus.disabled = false;
    });
});

