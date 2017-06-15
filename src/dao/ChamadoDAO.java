package dao;

import java.util.List;

import model.Chamado;

public interface ChamadoDAO {
	
	public void adicionar(Chamado c);
	public List<Chamado> pesquisarPorDocumento(String cnpjEmpresa);

}
