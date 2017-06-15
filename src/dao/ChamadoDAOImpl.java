package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Chamado;


public class ChamadoDAOImpl implements ChamadoDAO {

	private Connection con;
	
	public ChamadoDAOImpl() { 
		con = DBUtil.getInstance().getConn();
	}
	
	@Override
	public void adicionar(Chamado c) {
		
		String sql ="INSERT INTO CHAMADO(ID_CHAMADO, TIPO_CHAMADO, MOTIVO_CHAMADO, "
				+ "RETORNO_CHAMADO, IDCLIENTE_CHAMADO,IDRESP_CHAMADO) VALUES(0,?,?,?,?,?)";
		
		try{
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setInt(1, c.getIdChamado());
			psmt.setString(1, c.getTipoChamado());
			psmt.setString(2,  c.getMotivoChamado());
			psmt.setString(3,  c.getRetornoChamado());		
			psmt.setString(4,  c.getCnpjEmpresa());	
			psmt.setString(5,  c.getCpfFuncionario());	
			psmt.executeUpdate();
			psmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public List<Chamado> pesquisarPorDocumento(String cnpjEmpresa) {
		List<Chamado> chamados = new ArrayList<Chamado>();
		String sql ="SELECT ID_CHAMADO,TIPO_CHAMADO, MOTIVO_CHAMADO, RETORNO_CHAMADO,"
				+ " IDCLIENTE_CHAMADO,IDRESP_CHAMADO FROM chamado " + 
				" WHERE IDCLIENTE_CHAMADO like ?";
		try { 
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, "%" + cnpjEmpresa + "%");
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Chamado c = new Chamado();
				c.setIdChamado( rs.getInt("ID_CHAMADO") );
				c.setTipoChamado( rs.getString("TIPO_CHAMADO") );
				c.setMotivoChamado( rs.getString("MOTIVO_CHAMADO") );
				c.setRetornoChamado( rs.getString("RETORNO_CHAMADO") );
				c.setCnpjEmpresa( rs.getString("IDCLIENTE_CHAMADO") );
				c.setCpfFuncionario( rs.getString("IDRESP_CHAMADO") );
				chamados.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chamados;
	}
}
