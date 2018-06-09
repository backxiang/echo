<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="icon" href="favicon.ico"/>
  <link rel="stylesheet" href="css/useredit.css">
  <title>个人信息修改</title>
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
<body style="background-image: url(img/1.jpg);">
  <div class="main">
    <div class="row">
      <div class="sidebar col-md-3">
        <a style="color: white;" href="useredit.asp">个人资料</a>
        <hr>
        <a style="color: white;" href="pwdedit.asp">密码修改</a>
      </div>
      <div class="edit col-md-9" style="margin-bottom: 80px">
<form name="userinfo" class="container container-small" style="margin-left: 80px;" action="infosave.asp" method="post" onsubmit="return ChkFields()">
  <h3>个人资料</h3>
  <hr>
  <div class="form-group">
  <div align="center">
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
      <div class="form-group">
        <label class="control-label">用户名</label>
        <input type="text" name="username" class="form-control">
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
</div>
<script>

		  function showlogo(){
		    document.images.img.src = "avatars/" + document.userinfo.avatar.options[document.userinfo.avatar.selectedIndex].value + ".jpg";
		  }
</script>
</body>
</html>
