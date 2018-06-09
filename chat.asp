<form class="" action="chatsave.asp?" method="post">
  <input type="submit" name="chat" value="">
</form>
<%sql11="select * from friend where [userid]='" & session("userid") & "' and [friendid]='" & usid & "'"
"select * from users where userid=" & rsfri("friendid")
