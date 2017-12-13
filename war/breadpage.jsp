<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>パン屋編集ページ</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<style>
a {
  color:grey;
}
.navbar {
  margin-bottom: 20px;
}
.nav-tabs>li>a.active,
.nav-tabs>li>a:hover,
.nav-tabs>li>a:focus {
  color:black;
}
body {
  position: relative;
}
.footer {
  position: absolute;
  bottom: 0;
  width: 100%;
  height: 60px; /* Set the fixed height of the footer here */
  line-height: 60px; /* Vertically center the text there */
  background-color: #f5f5f5;
}
#logout:active:focus {
	color: #ffffff;
	background-color: #000000;
}
#selection:hover {
  color:black
}
</style>
</head>
<body>
	<%
		//ログアウト後に戻る操作が出来ないようにする
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		//ログインせずにメインページを表示させないようにする
		if(session.getAttribute("username")==null || !session.getAttribute("usertype").equals(2)) {
			//ログインしていなければ、ログイン画面に戻す
			response.sendRedirect("/");
		}
	%>
	<!-- ここからnavbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> <a
		class="navbar-brand" href="/breadPage">パン屋トップ</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active">
	          <a class="nav-link" href="/breadPage">パンリストを編集</a>
	        </li>
	        <li class="nav-item active">
	          <a class="nav-link" href="#">リンク</a>
	        </li>
		</ul>
		<div class="nav-item" style="color: white;">こんにちは ${first}</div>
		<ul class="navbar-nav navbar-right">
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> アカウント </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown" style="left: -50%;">
					<a class="dropdown-item" href="#">カート</a> 
					<a class="dropdown-item" href="#">注文履歴</a>
					<div class="dropdown-divider"></div>
					<form action="/logout">
						<button id="logout" type="submit" value="Logout" class="dropdown-item">ログアウト</button>
					</form>
				</div>
			</li>
		</ul>
	</div>
	</nav>
	<!-- ここまでnavbar -->
	
	<!-- ここからコンテンツを表示 -->
	<div class="container">
	    <div class="jumbotron">
	      <h3>パンリスト編集</h3>
	      <a href="/addbread" id="selection">パンを追加</a><br>
	      <a href="#" id="selection">パンを消去</a><br>
	      <a href="/listBread" id="selection">パンリスト一覧・表示非表示・編集</a>
	    </div>
  	</div>
  	<!-- ここまでコンテンツを表示 -->
  	
	<!-- ユーザーがより快適にページを閲覧できるようにスクリプトに関係するものをできるだけここで書く -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>