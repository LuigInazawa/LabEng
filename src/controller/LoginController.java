package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import java.util.List;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public LoginController() {
		// TODO Auto-generated constructor stub
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String txtLogin = request.getParameter("txtLogin");
		String txtSenha = request.getParameter("txtSenha");
		String cmd = request.getParameter("cmd");

		if ("Logar".equals(cmd)) {
			System.out.println("tentando acessar");
			if (txtLogin.equals("admin") && txtSenha.equals("admin")) {
				HttpServletResponse res = (HttpServletResponse) response;
				res.sendRedirect("./Chamado.jsp");
				System.out.println("logado");

			} 
				  else { HttpSession session = request.getSession();
				  HttpServletResponse res = (HttpServletResponse) response;
				  session.setAttribute("MENSAGEM", "Login e/ou Senha inválidos"); 
				  res.sendRedirect("./Login.jsp"); 
				  System.out.println("Negado");
				  }
				 
		}

	}

}
