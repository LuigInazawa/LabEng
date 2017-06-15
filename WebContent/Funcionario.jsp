<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List, model.Funcionario"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title> Cadastro de funcionario </title>
  <style>
 *{
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
			<li><a href="./Teste.jsp">Chamado</a></li>
			<li><a href="./JanEmpresa.jsp">Clientes</a></li>
			<li><a href="./JanFuncionário.jsp">Funcionarios</a></li>
			<div align="right"> <li><a href="./Login.jsp">Logout</a></li></div>
		</ul>
		<hr color="LightGrey" size="10px">
	</div>



<%
		String msg = (String) session.getAttribute("MENSAGEM");
		List<Funcionario> funcionario = (List<Funcionario>) session.getAttribute("FUNCIONARIOS");
		session.setAttribute("MENSAGEM", null);
		session.setAttribute("FUNCIONARIOS", null);
		if (msg == null) {
			msg = "";
		}%>	 

  <center> <h1> Cadastro de Funcionario </h1> </center>
  <center><h2> Parte do sistema no qual se faz o controle cadastrais dos funcionários  </h2></center> 
  <br>
  <hr color="blue" size="10px">

<form action="./FuncionarioController" method="POST">

<!-- DADOS PESSOAIS-->
<fieldset border = "20px" >
<legend> Funcionario´ </legend>
 <table cellspacing="10">
  <tr>
   <td>
    <label for="txtNomeFunc">Nome do funcionario: </label>
   </td>
   <td align="left">
    <input type="text" id="txtNomeFunc" name="txtNomeFunc">
   </td>
   <td>
    <label for="txtCPF"> CPF:   </label>
   </td>
   <td align="left">
    <input type="text" id="txtCPF" name="txtCPF">
	<input type="submit" id="btnPesquisarFunc" name="cmd" value="Pesquisar" align="Left" class="Pesquisar">
	</td>
  </tr>
  <tr>
   <td>
    <label for="txtCargo"> Cargo:</label>
   </td>
   <td>
   <select id="txtCargo" name="txtCargo">
						<option value="Estagiário">Estagiário</option>
						<option value="Auxiliar"> Auxiliar </option>
						<option value="Técnico"> Técnico </option>
	</select>
   </td>
    <td>
      <input type="submit" id="btnCadastrarFunc" name="cmd" value="Cadastrar Funcionario" align="right"> 
	</td>
	<td>
	<input type="submit" id="btnAlterarFunc" value="Alterar Funcionario" align="right">
	  <input type="submit" id="btnDeletarFunc" value="Desativar ou excluir  Funcionario" align="right">
    </td>
  </tr>
 </table>
</fieldset>

 <hr color="blue" size="10px">
 <center> <input type="submit" id="btnVoltar" value="Voltar" size="5"> </center>
 
 <br>
		<br>
		<%if (funcionario != null && funcionario.size() > 0) { %>
			<table border="2">
				<tr>
					<td>CPF: </td>
					<td>Nome: </td>
					<td>Cargo: </td>
					
				</tr>
				<%for (Funcionario f : funcionario) { %>
					<tr>
						<td><%=f.getCpfFuncionario()%></td>
						<td><%=f.getNome()%></td>
						<td><%=f.getCargo()%></td>
					</tr>
				<%}%>
			</table>
		<% } %>
 
 </form>
</body>
</html>