<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Login do sistema </title>

<style>
.login {
    position:absolute;
    top:50%;
    left:50%;
    margin-top:-50px;
    margin-left:-140px;
    color:#FFF;
    font-weight:700;
}


 *{
 font-family: Century Gothic;
 }


</style>

</head>
<body bgcolor="LightBlue" background="./img/win.jpg">

	<%	String msg = (String)session.getAttribute("MENSAGEM");
		session.setAttribute("MENSAGEM", null);
		if (msg == null) {
			msg = "";
		}%>

<br><br><br><br><br><br>
<br>	


<center> <font color="white"> <h1> Login - Sistema de chamado técnico </h1> </font> </center>
                    <h3><%=msg%></h3>

<form action="./LoginController" method="POST">    

<table width="200" border="2" cellpadding="4" cellspacing="4" class="login">

	<tr>
		<td> <font color="White"> Login: </font> </td>
		<td> <input type="text" id="txtLogin" name="txtLogin" MaxLength="20" Width="100px"></td>
	</tr>
	
	<tr>
		<td> <font color="White"> Senha: </font> </td>
		<td> <input type="text" id="txtSenha" name="txtSenha" Width="100px" TextMode="Password" ></td>
	</tr>
	
	<tr>
	<td></td>
		<td> <div align="center"> <input type="submit" id="btnLogin" name="cmd" value="Logar"> </div></td>
	</tr>
	
	</table>
	</form>
</body>
</html>
	