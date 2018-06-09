﻿<%@Language="vbscript" Codepage="65001"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>注册你的账号</title>
    <link rel="icon" href="favicon.ico"/>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/logup.css">
</head>
<script Language="JavaScript">
function ChkFields() {
	if (document.myform.username.value=='') {
		window.alert ("请输入用户名！");
		myform.username.focus();
		return false
	}
	if (document.myform.username.value.length<=2) {
		window.alert ("请用户名长度必须大于2！");
		myform.username.focus();
		return false
	}
  if (document.myform.password.value=='') {
    window.alert ("请输入新密码！");
    myform.password.focus();
    return false
  }
	if (document.myform.password.value.length<6) {
		window.alert ("新密码长度大于等于6！");
		myform.password.focus();
		return false
	}
  if (document.myform.tel.value=='') {
      window.alert ("请输入电话号码！");
      myform.tel.focus();
      return false
    }
  if (document.myform.city.value=='') {
      window.alert ("所在城市不为空！");
      myform.city.focus();
      return false
  }
  if (document.myform.birth.value=='') {
    window.alert ("请输入生日！");
    myform.birth.focus();
    return false
  }


	return true
}

</script>

<body style="background-image: url(img/1.jpg);>
  <form name="form2" class="container container-small" method="post" action="profile.asp">
    <div class="form-group" align="center">
      <input type="hidden" type="submit" class="btn btn-danger" value="开启你的电影之旅">
    </div>
  </form>

  <form name="myform" class="container container-small" method="post" action="UserSave.asp" onsubmit="return ChkFields()">
<br>
<div class="form-group" >
<div align="center" >
  <img width="160" height="160" src="avatars/1.jpg" name="img">
  <select size="1" class="form-control av" name="avatar" onChange="showlogo()">
          <option selected value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
    </select>&nbsp;&nbsp;
</div>
</div>
<div class="" style="margin-bottom: 100px;margin-top:-30px">
  <h1 style="margin-top:-10">注册</h1>
      <div class="form-group">
        <label class="control-label">用户名</label>
        <input type="text" name="username" class="form-control">
      </div>
      <div class="form-group">
        <label>密码</label>
        <input type="password" name="password" class="form-control">
      </div>
      <div class="form-group">
        <label>性别</label>
        <select class="form-control" name="sex">
          <option value="男">男</option>
          <option value="女">女</option>
          <option value="保密">保密</option>
        </select>
      </div>
      <div class="form-group">
        <label>所在城市</label>
        <input type="text" name="city" class="form-control">
      </div>
    <div class="form-group">
      <label>电话号码</label>
      <input type="text" name="tel" class="form-control">
    </div>
    <div class="form-group">
      <label>用一句话介绍自己吧！</label>
      <input type="text" name="intro" class="form-control">
    </div>
    <div class="form-group">
      <label>电子邮件</label>
      <input type="text" name="email" class="form-control">
    </div>
    <div class="form-group">
      <label>生日</label>
      <input type="date" name="birth" class="form-control">
    </div>
    <br><br>
    <div class="form-group" align="center">
      <input type="submit" class="btn btn-danger" value="开启你的电影之旅">
    </div>
</div>


<script>

		  function showlogo(){
		    document.images.img.src = "avatars/" + document.myform.avatar.options[document.myform.avatar.selectedIndex].value + ".jpg";
		  }
</script>

<input  type="hidden" name="regtime" value="<%=year(Now())%>-<%=Month(Now())%>-<%=day(Now())%>" />
</form>
</body>
</html>
