package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ChamadoDAO;
import dao.ChamadoDAOImpl;
import model.Chamado;

/**
 * Servlet implementation class ChamadoController
 */
@WebServlet("/ChamadoController")
public class ChamadoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public ChamadoController() {
		// TODO Auto-generated constructor stub
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

		int idChamado = 0;
		String txtRazao = request.getParameter("txtRazao");
		String txtMotivo = request.getParameter("txtMotivo");
		String txtResp = request.getParameter("txtResp");
		String txtTipoChamado = request.getParameter("txtTipoChamado");
		String txtRetorno = request.getParameter("txtRetorno");

		String cmd = request.getParameter("cmd");

		ChamadoDAO cDao = new ChamadoDAOImpl();

		if ("Adicionar".equals(cmd)) {
			Chamado c = new Chamado();
			c.setIdChamado(idChamado);
			c.setCnpjEmpresa(txtRazao);
			c.setMotivoChamado(txtMotivo);
			c.setCpfFuncionario(txtResp);
			c.setTipoChamado(txtTipoChamado);
			c.setRetornoChamado(txtRetorno);
			cDao.adicionar(c);

			System.out.println("Chamado adicionado na lista");

		} else if ("Pesquisar por Nome".equals(cmd)) {
			List<Chamado> chamados = cDao.pesquisarPorDocumento(txtRazao);
			HttpSession session = request.getSession();
			session.setAttribute("CHAMADOS", chamados);
			session.setAttribute("MENSAGEM", "Foram localizados " + chamados.size() + " chamados");
		}
		response.sendRedirect("./Chamado.jsp");
	}

}
