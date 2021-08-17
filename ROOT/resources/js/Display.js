/**
 * 
 * 
 */


function Hide_display() {
	var con = document.getElementById("login_form_display");
		
	if(con.style.display=='none') {
		con.style.display='block';
	}else{
		con.style.display='none';
	}	
}

function free_pass_Hide_display() {
	var con = document.getElementById("freepass_form_display");
		
	if(con.style.display=='none') {
		con.style.display='block';
	}else{
		con.style.display='none';
	}	
}

function sign_up_form_display() {
	var con = document.getElementById("sign_up_form_display");
		
	if(con.style.display=='none') {
		con.style.display='block';
	}else{
		con.style.display='none';
	}	
}

function Search_Hide_display() {
	var con = document.getElementById("Search_form_display");
		
	if(con.style.display=='none') {
		con.style.display='block';
	}else{
		con.style.display='none';
	}	
}
function show_time(productid) {				
	var vid = document.getElementById("vid");  
    var currentTime = Math.floor(vid.currentTime,3);

    $.ajax({
        url : "timedb.jsp",
        type : "POST",
        dataType : 'json',
        data : {currentTime: currentTime, productid : productid}
    });
}

function show_time(productid) {				
    var vid = document.getElementById("vid");  
    var currentTime = Math.floor(vid.currentTime,3);

    $.ajax({
        url : "time_db_insert.jsp",
        type : "POST",
        dataType : 'json',
        data : {currentTime: currentTime, productid : productid}
    });
}





