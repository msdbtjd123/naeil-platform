function server_check(user_id) {
	//----------------------------------------------------------------------------------
	$.ajax({
		url : "instance_check.jsp",
		type : "POST",
		dataType : 'json',
		data : {uid: user_id}
	}).done(function(data){
		$('#dns').text(data.dns);
		if(data.dns == "Available"){
			$('#dns').attr("class",null);
			$('#dns').addClass("status_available");
			$('#dns_url').attr("href","./content.jsp?user_id="+user_id+"&id=DNS Spoofing&type=network&conid=N001");
		}else{
			$('#dns').attr("class",null);
			$('#dns_url').attr("href",null);
			$('#dns').addClass("status_unavailable");
		}

		$('#buf').text(data.buf);
		if(data.buf == "Available"){
			$('#buf').attr("class",null);
			$('#buf').addClass("status_available");
			$('#buf_url').attr("href","./content.jsp?user_id="+user_id+"&id=Syn Flooding&type=network&conid=N002");
		}else{
			$('#buf').attr("class",null);
			$('#buf_url').attr("href",null);
			$('#buf').addClass("status_unavailable");
		}

		$('#smurf').text(data.smurf);
		if(data.smurf == "Available"){
			$('#smurf').attr("class",null);
			$('#smurf').addClass("status_available");
			$('#smurf_url').attr("href","./content.jsp?user_id="+user_id+"&id=Smurf Attack&type=network&conid=N003");
		}else{
			$('#smurf').attr("class",null);
			$('#smurf_url').attr("href",null);
			$('#smurf').addClass("status_unavailable");
		}

		$('#back').text(data.back);
		if(data.back == "Available") {
			$('#back').attr("class",null);
			$('#back').addClass("status_available");
			$('#back_url').attr("href","./content.jsp?user_id="+user_id+"&id=Back Door&type=system&conid=S001");
		}else{
			$('#back').attr("class",null);
			$('#back_url').attr("href",null);
			$('#back').addClass("status_unavailable");
		}

		$('#scan').text(data.scan);
		if(data.scan == "Available") {
			$('#scan').attr("class",null);
			$('#scan').addClass("status_available");
			$('#scan_url').attr("href","./content.jsp?user_id="+user_id+"&id=Scanning Attack&type=network&conid=N002");
		}else{
			$('#scan').attr("class",null);
			$('#scan_url').attr("href",null);
			$('#scan').addClass("status_unavailable");
		}

		$('#passwd').text(data.passwd);
		if(data.passwd == "Available") {
			$('#passwd').attr("class",null);
			$('#passwd').addClass("status_available");
			$('#passwd_url').attr("href","./content.jsp?user_id="+user_id+"&id=Password Crack&type=system&conid=S003");
		}else{
			$('#passwd').attr("class",null);
			$('#passwd_url').attr("href",null);
			$('#passwd').addClass("status_unavailable");
		}

		$('#xss').text(data.xss);
		if(data.xss == "Available") {
			$('#xss').attr("class",null);
			$('#xss').addClass("status_available");
			$('#xss_url').attr("href","./content.jsp?user_id="+user_id+"&id=XSS&type=web&conid=W001");
		}else{
			$('#xss').attr("class",null);
			$('#xss_url').attr("href",null);
			$('#xss').addClass("status_unavailable");
		}

		$('#sql').text(data.sql);
		if(data.sql == "Available") {
			$('#sql').attr("class",null);
			$('#sql').addClass("status_available");
			$('#sql_url').attr("href","./content.jsp?user_id="+user_id+"&id=SQL Injectrion&type=web&conid=W002");
		}else{
			$('#sql').attr("class",null);
			$('#sql_url').attr("href",null);
			$('#sql').addClass("status_unavailable");
		}

		$('#replay').text(data.replay);
		if(data.replay == "Available") {
			$('#replay').attr("class",null);
			$('#replay').addClass("status_available");
			$('#replay_url').attr("href","./content.jsp?user_id="+user_id+"&id=Replay Attack&type=web&conid=W003");
		}else{
			$('#replay').attr("class",null);
			$('#replay_url').attr("href",null);
			$('#replay').addClass("status_unavailable");
		}
	});
}
