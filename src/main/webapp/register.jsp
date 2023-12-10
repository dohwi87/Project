<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>회원가입</title>
  <link rel="stylesheet" type="text/css" href="main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
   <script>
 	function idDupPopup(){
 		window.open('idDup.jsp','', 'width=200,height=300');
 	}
 	function memberSubmit(){
 		var idDupChk = document.f1.idDupChk.value;
 		if(idDupChk=='t'){
 			document.f1.submit();
 		}else{
 			alert('아이디 중복체크를 해주세요');
 		}
 	}
 </script>
</head>
<body>
  <center>
    <h1 class = "text_font_1">회원가입</h1>
    <form name="f1" action="register_process.jsp" method="post">
         <input type = "hidden" name="idDupChk" value="f"/>
      <table>
        <tr>
          <td>아이디:</td>
          <td><input type="text" name="id" class = "id_pwd" required> <input type="button" class="w-btn w-btn-skin" style = "padding: 10px 20px;" value="중복체크" onclick="idDupPopup()"/></td>
        </tr>
        <tr>
          <td>이름:</td>
          <td><input type="text" name="name" class = "id_pwd" required></td>
        </tr>
        <tr>
          <td>비밀번호:</td>
          <td><input type="password" name="password" class = "id_pwd" required></td>
        </tr>
<tr>
  <td colspan="2"><button class="w-btn w-btn-skin" type="submit">Sign up</button></td>
</tr>
      </table>
    </form>
  </center>
</body>
</html>

