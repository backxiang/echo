<html>
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="css/bootstrap.css">

<title>添加电影</title>
</head>
<script Language="JavaScript">
function ChkFields1() {
	if (document.formbadd.movieid.value=='') {
		window.alert ("请输入电影编号！");
		formbadd.boardid.focus();
		return false
	}
	if (document.formbadd.moviename.value=='') {
		window.alert ("请输入电影名！");
		formbadd.boarname.focus();
		return false
	}
	
	return true
}

</script>
<body >
<form role="form" method="POST" action="moviesave.asp" name="formbadd" onSubmit="return ChkFields1()">
<h3></h3>
<h3 align="center">添加电影信息</h3>
 <table class="table table-striped" align="center" border="1" cellpadding="1" cellspacing="1" width="473" >
      <tr>
        <td align=left  width="165">电影编号</td>
		<td width="292"><input type="text" name="movieid" size="20"></td>
	  </tr>
	  <tr>
		<td align=left  width="165">电影名</td>
		<td width="292"><input type="text" name="MovieName" size="20"></td>
      </tr>
      <tr>
        <td align=left  width="165">导演</td>
		<td width="292"><input type="text" name="Director" size="20"></td>
	  </tr>	  	  
      <tr>
        <td align=left  width="165">主演</td>
		<td width="292"><textarea rows="1" name="Cast" cols="50"></textarea></td>
	  </tr>
      <tr>
        <td align=left  width="165">影片时长</td>
		<td width="292"><input type="text" name="Duration" size="20"></td>
	  </tr>	  	  
      
      <tr>
        <td align=left  width="165">上映日期</td>
		<td width="292"><input type="text" name="ReleaseDate" size="20"></td>
	  </tr>	  	  
      <tr>
        <td align=left  width="165">语言</td>
		<td width="292"><input type="text" name="Language" size="20"></td>
	  </tr>	  	  
      <tr>
        <td align=left  width="165">影片概要</td>
		<td width="292"><textarea rows="3" name="Synopsis" cols="50"></textarea></td>
	  </tr>	  	  
      <tr>
        <td align=left  width="165">分类</td>
		<td width="292"><input type="text" name="Type" size="20"></td>
	  </tr>	  	  

        
       </td>
      </tr>
  </table> 
<p align="center"><input type="submit" class="btn btn-default" value=" 提 交 " name="B2"></p>
</form>  
</body>
</html>