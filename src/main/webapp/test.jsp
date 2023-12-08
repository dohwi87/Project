<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
    <h1>입력한 글</h1>
    <p>
      <% String content = request.getParameter("content"); %>
      <%= content %>
    </p>
  </center>
</body>
</html>//