<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>프로필 페이지</title>
  <link rel="stylesheet" type="text/css" href="main.css">
  <link rel="stylesheet" type="text/css" href="profile.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
</head>
<body>
<center>
    <h1 class="text_font_1" align = "center">프로필 페이지</h1>
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
    %>
    
    <div class="box1">
      <p><strong>아이디:</strong> <%=id%></p>
      <p><strong>이름:</strong> <%=name%></p>
      <p><button class="w-btn w-btn-skin" style = "padding: 10px 20px; background-color: rgb(255,255,255); onclick="location.href='main.jsp'">회원정보 변경</button></p>
    </div>
	<div class="box2"></div>
    
    <p><button class="w-btn w-btn-skin" onclick="location.href='main.jsp'">메인 페이지로 돌아가기</button></p>
</center>
</body>
</html>
