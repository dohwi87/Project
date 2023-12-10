<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>로그아웃</title>
  <link rel="stylesheet" type="text/css" href="main.css">
</head>
<body>
  <center>
    <h1>로그아웃</h1>
    <%    
    // 세션 초기화 및 로그아웃 처리
    session.invalidate();
    %>
    <p>로그아웃되었습니다.</p>
    <% 
    out.println("<p><button class=\"w-btn w-btn-skin\" onclick=\"location.href='login.jsp'\">다시 로그인</button></p>");   
    out.println("<p><button class=\"w-btn w-btn-skin\" onclick=\"location.href='main.jsp'\">메인 페이지로 이동</button></p>");
 	%>
     </center>
</body>
</html>

