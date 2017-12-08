<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BreadStore</title>
<!-- bootstrapを使うため、既にwarフォルダーに置いておいたresourceのcssに入っているbootstrap cssファイルをここで参照する -->
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
<%
	HttpSession sessions = request.getSession();
	if(sessions.getAttribute("first") != null)
		response.sendRedirect("/mainPage");
%>
<body>

	<div class="container">
		<div class="card card-container">
			<form action="/login" class="form-signin" method="post">

				<!-- ログイン成功しなかった場合でユーザーに示すエラーを取ってきて表示する. nullの場合では何も表示されない. -->
				<%
					String res = (String) request.getAttribute("msg");
					if (res != null)
						out.print(res + "\n");
				%>
				<input type="text" id="inputUsername" class="form-control" placeholder="ユーザー名" name="uname" autofocus> <input
					type="password" id="inputPassword" class="form-control" placeholder="パスワード" name="pass">
				<button class="btn btn-lg btn-primary btn-block btn-signin"
					type="submit">ログイン</button>
			</form>
			<form action="/register">
				<button class="btn btn-lg btn-primary btn-block btn-signin"
					type="submit">新規登録</button>
			</form>
		</div>
	</div>


	<!-- ユーザーがより快適にページを閲覧できるようにスクリプトに関係するものをできるだけここで書く -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>