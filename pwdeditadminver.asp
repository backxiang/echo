﻿﻿﻿<%@Language="vbscript" Codepage="65001"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
    <link rel="icon" href="favicon.ico"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="css/bootstrap.css">
<!--   <link rel="stylesheet" href="css/useredit.css"> -->
  <title>修改密码</title>
  <style>
    body{
      max-width: 732px;
      margin: 0 auto;
    }
    label{
      color: black;
    }
    a{
      text-decoration:none;
    }
  </style>

</head>
<script Language="JavaScript">
function ChkFields() {
	if (
    document.pwdinfo.Pwd.value=='') {
      window.alert ("请输入新密码！");
      pwdinfo.Pwd.focus();
	}
	else if (document.pwdinfo.Pwd.value.length<6) {
		window.alert ("新密码长度大于等于6！");
		pwdinfo.Pwd.focus();

	}
	else if (document.pwdinfo.Pwd1.value=='') {
		window.alert ("请确认新密码！");
		pwdinfo.Pwd1.focus();

	}
	else if (document.pwdinfo.Pwd.value!=document.pwdinfo.Pwd1.value) {
		window.alert ("两次输入的新密码必须相同！");

	}
else
  {pwdinfo.submit()}
}

</script>
<body style="
    margin-left: 80px;
">
  <div class="main">
    <ul class="nav nav-tabs">
      <li>
        <a href="usereditadminver.asp" data-toggle="tab">个人资料</a>
      </li>
      <li class="active">
        <a href="pwdeditadminver.asp" data-toggle="tab">密码修改</a>
      </li>
    </ul>
    <br>
      <div class="edit">
<form name="pwdinfo" class="container container-small" style="margin-left: 0px;padding-left: 0px;" action="pwdsave.asp" method="post" >
<!--   <hr>
 -->
      <div class="form-group">
        <label class="control-label">用户名:</label>
        <%=Session("UserName")%>
      </div>

      <div class="form-group">
        <label>新密码</label>
        <input type="password" name="Pwd" class="form-control">
      </div>
      <div class="form-group">
        <label>密码确认</label>
        <input type="password" name="Pwd1" class="form-control">
      </div>
    <br>
      <button type="submit" class="btn btn-success" onclick=" ChkFields()">修改密码</button>
</form>
      </div>
</div>

</body>
</html>
