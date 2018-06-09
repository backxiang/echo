<!-- #include file="ChkPwd.asp" -->
<html>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

<head>
<title>保存电影信息</title>
</head>
<body>
<%
  '定义变量
  Dim sql1, vFlag, vmovieid, vMovieName, vDirector, vCast, vDuration, vReleaseDate, vLanguage, vSynopsis, vType
  '从参数或表单中接收数据到变量中
  vmovieid= Request("MovieId")
  vMovieName= Request("MovieName")
  vDirector= Request("Director")
  vCast= Request("Cast")
  vDuration= Request("Duration")
  vReleaseDate= Request("ReleaseDate")
  vLanguage= Request("Language")
  vSynopsis= Request("Synopsis")
  vType= Request("Type")


  'Server对象的CreateObject方法建立Connection对象
  Set Conn=Server.CreateObject("ADODB.Connection")
  Conn.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath("iMovie.mdb")
  Conn.Open


  '插入新数据
  sql1="INSERT INTO movie ([movieid], [MovieName], [Director], [Cast], [Duration], [ReleaseDate],[Language], [Synopsis], [Type]) VALUES('" & vmovieid & "','" & vMovieName & "','" & vDirector & "','" & vCast & "','" & vDuration & "', '" & vReleaseDate & "', '" & vLanguage & "', '" & vSynopsis & "', '" & vType & "')" 
  Conn.Execute(sql1)

  Response.Write "<h2>信息已成功保存！</h2>"
%>
</body>

<Script language="javascript">
  //打开此脚本的网页将被刷新
  opener.location.reload();
  //停留800毫秒后关闭窗口
  setTimeout("window.close()",800);
</Script>

</html>
