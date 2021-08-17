function Instructor_Hide_display() {
	var con = document.getElementById("instructor_form_display");
		
	if(con.style.display=='none') {
		con.style.display='block';
	}else{
		con.style.display='none';
	}	
}

function Instructor_check() {
	var returnValue = confirm('강사등록을 하시겠습니까?');
	if (returnValue == true){
		$.ajax({
			url : "admin_registry.jsp",
			type : "POST",
			dataType : 'json',
			data : {belong: "admin"}
		});
		alert("완료되셨습니다.");
	}
}
