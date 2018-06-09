<html>
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="css/bootstrap.css">

<title>添加电影日历</title>
</head>
<script Language="JavaScript">
function ChkFields1() {
	if (document.formbadd.movieid.value=='') {
		window.alert ("请输入电影编号！");
		formbadd.boardid.focus();
		return false
	}
	if (document.formbadd.date1.value=='') {
		window.alert ("请输入展示日期！");
		formbadd.boarname.focus();
		return false
	}
	
	return true
}

</script>
<body >
<form role="form" method="POST" action="calensave.asp" name="formbadd" onSubmit="return ChkFields1()">

<h3 align="center">添加电影日历</h3>
 <table class="table table-striped" align="center" border="1" cellpadding="1" cellspacing="1" width="473" >
      <tr>
        <td align=left  width="165">电影编号</td>
		<td width="292"><input type="text" name="movieid" size="20"></td>
	  </tr>
      <tr>
        <td align=left  width="165">推荐理由</td>
		<td width="292"><textarea name="reason" id="reason" cols="30" rows="2"></textarea></td>
	  </tr>	  	  
      <tr>
        <td align=left  width="165">日期</td>
		<td width="292"> 
			<input type="date" name="date1" class="form-control">
		</td>
	  </tr>
      <tr>
        <td align=left  width="165">经典台词</td>
		<td width="292"><textarea name="Duration" id="Duration" cols="30" rows="2"></textarea></td>
	  </tr>	

     
  </table> 
<p align="center">
	<input type="submit" class="btn btn-default" value=" 提 交 " name="B2">
</p>
</form>  
</body>
</html>