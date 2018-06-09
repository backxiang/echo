<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>登录</title>
  <link rel="icon" href="favicon.ico"/>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/login.css">


</head>
<body style="background-image: url(img/1.jpg);>

<div class="container" >
  <form name="form1" class="container container-small" method="post" action="ChkPwd.asp">
<br>

<!--<div>
  <ul class="nav nav-tabs">
  <li class="active"><a href="logup.asp">注册</a></li>
  <li ><a href="login.asp">登录</a></li>
</ul>
</div>
--><div class="img" width=500px align="center"><img width="200px" height="140px" src="img/1.png">
</div>
<h1>登录</h1>
<%
If Session("Passed")=False and session("Errmsg")<>"" Then
%>
<script>alert("<% =session("Errmsg") %>")</script>
<%
Session("Errmsg")=""
End If
%>
    <div class="form-group">
      <label class="control-label">用户名</label>
      <input type="text" name="UserName" class="form-control">
    </div>
    <div class="form-group">
      <label>密码</label>
      <input type="password" name="UserPwd" class="form-control">
    </div>
  <br><br>
  <div class="form-group" align="center">
    <input type="submit" class="btn btn-danger" value="开启你的电影之旅">
  </div>

  </form>

</div>

</body>
</html>
