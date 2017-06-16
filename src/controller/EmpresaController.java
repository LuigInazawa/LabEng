package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmpresaDAO;
import dao.EmpresaDAOImpl;
import model.Empresa;

/**
 * Servlet implementation class EmpresaController
 */
@WebServlet("/EmpresaController")
public class EmpresaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public EmpresaController() {
    	super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String txtCnpj = request.getParameter("txtCnpj");
		String txtRazao = request.getParameter("txtRazao");
		String txtTelefone = request.getParameter("txtTelefone");

		String cmd = request.getParameter("cmd");

		EmpresaDAO eDao = new EmpresaDAOImpl();

		if ("Cadastrar empresa".equals(cmd)) {
			Empresa e = new Empresa();
			e.setCnpjEmpresa(txtCnpj);
			e.setRazaoSocial(txtRazao);
			e.setTelefone(txtTelefone);
			eDao.adicionar(e);
			System.out.println("Empresa adicionado na lista");

		} else if ("Pesquisar".equals(cmd)) {
			List<Empresa> empresas = eDao.pesquisarPorDocumento(txtCnpj);
			HttpSession session = request.getSession();
			session.setAttribute("EMPRESAS", empresas);
			session.setAttribute("MENSAGEM", "Foram localizados " + empresas.size() + " Funcionarios");
		}
		response.sendRedirect("./Empresa.jsp");
	}

}
