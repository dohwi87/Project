<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>로그인</title>
 <link rel="stylesheet" type="text/css" href="main.css">
   <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
</head>
<body>
  <center>
    <h1 class = "text_font_1">로그인</h1>
    <form  action="login_process.jsp" method="post">
      <table>
        <tr>
          <td>아이디:</td>
          <td><input type="text" name="id" class = "id_pwd" required></td>
        </tr>

        <tr>
          <td>비밀번호:</td>
          <td><input type="password" name="password" class= "id_pwd" required></td>
        </tr>
        <tr>
          <td colspan="2"><button class="w-btn w-btn-skin" type="submit">login</button></td>
        </tr>
      </table>
    </form>
  </center>
</body>
</html>

