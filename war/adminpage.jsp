<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <!-- Required meta tags -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="resources/css/bootstrap.min.css">
</head>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

if(!session.getAttribute("username").equals("admin")) {
	response.sendRedirect("/");
}
%>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/adminPage">発注担当者トップ</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" >
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
      </ul>
      <div id="welcomemsg" class="nav-item">
        Welcome $(first)
      </div>
      <ul class="navbar-nav navbar-right">
        <li class="nav-item dropdown active" >
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">
            Account
          </a>
          <div class="dropdown-menu" style="left:-50%;">
            <form action=/logout>
              <button id="logout" type="submit" class="dropdown-item">Logout</button>
            </form>
          </div>
        </li>
      </ul>
    </div>
  </nav>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js" ></script>
</body>
</html>