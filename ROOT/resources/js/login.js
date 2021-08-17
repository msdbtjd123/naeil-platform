/*패스워드 암호화 후 전송*/
function Convert_send(){
	var shaPw = CryptoJS.SHA256($('#password').val()).toString();
	document.getElementById("password").value = shaPw;
	$("#login_form").submit()
}

/*회원가입 입력값 체크*/
$(function(){
	$("form").validate({
		//규칙
		rules: {
			userid: {
				required : true,
				minlength : 4
			},
			password: {
				required : true,
				minlength : 3
			}
		},
		//규칙체크 실패시 출력될 메시지
		messages : {
			userid: {
				required : "아이디를 입력해주세요.",
				minlength : ""
			},
			password: {
				required : "패스워드를 입력해주세요.",
				minlength : "최소 3글자이상이어야 합니다"
			}
		}
	});
})
