<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>

<!-- Referencia para arquivos CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/img/logofuncionario.png" />
<link rel="stylesheet" href="resources/logo-home.png" />

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><img
				src="resources/img/logofuncionario.png" alt="" width="65"
				height="59" class="d-inline-block align-text-center"> Controle
				de Funcionários</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/projetoSpringMVC01/">Página inicial</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Gerenciar Funcionários </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item"
								href="/projetoSpringMVC01/funcionario-cadastro">Cadastrar
									Funcionários</a></li>
							<li><a class="dropdown-item"
								href="/projetoSpringMVC01/funcionario-consulta">Consultar
									Funcionários</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item"
								href="/projetoSpringMVC01/funcionario-relatorio">Relatório
									de Funcionários</a></li>
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

	<div class="container mt-4">
		<h5>Seja Bem Vindo ao Projeto!</h5>

		<div id="grafico"></div>
	</div>


	<!-- Referencia para arquivos JS -->
	<script src="resources/js/bootstrap.min.js"></script>
	<!-- Referencia do Jquary -->
	<script src="resources/js/jquery-3.6.0.min.js"></script>
	<!-- Referencia para arquivos do Highcharts -->
	<script src="resources/js/highcharts.js"></script>
	<script src="resources/js/highcharts-3d.js"></script>
	<script src="resources/js/exporting.js"></script>
	<script src="resources/js/export-data.js"></script>

	<script>
		$(document).ready(function(){
			
			var dados = [
				{ data : [${qtd_admitido}], name : 'Funcionários admitidos' },
				{ data : [${qtd_afastado}], name : 'Funcionários afastados' },
				{ data : [${qtd_ferias}], name : 'Funcionários de férias' },
				{ data : [${qtd_demitido}], name : 'Funcionários demitidos' }
			];
			
			var array = [];
			for(var i = 0; i < dados.length; i++){
				array.push([ dados[i].name, dados[i].data[0] ]);
			}
			
			new Highcharts.Chart({
				chart : {
					type : 'pie',
					renderTo : 'grafico'
				},
				title : {
					text : 'Gráfico de Funcionários por Situação.'
				},
				subtitle : {
					text : 'Total de funcionários por situação cadastrada.'
				},
				exporting : { enabled : false },
				credits : { enabled : false },
				plotOptions : {
					pie : {
						innerSize: '60%'
					}
				},
				series : [
					{ data : array }
				]
			})
		})

	</script>


</body>
</html>


