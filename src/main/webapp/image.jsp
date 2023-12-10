<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<html>
<head>
  <title>이미지 출력</title>
  <link rel="stylesheet" type="text/css" href="main.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
  <script>
    function toggleImageVisibility() {
      var image = document.getElementById("image");
      var toggleImageButton = document.getElementById("toggleImageButton");
      
      if (image.style.display === "none") {
        image.style.display = "block";
        toggleImageButton.textContent = "사진 숨기기";
      } else {
        image.style.display = "none";
        toggleImageButton.textContent = "사진 보이기";
      }
    }
    
    function toggleTextVisibility() {
      var text = document.getElementById("text");
      var toggleTextButton = document.getElementById("toggleTextButton");
      
      if (text.style.display === "none") {
        text.style.display = "block";
        toggleTextButton.textContent = "글 숨기기";
      } else {
        text.style.display = "none";
        toggleTextButton.textContent = "글 보이기";
      }
    }
  </script>
</head>
<body>
  <center>
    <% 
    // MySQL에 접속하기 위한 정보
    String url = "jdbc:mysql://localhost:3306/wptest";
    String username = "root";
    String password = "0000";
    String genre= request.getParameter("genre");
    try {
      // MySQL 드라이버 로드
      Class.forName("com.mysql.jdbc.Driver");
      
      // MySQL에 연결
      Connection conn = DriverManager.getConnection(url, username, password);
      
      // 이미지와 설명을 랜덤하게 가져오기 위한 쿼리 실행
      Statement stmt = conn.createStatement();
     
      String query = "SELECT image_path, description FROM " + genre + "_images ORDER BY RAND() LIMIT 1";
      ResultSet rs = stmt.executeQuery(query);
      
      if (rs.next()) {
        String imagePath = rs.getString("image_path");
        String description = rs.getString("description");
        // 이미지와 설명 출력
        %>
        <div id="imageAndText">
          <img id="image" src="<%= imagePath %>" alt="<%= description %>" class="scale-up-hor-right">
          <p id="text" class="tracking-in-expand-fwd" style="font-family: 'Nanum Brush Script', cursive;"><%= description %></p>
        </div>
        <button class="w-btn w-btn-skin" id="toggleImageButton" onclick="toggleImageVisibility()" >사진 숨기기</button>
        <button class="w-btn w-btn-skin" id="toggleTextButton" onclick="toggleTextVisibility()">글 숨기기</button>
        <div id="formContainer">
          <form action="genre_selection-db.jsp" method="post">
          <input type="hidden" name="genre" value=<%=genre %>>
            <table border="0">
              <tr>
                <td class = "text_font_1" style="font-size: 25px;">글 내 용 </td>
                <td><textarea name="content" cols="100" rows="6" class = "text"></textarea></td>
              </tr>
            </table>
            <br><br>
            <tr>
              
              <button class="w-btn w-btn-skin" type="submit">등록하기</button>
              <button class="w-btn w-btn-skin" type="reset">다시쓰기</button>
            </tr>
          </form>
        </div>
        <% 
      }      
      // 연결 종료
      rs.close();
      stmt.close();
      conn.close();
    } catch (Exception e) {
      e.printStackTrace();
      out.println("오류 발생: " + e.getMessage());
    }
    %>
  </center>
</body>
</html>
