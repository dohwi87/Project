<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   int cnt, length;
   int new_id = 0;
   String userId, content, genre;
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   String sql_update;
   request.setCharacterEncoding("UTF-8");
      
   try{
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/wptest?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
      conn = DriverManager.getConnection(url, "root", "0000");
      stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
      String sql = "select max(id) as maxid, count(*) as cnt from writing_tbl";
      rs = stmt.executeQuery(sql);
   }
   catch(Exception e){
      out.println("DB 연동 오류입니다.: " + e.getMessage());
   }
   
    while(rs.next()){
      cnt = Integer.parseInt(rs.getString("cnt"));
      if(cnt != 0)
         new_id = Integer.parseInt(rs.getString("maxid"));
   } 
   
   new_id++;
   userId = (String) session.getAttribute("id");
   content = request.getParameter("content");
   genre = request.getParameter("genre");

   
   length = content.length();
   
   sql_update = "INSERT INTO writing_tbl (id, writer, content, length, genre) VALUES('" + new_id + "', '" + userId  + "', '" + content + "', '" + length + "', '" + genre + "')";

   try{
      stmt.executeUpdate(sql_update);
   }
   catch(Exception e){
      out.println("DB 연동 오류입니다.: " + e.getMessage());
   }
   response.sendRedirect("main.jsp");
%>
<!--    <script type="text/javascript">
      location.href="./";
   </script> -->
</body>
</html>