<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>

<!-- Referencia para arquivos CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/jquery.dataTables.min.css"/>

<!-- estilo CSS para o jquery validate -->
<style>	
	label.error { /* formatar as mensagens de erro do jquery validate */
		color: #d9534f;
	}
	select.error { /* formatar os campos com erro do jquery validate */
		border: 1px solid #d9534f;
	}
</style>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><img src="resources/img/logofuncionario.png"
				alt="" width="65" height="59" class="d-inline-block align-text-center">
				Controle de Funcionários</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/projetoSpringMVC01/home">Página inicial</a></li>
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Gerenciar Funcionários 
					</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/projetoSpringMVC01/funcionario-cadastro">Cadastrar Funcionários</a></li>
							<li><a class="dropdown-item" href="/projetoSpringMVC01/funcionario-consulta">Consultar Funcionários</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="/projetoSpringMVC01/funcionario-relatorio">Relatório de Funcionários</a></li>
					</ul></li>
				</ul>
				<form class="d-flex" style="margin: 1px">
					<span class="text-white mt-2" style="padding: 0px 10px">
						${usuario_autenticado.nome}  (${usuario_autenticado.email}) </span> <a
						href="/projetoSpringMVC01/logout"
						class="btn btn-outline-primary"
						onclick="return confirm('Deseja realmente sair do Sistema ?')">Sair
						do Sistema</a>
				</form>
			</div>
		</div>
	</nav>
	
	<c:if test="${not empty mensagem_sucesso}">
		<!-- mensagem de sucesso -->
		<div class="alert alert-success alert-dismissible fade show" role="alert">
  			<strong>Sucesso!</strong> ${mensagem_sucesso}
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	</c:if>
	
	<c:if test="${not empty mensagem_erro}">
		<!-- mensagem de erro -->
		<div class="alert alert-danger alert-dismissible fade show" role="alert">
  			<strong>Erro!</strong> ${mensagem_erro}
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	</c:if>
		
	<div class="container mt-4">
		<h5>Relatório de funcionários</h5>
		<hr/>
		
		<form id="formrelatorio" method="post" action="gerarRelatorioFuncionarios">
		
			<label>Relatório de funcionários por período de admissão:</label>
		
			<div class="row">
			
				<div class="col-md-2">
					<form:input path="dto.dataInicio" id="dataInicio" name="dataInicio" 
						type="date" class="form-control" style="border-color: #1e0ea6;"/>														
				</div>
				
				<div class="col-md-2">
					<form:input path="dto.dataFim" id="dataFim" name="dataFim" 
						type="date" class="form-control" style="border-color: #1e0ea6;"/>														
				</div>
				
				<div class="col-md-4">
					<input type="submit" value="Gerar Relatório" class="btn btn-success"/>
				</div>
				
				<div class="container mt-4">
		 		<div class="img-fluid" > <img src="resources/img/Documents-amico.png" class="rounded float-end" alt="" width="550" height="550" style="margin: 16px 750px;"></div>
			 </div>
							
			</div>	
		
		</form>
		
	</div>

	<!-- Referencia para arquivos JS -->
	<script src="resources/js/bootstrap.min.js"></script>
	
	<!-- Referencia para o JQuery -->
	<script src="resources/js/jquery-3.6.0.min.js"></script>
	
	<!-- Referencias para o JQuery validate -->
	<script src="resources/js/jquery.validate.min.js"></script>
	<script src="resources/js/messages_pt_BR.min.js"></script>
	
	<script>
		//quando a página for carregada, faça..
		$(document).ready(function(){ //page load, start..
						
			//aplicando validação ao formulário..
			$("#formrelatorio").validate({
				//regras de validação..
				rules : {
					"dataInicio" : {
						required : true
					},
					"dataFim" : {
						required : true
					}
				}
			});
			
		})
	</script>	

</body>
</html>
