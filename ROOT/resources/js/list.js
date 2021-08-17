function hide_user_create() {
	var con = document.getElementById("user_create_form");
	if (con.style.display == 'none') {
		con.style.display = 'block';
	} else {
		con.style.display = 'none';
	}
}

function hide_project_create() {        // 프로젝트 생성페이지를 보였다 안보였다 해주는 코드
    var con = document.getElementById("project_create_form"); //변수 con에 project_create_form이라는 id가 속해있는 div태그들의 정보를 가져오겠다는 소리
     if (con.style.display == 'none') {   //변수 con가  none이면 block으로 block이면 none으로 바꿔라 (jsp파일 15라인)
         con.style.display = 'block';  //프로젝트 생성 창을 뜨게 함
     } else {
         con.style.display = 'none';  //x를 눌러 프로젝트 생성 창을 사라지게 만듬
     }
}

function hide_role_create() {         //역할 생성페이지를 보였다 안보였다 해주는 코드
    var con = document.getElementById("role_create_form"); //변수 con에 role_create_form이라는 id가 속해있는 div태그들의 정보를 가져오겠다는 소리
     if (con.style.display == 'none') {   //변수 con가  none이면 block으로 block이면 none으로 바꿔라 (jsp파일 15라인)
         con.style.display = 'block';  //유저 생성 창을 뜨게 함
     } else {
         con.style.display = 'none';  //x를 눌러 유저 생성 창을 사라지게 만듬
     }
}

function hide_security_create() {        // 보안그룹 생성페이지를 보였다 안보였다 해주는 코드
    var con = document.getElementById("security_create_form"); //변수 con에 security_create_form이라는 id가 속해있는 div태그들의 정보를 가져오겠다는 소리
     if (con.style.display == 'none') {  // 변수 con가  none이면 block으로 block이면 none으로 바꿔라
         con.style.display = 'block'; // 보안그룹 생성 창을 뜨게 함
     } else {
         con.style.display = 'none'; // x를 눌러 유저 보안그룹 창을 사라지게 만듬
     }
 }

function hide_image_create() {        // 이미지 생성페이지를 보였다 안보였다 해주는 코드
    var con = document.getElementById("image_create_form"); //변수 con에 image_create_form이라는 id가 속해있는 div태그들의 정보를 가져오겠다는 소리
     if (con.style.display == 'none') {  // 변수 con가  none이면 block으로 block이면 none으로 바꿔라
         con.style.display = 'block'; // 이미지 생성 창을 뜨게 함
     } else {
         con.style.display = 'none'; // x를 눌러 이미지 생성 창을 사라지게 만듬
     }
 }

function hide_router_create() {        // 라우터 생성페이지를 보였다 안보였다 해주는 코드
    var con = document.getElementById("router_create_form"); //변수 con에 router_create_form이라는 id가 속해있는 div태그들의 정보를 가져오겠다는 소리
     if (con.style.display == 'none') {  // 변수 con가  none이면 block으로 block이면 none으로 바꿔라
         con.style.display = 'block'; // 유저 생성 창을 뜨게 함
     } else {
         con.style.display = 'none'; // x를 눌러 유저 생성 창을 사라지게 만듬
     }
 }

function hide_volume_create() {        // 볼륨 생성페이지를 보였다 안보였다 해주는 코드
    var con = document.getElementById("volume_create_form"); //변수 con에 volume_create_form이라는 id가 속해있는 div태그들의 정보를 가져오겠다는 소리
     if (con.style.display == 'none') {  // 변수 con가  none이면 block으로 block이면 none으로 바꿔라
         con.style.display = 'block'; // 유저 생성 창을 뜨게 함
     } else {
         con.style.display = 'none'; // x를 눌러 유저 생성 창을 사라지게 만듬
     }
 }

function hide_instance_create() {        // 인스턴스 생성페이지를 보였다 안보였다 해주는 코드
    var con = document.getElementById("instance_create_form"); //변수 con에 instance_create_form이라는 id가 속해있는 div태그들의 정보를 가져오겠다는 소리
     if (con.style.display == 'none') {  // 변수 con가  none이면 block으로 block이면 none으로 바꿔라
         con.style.display = 'block'; // 유저 생성 창을 뜨게 함
     } else {
         con.style.display = 'none'; // x를 눌러 유저 생성 창을 사라지게 만듬
     }
 }

$( document ).ready( function() {
	$( '.all_name' ).click( function() {
	$( '.check' ).prop( 'checked', this.checked );
    } );
} );
