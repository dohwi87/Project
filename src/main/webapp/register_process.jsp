<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>

<head>
  <title>회원가입 처리</title>
</head>
<body>
  <center>
    <h1>회원가입 처리</h1>
    <%    
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String follow = ""; // 팔로우는 공백으로 초기화
    
    try {
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wptest?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false", "root", "0000");
      Statement stmt = conn.createStatement();
      
      String query = "INSERT INTO user_tbl (id, name, passwd, follow) VALUES ('" + id + "', '" + name + "', '" + password + "', '" + follow + "')";
      stmt.executeUpdate(query);
      
      stmt.close();
      conn.close();
      //out.print("<script>alert('');</script>");
      response.getWriter().print("<script>alert('회원가입 완료!'); location.href = 'main.jsp';</script>");
      //out.print("location.href = 'main.jsp';");
      //response.sendRedirect("main.jsp"); // 회원가입이 완료되면 메인 페이지로 이동
    } catch (Exception e) {
      e.printStackTrace();
      out.println("오류 발생: " + e.getMessage());
      
    }
    %>
  </center>
</body>
</html>


