package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Empresa;

public class EmpresaDAOImpl implements EmpresaDAO{

	private Connection con;

	public EmpresaDAOImpl() {
		con = DBUtil.getInstance().getConn();
	}

	@Override
	public void adicionar(Empresa e) {

		String sql = "INSERT INTO EMPRESA(CNPJ, RAZAO_SOCIAL, TELEFONE) VALUES(?,?,?)";

		try {
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, e.getCnpjEmpresa());
			psmt.setString(2, e.getRazaoSocial());
			psmt.setString(3, e.getTelefone());
			psmt.executeUpdate();
			psmt.close();
			System.out.println("Deu certo !");
		} catch (SQLException ef) {
			ef.printStackTrace();
		}

	}

	@Override
	public List<Empresa> pesquisarPorDocumento(String cnpjEmpresa) {
		List<Empresa> empresas = new ArrayList<Empresa>();
		String sql = "SELECT CNPJ, RAZAO_SOCIAL, TELEFONE FROM EMPRESA WHERE CNPJ LIKE ?";
		try {
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, "%" + cnpjEmpresa + "%");
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Empresa e = new Empresa();
				e.setCnpjEmpresa(rs.getString("CNPJ"));
				e.setRazaoSocial(rs.getString("RAZAO_SOCIAL"));
				e.setTelefone(rs.getString("TELEFONE"));
				empresas.add(e);
			}
		} catch (SQLException ef) {
			ef.printStackTrace();
		}
		return empresas;
	}

}
