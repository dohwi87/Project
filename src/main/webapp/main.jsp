<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>메인 페이지</title>
  <link rel="stylesheet" type="text/css" href="main.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
</head>
<body>
  <center>
    <h1 class = "text_font_1">메인 페이지</h1>
    <%    
    // 현재 로그인한 사용자의 정보를 가져오는 코드
    String id = (String) session.getAttribute("id");
    String name = "";
    
    try {
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wptest?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false", "root", "0000");
      Statement stmt = conn.createStatement();
      
      String query = "SELECT name FROM user_tbl WHERE id = '" + id + "'";
      ResultSet rs = stmt.executeQuery(query);
      
      if (rs.next()) {
        name = rs.getString("name");
      }
      
      rs.close();
      stmt.close();
      conn.close();
    } catch (Exception e) {
      e.printStackTrace();
      out.println("오류 발생: " + e.getMessage());
    }
    
    // 로그인한 사용자의 정보를 활용하여 메인 페이지에 환영 메시지 출력
    if (id != null && !id.isEmpty()) {
      out.println("<p>안녕하세요, " + name + "님! 로그인이 완료되었습니다.</p>");
    } else {
      out.println("<p><button class=\"w-btn w-btn-skin\" onclick=\"location.href='login.jsp'\">로그인</button></p>");
    }
    %>
    
    <!-- 로그인한 사용자에게만 보여지는 링크 -->
        <%
    if (id != null && !id.isEmpty()) {
      out.println("<p><button class=\"w-btn w-btn-skin\" onclick=\"location.href='profile.jsp'\">마이 페이지</button></p>");
      out.println("<p><button class=\"w-btn w-btn-skin\" onclick=\"location.href='genre_selection.jsp'\">장르 선택</button></p>");
      
      out.println("<p><button class=\"w-btn w-btn-skin\" onclick=\"location.href='logout.jsp'\">로그아웃</button></p>");
    } else {
      out.println("<p><button class=\"w-btn w-btn-skin\" onclick=\"location.href='register.jsp'\">회원가입</button></p>");
    }
    %>
  </center>
</body>
</html>//

