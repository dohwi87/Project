<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
  <title>장르 선택</title>
  <link rel="stylesheet" type="text/css" href="main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
  <style>

  </style>
  <script>
    function selectGenre(button) {
      var buttons = document.getElementsByClassName('genre-button');
      for (var i = 0; i < buttons.length; i++) {
        buttons[i].classList.remove('selected');
      }
      button.classList.add('selected');
      var selectedGenre = button.innerText;
      switch (selectedGenre) {
        case "액션":
          selectedGenre = "action";
          break;
        case "코미디":
          selectedGenre = "comedy";
          break;
        case "SF":
          selectedGenre = "sf";
          break;
        case "공포":
          selectedGenre = "horror";
          break;
        case "드라마":
          selectedGenre = "drama";
          break;
        case "로맨스":
          selectedGenre = "romance";
          break;
        case "스릴러":
          selectedGenre = "thriller";
          break;
      }
      document.getElementById('selectedGenre').value = selectedGenre;
    }
  </script>
</head>
<body>
  <center>
    <h1 class = "text_font_1" >장르 선택</h1>
    <div>
      <div class="genre-button" onclick="selectGenre(this)">SF</div>
      <div class="genre-button" onclick="selectGenre(this)">공포</div>
      <div class="genre-button" onclick="selectGenre(this)">드라마</div>
    </div>
    <div>
      <div class="genre-button" onclick="selectGenre(this)">로맨스</div>
      <div class="genre-button" onclick="selectGenre(this)">스릴러</div>
      <div class="genre-button" onclick="selectGenre(this)">액션</div>
      <div class="genre-button" onclick="selectGenre(this)">코미디</div>
    </div>
    <br><br>
    <form action="image.jsp" method="post">
      <input type="hidden" name="genre" id="selectedGenre">
      <button class="w-btn w-btn-skin" type="submit">선택완료</button>
    </form>
  </center>
</body>
</html>
