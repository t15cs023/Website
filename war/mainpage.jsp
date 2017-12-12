<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>パン注文サイト</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<style>
a {
  color:grey;
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
</style>
</head>
<body>
	<%
		//ログアウト後に戻る操作が出来ないようにする
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		//ログインせずにメインページを表示させないようにする
		if(session.getAttribute("username")==null || !session.getAttribute("usertype").equals(1)) {
			//ログインしていなければ、ログイン画面に戻す
			response.sendRedirect("/");
		}
	%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> <a
		class="navbar-brand" href="/mainPage">パン屋</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
		</ul>
		<div class="nav-item" style="color: white;">こんにちは ${first}</div>
		<ul class="navbar-nav navbar-right">
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> アカウント </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown" style="left: -50%;">
					<a class="dropdown-item" href="#">カート</a> <a class="dropdown-item" href="#">注文履歴</a>
					<div class="dropdown-divider"></div>
					<form action="/logout">
						<button id="logout" type="submit" value="Logout" class="dropdown-item">ログアウト</button>
					</form>
				</div>
			</li>
		</ul>
	</div>
	</nav>

	<!-- NavTabStart -->
	<ul class="nav nav-tabs nav-fill" role="tablist">
		<li class="nav-item"><a class="nav-link active" data-toggle="tab"
			href="#souzai" role="tab">惣菜パン</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#kashi" role="tab">菓子パン</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#shoku" role="tab">食パン</a></li>
	</ul>

	<!-- Tab panes -->
  <div class="tab-content">
    <div class="tab-pane active" id="souzai" role="tabpanel">
      <div class="container-fluid">
        <!-- rows and contents should be dynamic in order to be compatible with n numbers of bread in a said category -->
        <div class="row">
          <div class="col-lg-3 col-md-6 col-sm-12">
            <p>Lorem ipsum dolor sit amet, propriae apeirian scriptorem ei has. Malorum nominavi luptatum at est, eam ex causae gloriatur. Nulla consul periculis cu eam, pro cu simul contentiones. Ius no solum scribentur. Te velit quaerendum quo, sit autem intellegam conclusionemque eu, aliquid iudicabit has ex. Vis cu cibo movet dolorem. In noster impedit per.</p>
          </div>
          <div class="col-lg-3 col-md-6 col-sm-12">
            <p>Lorem ipsum dolor sit amet, propriae apeirian scriptorem ei has. Malorum nominavi luptatum at est, eam ex causae gloriatur. Nulla consul periculis cu eam, pro cu simul contentiones. Ius no solum scribentur. Te velit quaerendum quo, sit autem intellegam conclusionemque eu, aliquid iudicabit has ex. Vis cu cibo movet dolorem. In noster impedit per.</p>
          </div>
          <div class="col-lg-3 col-md-6 col-sm-12">
            <p>Lorem ipsum dolor sit amet, propriae apeirian scriptorem ei has. Malorum nominavi luptatum at est, eam ex causae gloriatur. Nulla consul periculis cu eam, pro cu simul contentiones. Ius no solum scribentur. Te velit quaerendum quo, sit autem intellegam conclusionemque eu, aliquid iudicabit has ex. Vis cu cibo movet dolorem. In noster impedit per.</p>
          </div>
          <div class="col-lg-3 col-md-6 col-sm-12">
            <p>Lorem ipsum dolor sit amet, propriae apeirian scriptorem ei has. Malorum nominavi luptatum at est, eam ex causae gloriatur. Nulla consul periculis cu eam, pro cu simul contentiones. Ius no solum scribentur. Te velit quaerendum quo, sit autem intellegam conclusionemque eu, aliquid iudicabit has ex. Vis cu cibo movet dolorem. In noster impedit per.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-3 col-md-6 col-sm-12">
            <p>Lorem ipsum dolor sit amet, propriae apeirian scriptorem ei has. Malorum nominavi luptatum at est, eam ex causae gloriatur. Nulla consul periculis cu eam, pro cu simul contentiones. Ius no solum scribentur. Te velit quaerendum quo, sit autem intellegam conclusionemque eu, aliquid iudicabit has ex. Vis cu cibo movet dolorem. In noster impedit per.</p>
          </div>
          <div class="col-lg-3 col-md-6 col-sm-12">
            <p>Lorem ipsum dolor sit amet, propriae apeirian scriptorem ei has. Malorum nominavi luptatum at est, eam ex causae gloriatur. Nulla consul periculis cu eam, pro cu simul contentiones. Ius no solum scribentur. Te velit quaerendum quo, sit autem intellegam conclusionemque eu, aliquid iudicabit has ex. Vis cu cibo movet dolorem. In noster impedit per.</p>
          </div>
          <div class="col-lg-3 col-md-6 col-sm-12">
            <p>Lorem ipsum dolor sit amet, propriae apeirian scriptorem ei has. Malorum nominavi luptatum at est, eam ex causae gloriatur. Nulla consul periculis cu eam, pro cu simul contentiones. Ius no solum scribentur. Te velit quaerendum quo, sit autem intellegam conclusionemque eu, aliquid iudicabit has ex. Vis cu cibo movet dolorem. In noster impedit per.</p>
          </div>
          <div class="col-lg-3 col-md-6 col-sm-12">
            <p>Lorem ipsum dolor sit amet, propriae apeirian scriptorem ei has. Malorum nominavi luptatum at est, eam ex causae gloriatur. Nulla consul periculis cu eam, pro cu simul contentiones. Ius no solum scribentur. Te velit quaerendum quo, sit autem intellegam conclusionemque eu, aliquid iudicabit has ex. Vis cu cibo movet dolorem. In noster impedit per.</p>
          </div>
        </div>
      </div>
    </div>
    <div class="tab-pane" id="kashi" role="tabpanel">b</div>
    <div class="tab-pane" id="shoku" role="tabpanel">c</div>
  </div>
	<!-- NavTabEnd -->

	<!-- ユーザーがより快適にページを閲覧できるようにスクリプトに関係するものをできるだけここで書く -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>