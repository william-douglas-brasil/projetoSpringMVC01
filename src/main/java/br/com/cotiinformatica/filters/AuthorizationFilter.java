package br.com.cotiinformatica.filters;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet Filter implementation class AuthorizationFilter
 */
public class AuthorizationFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AuthorizationFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// coverter os objetos request e response do filter em versoes mais atualizadas...
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		/*Iremos criar uma regra que verifique se o ususario está autenticado.
		 * esta regra deverá ser aplicada a todas as páginas do sistema, exceto:
		 * -navegando em ..: /
		 * -navegando em ..: /autenticarUsuario
		 * -navegando em ..: /logout
		 */
		
		String path = req.getServletPath();
		
		List<String> urlsPermitidas = new ArrayList<String>();
		urlsPermitidas.add("/");
		urlsPermitidas.add("/autenticarUsuario");
		urlsPermitidas.add("/logout");
		urlsPermitidas.add("/resources/csspages/login.css");
		urlsPermitidas.add("/resources/css/bootstrap.min.css");
		urlsPermitidas.add("/resources/img/Secure login-amico2.png");
		
		//verificando se a pagina que o ususario esta navegando
		//nao é uma das 3 permitidas, neste caso ela deverá estar autenticado
		if(!urlsPermitidas.contains(path)) {
			//verificar se o sistema nao contem a sessao 'usuario_autenticado'
			if(req.getSession().getAttribute("usuario_autenticado") == null) {
				//redirecionar para a pagina inicial
				resp.sendRedirect("/projetoSpringMVC01/");
			}
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
