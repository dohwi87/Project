<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<html>
<head>
  <title>이미지 출력</title>
  <link rel="stylesheet" type="text/css" href="main.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
  <style>
    .scale-up-hor-right {
      -webkit-animation: scale-up-hor-right 0.4s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
              animation: scale-up-hor-right 0.4s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
    }
    .tracking-in-expand-fwd {
      -webkit-animation: tracking-in-expand-fwd 0.8s cubic-bezier(0.215, 0.610, 0.355, 1.000) both;
              animation: tracking-in-expand-fwd 0.8s cubic-bezier(0.215, 0.610, 0.355, 1.000) both;
      font-size: 3em;
    }
    @font-face {
      font-family: 'Cafe24Oneprettynight';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff');
      font-weight: normal;
      font-style: normal;
    }
    
    @keyframes scale-up-hor-right {
      0% {
        -webkit-transform: scaleX(0.4);
                transform: scaleX(0.4);
        -webkit-transform-origin: 100% 100%;
                transform-origin: 100% 100%;
      }
      100% {
        -webkit-transform: scaleX(1);
                transform: scaleX(1);
        -webkit-transform-origin: 100% 100%;
                transform-origin: 100% 100%;
      }
    }
    @keyframes tracking-in-expand-fwd {
      0% {
        letter-spacing: -0.5em;
        -webkit-transform: translateZ(-700px);
                transform: translateZ(-700px);
        opacity: 0;
      }
      40% {
        opacity: 0.6;
      }
      100% {
        -webkit-transform: translateZ(0);
                transform: translateZ(0);
        opacity: 1;
      }
    }
    
  </style>
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
    String genre = request.getParameter("genre");
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
          <p id="text" class="tracking-in-expand-fwd text_font_1"><%= description %></p>
        </div>
        <button class="w-btn w-btn-skin" id="toggleImageButton" onclick="toggleImageVisibility()" >사진 숨기기</button>
        <button class="w-btn w-btn-skin" id="toggleTextButton" onclick="toggleTextVisibility()">글 숨기기</button>
        <div id="formContainer">
          <form action="test.jsp" method="post">
            <table border="0">
              <tr>
                <td>글 내 용 :</td>
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
</html>//





