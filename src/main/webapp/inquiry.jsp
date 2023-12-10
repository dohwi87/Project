<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>문의 페이지</title>
  <link rel="stylesheet" type="text/css" href="main.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
</head>
<body>
  <center>
    <h1 class="text_font_1">문의하기</h1>
    
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
    
    <!-- 문의 양식 -->
    <form action="process_inquiry.jsp" method="post">
      <label for="name">이름:</label>
      <input type="text" name="name" class = "id_pwd"  id="name" required><br>
      
      <label for="email">이메일:</label>
      <input type="email" name="email" class = "id_pwd" id="email" required><br>
      
      <label for="message">문의 내용:</label><br>
      <textarea name="message" id="message"  cols="100" rows="20"  required></textarea><br><br>
      
      <input type="submit" value="문의하기">
    </form>
    
    <%
    out.println("<p><button class=\"w-btn w-btn-skin\" onclick=\"location.href='main.jsp'\">메인 페이지로 이동</button></p>");
    %>
  </center>
</body>
</html>
