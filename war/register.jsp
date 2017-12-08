<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<style>
body, html {
	height: 100%;
	background-color: grey;
}

.card-container.card {
	max-width: 350px;
	padding: 40px 40px;
}

.btn {
	font-weight: 700;
	height: 36px;
	-moz-user-select: none;
	-webkit-user-select: none;
	user-select: none;
	cursor: default;
}

.card {
	background-color: #F7F7F7;
	padding: 20px 25px 30px;
	margin: 0 auto 25px;
	margin-top: 50px;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	-webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}

.form-signin #inputUsername, .form-signin #inputPassword {
	direction: ltr;
	height: 44px;
	font-size: 16px;
}

.form-signin input[type=password], .form-signin input[type=text],
	.form-signin button {
	width: 100%;
	display: block;
	margin-bottom: 10px;
	z-index: 1;
	position: relative;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.form-signin .form-control:focus {
	border-color: rgb(104, 145, 162);
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
}

.btn.btn-signin {
	background-color: #607D8B;
	padding: 0px;
	font-weight: 700;
	font-size: 14px;
	height: 36px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	border: none;
	-o-transition: all 0.218s;
	-moz-transition: all 0.218s;
	-webkit-transition: all 0.218s;
	transition: all 0.218s;
}

.btn.btn-signin:hover, .btn.btn-signin:active, .btn.btn-signin:focus {
	background-color: #455A64;
}
</style>
</head>

<body>
	<div class="container">
		<div class="card card-container">
			<form action="/newMember" class="form-signin " method="post">
				<input type="text" id="inputUsername" class="form-control" placeholder="Username" name="username" autofocus> 
				<input type="text" id="inputFirst" class="form-control" placeholder="First Name" name="first"> 
				<input type="text" id="inputLast" class="form-control" placeholder="Last Name" name="last"> 
				<input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password">
				<input type="password" id="inputCPassword" class="form-control" placeholder="Confirm Password" name="cpassword">
				<p id="validate-status" style="color: red;"></p>
				<button class="btn btn-lg btn-primary btn-block btn-signin " id="submit" type="submit" disabled="true">Register</button>
			</form>
		</div>
	</div>


	<!-- ユーザーがより快適にページを閲覧できるようにスクリプトに関係するものをできるだけここで書く -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<!-- パスワードの入力間違いをチェックしてくれるscript -->
	<script type="text/javascript">
	$(document).ready(function() {
	  $("#inputCPassword").keyup(validate);
	  });
	  function validate() {
	    var password = $("#inputPassword").val();
	    var cpassword = $("#inputCPassword").val();
	    if(password != cpassword){
	      $("#validate-status").text("Passwords don't match.");
	      $("#submit").prop('disabled',true);
	    }
	    else if (cpassword == null) {
	      $("#submit").prop('disabled',true);
	    }
	    else {
	        $("#validate-status").text("");
	        $("#submit").prop('disabled',false)
	    }
	  }
	</script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>