<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>로그인 처리</title>
  <script>
    function goBack() {
      history.go(-1); // 이전 페이지로 이동
    }
  </script>
</head>
<body>
  <%
  String id = request.getParameter("id");
  String password = request.getParameter("password");
  
  try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wptest?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false", "root", "0000");
    Statement stmt = conn.createStatement();
    
    String query = "SELECT * FROM user_tbl WHERE id = '" + id + "' AND passwd = '" + password + "'";
    ResultSet rs = stmt.executeQuery(query);
    
    if (rs.next()) {
      session.setAttribute("id", id); // 세션에 로그인 정보 저장
      response.sendRedirect("main.jsp"); // 로그인 성공 시 메인 페이지로 이동
    } else {
      // 로그인 실패 시 알림을 띄우고 이전 페이지로 이동
      out.println("<script>alert('로그인 실패: 아이디 또는 비밀번호가 일치하지 않습니다.'); history.go(-1);</script>");
    }
    
    rs.close();
    stmt.close();
    conn.close();
  } catch (Exception e) {
    e.printStackTrace();
    out.println("오류 발생: " + e.getMessage());
  }
  %>
</body>
</html>
