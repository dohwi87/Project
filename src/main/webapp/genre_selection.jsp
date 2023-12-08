<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
  <title>장르 선택</title>
  <link rel="stylesheet" type="text/css" href="main.css">
  <style>
    .genre-button {
      display: inline-block;
      width: 100px;
      height: 100px;
      border: 2px solid #000;
      border-radius: 5px;
      margin: 10px;
      text-align: center;
      line-height: 100px;
      font-size: 18px;
      cursor: pointer;
    }

    .genre-button.selected {
      background-color: #000;
      color: #fff;
    }
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
    <h1>장르 선택</h1>
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
</html>//
