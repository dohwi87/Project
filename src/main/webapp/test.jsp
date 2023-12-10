<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
    <h1>입력한 글</h1>
    <p>
      <% 
      request.setCharacterEncoding("utf-8"); 
      String content = request.getParameter("content"); 
      %>
      <%= content %>
    </p>
  </center>
</body>
</html>