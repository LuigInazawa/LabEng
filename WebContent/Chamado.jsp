<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.List, model.Chamado"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro Chamado</title>
<style type="text/css">
* {
	font-family: Century Gothic;
}

<!--
		body {
			padding:0px;
			margin:0px;
		}
 
		#menu ul {
			padding:0px;
			margin:0px;
			float: left;
			width: 100%;
			background-color: Blue	;
			list-style:none;
			font:80% Tahoma;
		}
 
		#menu ul li { display: inline; }
 
		#menu ul li a {
			background-color: Blue;
			text-decoration: none;
			border-bottom:3px solid #8F8FBD;
			padding: 2px 10px;
			float:left;
			font-size: large;
			font-weight:bold;
			color: White;
			align: center;
		}
 
		#menu ul li a:hover {
			background-color:#D6D6D6;
			color: #6D6D6D;
			border-bottom:3px solid #EA0000;
		}
	-->
</style>
</head>
<body bgcolor="LightBlue">

 <div id="menu" align ="center">
		<ul>
			<li><a href="">Home</a></li>
			<li><a href="./Chamado.jsp">Chamados</a></li>
			<li><a href="./Empresa.jsp">Clientes</a></li>
			<li><a href="./Funcionario.jsp">Funcionarios</a></li>
			<li><a href="./Login.jsp">Logout</a></li></div>
		</ul>
		<hr color="LightGrey" size="10px">
	</div>

	<%
		String msg = (String) session.getAttribute("MENSAGEM");
		List<Chamado> chamados = (List<Chamado>) session.getAttribute("CHAMADOS");
		session.setAttribute("MENSAGEM", null);
		session.setAttribute("CHAMADOS", null);
		if (msg == null) {
			msg = "";
		}
	%>
	<center>
		<h1>Suporte Técnico</h1>
	</center>
	<center>
		<h2>Sistema de chamado com foco em suporte técnico</h2>
	</center>
	<br />
	<hr color="blue" size="10px">
	<h3><%=msg%></h3>
	<form action="./ChamadoController" method="POST">


		<!-- DADOS PESSOAIS-->
		<fieldset>
			<legend>Abertura de chamado </legend>
			<table cellspacing="10">
				<tr>
					<td><label for="txtIdChamado">Id do Chamado: </label></td>
					<td align="left"><input type="text" id="txtIdChamado"
						name="txtIdChamado" disabled="disabled"></td>
					<td><label for="txtRazao"> CPNJ do cliente: </label></td>
					<td align="left"><input type="text" id="txtRazao"
						name="txtRazao"></td>
				</tr>
				<tr>
					<td><label for="txtMotivo"> Motivo do Chamado:</label></td>
					<td align="left"><input type="text" id="txtMotivo"
						name="txtMotivo"></td>

					<td><label for="txtResp"> CPF do Funcionario:</label></td>
					<td align="left"><input type="text" id="txtResp"
						name="txtResp"></td>
				</tr>
				
				<tr>
					<td><label for="txtTipoChamado">Tipo do chamado </label></td>
					<td><select id="txtTipoChamado" name="txtTipoChamado">
							<option value="Agendamento">Agendamento</option>
							<option value="Ligação">Ligação</option>
							<option value="Emergencias">Emergencias</option>
					</select></td>
					<td><label for="txtRetorno"> Retorno Chamado </label></td>
					<td align="left"><textarea id="txt" name="txtRetorno" rows="4"
							cols="60">  </textarea></td>
				</tr>
				<tr>
					<td><input type="submit" value="Adicionar" name="cmd"/> 
						<input type="submit" value="Pesquisar por Nome"  name="cmd"/></td>
				</tr>
			</table>
			<script>
				function teste(){
  				document.forms[0].acao.value="teste";
  				document.forms[0].action="JanFuncionário.jsp";
  				document.forms[0].submit();
  				}
			</script>
			
		</fieldset>
		<hr color="blue" size="10px">
		<center>
			<input type="hidden" name="acao">
			<input type="button" value="Cadastrar Funcionario" onClick="teste();">
		</center>
	</table>
		<br>
		<br>
		<%if (chamados != null && chamados.size() > 0) { %>
			<table border="2">
				<tr>
					<td>Id da empresa</td>
					<td>Razão Social da empresa</td>
					<td>Motivo Chamado</td>
					<td>Tipo Chamado</td>
					<td>Retorno Chamado </td>
					<td>Responsável chamado</td>
				</tr>
				<%for (Chamado c : chamados) { %>
					<tr>
						<td><%=c.getIdChamado()%></td>
						<td><%=c.getCnpjEmpresa()%></td>
						<td><%=c.getMotivoChamado()%></td>
						<td><%=c.getTipoChamado()%></td>
						<td><%=c.getRetornoChamado()%></td>
						<td><%=c.getCpfFuncionario()%></td>
					</tr>
				<%}%>
			</table>
		<% } %>
		
	</form>
		
</body>
<html>