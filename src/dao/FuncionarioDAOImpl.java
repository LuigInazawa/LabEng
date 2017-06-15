package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Funcionario;

public class FuncionarioDAOImpl implements FuncionarioDAO {

	private Connection con;

	public FuncionarioDAOImpl() {
		con = DBUtil.getInstance().getConn();
	}

	@Override
	public void adicionar(Funcionario f) {

		String sql = "INSERT INTO RESP(CPF, RESP_NOME, RESP_CARGO) VALUES(?,?,?)";

		try {
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, f.getCpfFuncionario());
			psmt.setString(2, f.getNome());
			psmt.setString(3, f.getCargo());
			psmt.executeUpdate();
			psmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<Funcionario> pesquisarPorDocumento(String cpfFuncionario) {
		List<Funcionario> funcionarios = new ArrayList<Funcionario>();
		String sql = "SELECT CPF,RESP_NOME, RESP_CARGO FROM RESP WHERE CPF LIKE ?";
		try {
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, "%" + cpfFuncionario + "%");
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Funcionario f = new Funcionario();
				f.setCpfFuncionario(rs.getString("CPF"));
				f.setNome(rs.getString("RESP_NOME"));
				f.setCargo(rs.getString("RESP_CARGO"));
				funcionarios.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return funcionarios;
	}

}
