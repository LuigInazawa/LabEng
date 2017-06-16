<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.List, model.Empresa"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de empresa</title>
<meta name="description"
	content="Aprenda a criar um site completo que usa formulários em HTML">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
* {
	font-family: Century Gothic;
}

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

</style>
</head>

<body bgcolor="LightBlue">

 <div id="menu" align ="center">
		<ul>
			<li><a href="">Home</a></li>
			<li><a href="./Chamado.jsp">Chamado</a></li>
			<li><a href="./Empresa.jsp">Clientes</a></li>
			<li><a href="./Funcionario.jsp">Funcionarios</a></li>
			<li><a href="./Login.jsp">Logout</a></li></div>
		</ul>
		<hr color="LightGrey" size="10px">
	</div>
	
<%
		String msg = (String) session.getAttribute("MENSAGEM");
		List<Empresa> empresas = (List<Empresa>) session.getAttribute("EMPRESAS");
		session.setAttribute("MENSAGEM", null);
		session.setAttribute("EMPRESAS", null);
		if (msg == null) {
			msg = "";
		}%>	
	

	<center>
		<h1>Cadastro de Empresa</h1>
	</center>
	<center>
		<h2>Parte do sistema no qual se faz o controle cadastrais das
			empresas</h2>
	</center>
	<br />
	<hr color="blue" size="10px">
	<form action="./EmpresaController" method="post">

		<!-- DADOS PESSOAIS-->
		<fieldset>
			<legend> Empresa </legend>
			<table cellspacing="15">
				<tr>
					<td><label for="txtRazao">Razão Social da empresa: </label></td>
					<td align="left"><input type="text" id="txtRazao"
						name="txtRazao"></td>
					<td><label for="txtCNPJ"> CNPJ: </label></td>
					<td align="left"><input type="text" id="txtCnpj"
						name="txtCnpj" align="right"> <input type="submit"
						id="btnPesquisar" value="Pesquisar" name="cmd"
						class="Pesquisar"></td>
				</tr>
				<tr>
					<td><label for="txtTelefone"> Telefone:</label></td>
					<td align="left"><input type="text" id="txtTelefone"
						name="txtTelefone"></td>
					<td><input type="submit" id="btnCadastrarEmpresa"
						value="Cadastrar empresa" name="cmd"></td>
					<td><input type="submit" id="btnAlterarEmpresa"
						value="Alterar empresa"> <input type="submit"
						id="btnDesativarEmpresa" value="Desativar ou Desativar empresa">
					</td>
				</tr>
				<tr>

				</tr>


			</table>
		</fieldset>
		</form>
		<hr color="blue" size="10px">
		
		<br>
		<br>
		<%if (empresas != null && empresas.size() > 0) { %>
			<table border="2">
				<tr>
					<td>CNPJ da empresa</td>
					<td>Razão Social da empresa</td>
					<td>Motivo Chamado</td>
				</tr>
				<%for (Empresa e : empresas) { %>
					<tr>
						<td><%=e.getCnpjEmpresa()%></td>
						<td><%=e.getRazaoSocial()%></td>
						<td><%=e.getTelefone()%></td>
					</tr>
				<%}%>
			</table>
		<% } %>
		
</body>
</html>
