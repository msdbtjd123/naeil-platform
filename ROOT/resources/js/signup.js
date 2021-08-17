/*회원가입 입력값 체크*/
$(function(){
        $("form").validate({
            //규칙
            rules: {
                signup_id: {
                    required : true,
                    minlength : 4
                },
                signup_pw: {
                    required : true,
                    minlength : 3
                },
                signup_pw_check: {
                    required : true,
                    minlength : 3
                },
				signup_belong: {
                    required : true
				}
            },
            //규칙체크 실패시 출력될 메시지
            messages : {
                signup_id: {
                    required : "아이디를 입력해주세요.",
                    minlength : "최소 4글자이상이어야 합니다"
                },
                signup_pw: {
                    required : "패스워드를 입력해주세요.",
                    minlength : "최소 3글자이상이어야 합니다"
                },
                signup_pw_check: {
                    required : "패스워드를 재입력해주세요.",
                    minlength : "최소 {3}글자이상이어야 합니다"
                },
				signup_belong: {
                    required : "전공을 선택해주세요."
				}
            }
        });
})
