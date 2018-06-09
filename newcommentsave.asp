<!-- #include file="ChkPwd.asp" -->
<html>
<head>
<title>保存评论信息</title>
</head>
<body>
<%
  vUserid = Session("Userid")
  vcontent = Request("content")
  vmovieid =request("movieid")
  'Server对象的CreateObject方法建立Connection对象
  Set Conn=Server.CreateObject("ADODB.Connection")
 conn.open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")

  '生成当前时间
  vcommentTime = now()
  '插入新数据
  sql="INSERT INTO Comment (content,userid,movieid,commenttime) VALUES('" & vcontent & "','" & vuserid & "','" & vmovieid & "','" & vcommentTime & "')"
  Conn.Execute(sql)
%>
<script>  
  alert("评论成功！")
  location.replace(document.referrer);
document.referrer //前一个页面的URL
</script>
<%'server.execute("detail.asp?movieid= vmovieid")%>
</body>
<!-- <Script language="javascript">
  //打开此脚本的网页将被刷新
  opener.location.reload();
  //停留800毫秒后关闭窗口
  setTimeout("window.close()",800);
</Script> -->
</html>
