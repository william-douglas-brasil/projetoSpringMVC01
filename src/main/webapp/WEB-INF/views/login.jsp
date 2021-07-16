<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Login</title>

<!-- Referencia para arquivos de imagem-->
<link rel="stylesheet" href="/resources/img/Secure login-amico2.png" />

<!-- Referencia para arquivos CSS -->

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="./resources/csspages/login.css" />

</head>
<body>

	<div class="main">

		<div class="container">
			<p style="font-size: 50px; color: #fff; align-text: right; text-align: center;">Bem vindo ao projeto!</p>
			<div class="middle">
				<div id="login">

					<form id="formlogin" action="autenticarUsuario" method="post">

						<fieldset class="clearfix">

							<p>
								<span class="fa fa-user"></span>
								<form:input path="dto.email" name="email" id="email" type="text"
									Placeholder="Username" />
							</p>
							<!-- JS because of IE support; better: placeholder="Username" -->
							<p>
								<span class="fa fa-lock"></span>
								<form:input path="dto.senha" name="senha" id="senha"
									type="password" Placeholder="Password" />
							</p>
							<!-- JS because of IE support; better: placeholder="Password" -->

							<div>
								<span
									style="width: 100%; text-align: left; display: inline-block;"><a
									class="small-text" href="#">Esqueceu a senha?</a></span> <span
									style="width: 100%; text-align: right; display: inline-block; margin-top: 8px;"><input
									type="submit" value="Sign In" style="width: 100%;"></span>

							</div>

						</fieldset>
						<div class="clearfix"></div>
					</form>


					<div>
						<c:if test="${not empty mensagem_sucesso}">
							<!-- mensagem de sucesso -->
							<div class="alert alert-success alert-dismissible" role="alert"
								style="margin-top: 10px; font-size: 13px;">
								<strong>Sucesso!</strong> ${mensagem_sucesso}
								<button type="button" class="btn-close" data-bs-dismiss="alert"
									aria-label="Close"></button>
							</div>
						</c:if>

						<c:if test="${not empty mensagem_erro}">
							<!-- mensagem de erro -->
							<div class="alert alert-danger alert-dismissible" role="alert"
								style="margin-top: 10px; font-size: 13px;">
								<strong>Erro!</strong> ${mensagem_erro}
								<button type="button" class="btn-close" data-bs-dismiss="alert"
									aria-label="Close"></button>
							</div>
						</c:if>
					</div>

					<div class="clearfix"></div>

				</div>
				<!-- end login -->

				<div class="img-fluid">
					<img src="resources/img/Secure login-amico2.png"
						class="rounded mx-auto d-block" alt="" width="350" height="350">

					<div class="clearfix"></div>
				</div>

			</div>

		</div>

	</div>

	<!-- Referencia para arquivos JS tela login -->

	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

	<!-- Referencia para arquivos JS -->
	<script src="resources/js/bootstrap.min.js"></script>

	<!-- Referencia para o JQuery -->
	<script src="resources/js/jquery-3.6.0.min.js"></script>

	<!-- Referencias para o JQuery validate -->
	<script src="resources/js/jquery.validate.min.js"></script>
	<script src="resources/js/messages_pt_BR.min.js"></script>

	<script>
		//quando a página for carregada, faça..
		$(document).ready(function() { //page load, start..

			//aplicando validação ao formulário..
			$("#formlogin").validate({
				//regras de validação..
				rules : {
					"email" : {
						required : true,
						email : true
					},
					"senha" : {
						required : true
						minlength : 8,
						maxlength : 20
					},
					
				}
			});

		})
	</script>

</body>
</html>



