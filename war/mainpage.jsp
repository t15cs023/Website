<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="util.PMF"%>
<%@ page import="entity.Bread"%>
<%@ page import="javax.jdo.PersistenceManager"%>
<%@ page import="javax.jdo.Query"%>
<%@ page import="java.text.MessageFormat"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>パン注文サイト</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<style>
a {
	color: grey;
}

.nav-tabs>li>a.active, .nav-tabs>li>a:hover, .nav-tabs>li>a:focus {
	color: black;
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
		if (session.getAttribute("username") == null || !session.getAttribute("usertype").equals(1)) {
			//ログインしていなければ、ログイン画面に戻す
			response.sendRedirect("/");
		}
	%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> 
	<a class="navbar-brand" href="/mainPage">パン屋</a>
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

	<!-- NavTabStart -->
	<ul class="nav nav-tabs nav-fill" role="tablist">
		<li class="nav-item"><a class="nav-link active" data-toggle="tab"
			href="#souzai" role="tab">惣菜パン</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#kashi" role="tab">菓子パン</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#chouri" role="tab">調理パン</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#shoku" role="tab">食パン</a></li>
	</ul>
	<%!
	private void printBread(List<Bread> b, javax.servlet.jsp.JspWriter out) {
		try {
			out.println("<div class=\"container-fluid\">");
			int i = 0;
			while (true) {
				out.println("<div class=\"row\">");
				for (int j = 0; j < 4; j++, i++) {
					if (i == b.size())
						break;
					out.println("<div class=\"col-lg-3 col-md-6 col-sm-12\">");
					out.println("<p>" + b.get(i).getProductName() + "</p>");
					out.println("<p>" + b.get(i).getDescription() + "</p>");
					out.println("<p>" + b.get(i).getValue() + "</p>");
					out.println("</div>");
				}
				out.println("</div>");
				if (i == b.size())
					break;
			}
			out.println("</div>");
		} catch (Exception eek) {

		}
	}
	%>
	<!-- Tab panes -->
	<div class="tab-content">
		<div class="tab-pane active" id="souzai" role="tabpanel">
			<%
				PersistenceManager pm = null;
				try {
					pm = PMF.get().getPersistenceManager();
					Query query = pm.newQuery(Bread.class);
					query.setFilter("category == 0");
					List<Bread> bread = (List<Bread>) query.execute();
					printBread(bread, out);
			%>
		</div>
		<div class="tab-pane" id="kashi" role="tabpanel">
			<%
				query = pm.newQuery(Bread.class);
				query.setFilter("category == 1");
				bread = (List<Bread>) query.execute();
				printBread(bread, out);
			%>
		</div>
		<div class="tab-pane" id="chouri" role="tabpanel">
			<%
				query.setFilter("category == 2");
				bread = (List<Bread>) query.execute();
				printBread(bread, out);
			%>
		</div>
		<div class="tab-pane" id="shoku" role="tabpanel">
			<%
				query.setFilter("category == 3");
				bread = (List<Bread>) query.execute();
				printBread(bread, out);
				} finally {
					if (pm != null && !pm.isClosed())
						pm.close();
				}
			%>
		</div>
	</div>
	<!-- NavTabEnd -->

	<!-- ユーザーがより快適にページを閲覧できるようにスクリプトに関係するものをできるだけここで書く -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>