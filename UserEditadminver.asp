<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="favicon.ico"/>
  <link rel="stylesheet" href="css/bootstrap.css">
<!--   <link rel="stylesheet" href="css/useredit.css"> -->
  <title>个人信息修改</title>
  <style>
    body{
      max-width: 600px;
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
	if (document.userinfo.username.value=='') {
		window.alert ("请输入用户名！");
		userinfo.username.focus();
		return false
	}
	if (document.userinfo.username.value.length<=2) {
		window.alert ("请用户名长度必须大于2！");
		userinfo.username.focus();
		return false
	}
  if (document.userinfo.city.value=='') {
    window.alert ("所在城市不为空！");
    userinfo.city.focus();
    return false
  }
  if (document.userinfo.tel.value=='') {
      window.alert ("请输入电话号码！");
      userinfo.tel.focus();
      return false
    }
  if (document.userinfo.birth.value=='') {
      window.alert ("请输入生日！");
      userinfo.birth.focus();
      return false
      }
	return true
}
</script>
<body style="
    margin-left: 80px;
">
  <div class="main">
      <ul class="nav nav-tabs">
      <li class="active">
        <a href="usereditadminver.asp" data-toggle="tab">个人资料</a>
      </li>
      <li>
        <a href="pwdeditadminver.asp" data-toggle="tab">密码修改</a>
      </li>
    </ul>

      <div class="edit">
<form  role="form" name="userinfo" class="container container-small" style="border-left: 0px;margin-left: 0px; padding-left: 0px;" action="infosave.asp" method="post" onsubmit="return ChkFields()">
<!--   <h3>个人资料</h3>
  <hr> -->
      <div class="form-group">
        <label class="control-label">用户名</label>
        <input type="text" name="username" class="form-control">
      </div>
    <div class="form-group">
        <label>城市</label>
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
      <label>邮箱</label>
      <input type="text" name="email" class="form-control">
    </div>
    <div class="form-group">
      <label>生日</label>
      <input type="date" name="birth" class="form-control">
    </div>
    <br>
      <button type="submit" class="btn btn-success">更新资料</button>
</form>
      </div>
</div>

</body>
</html>
