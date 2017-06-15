package dao;

import java.util.List;

import model.Funcionario;

public interface ChamadoDAO {
	
	public void adicionar(Chamado );
	public List<Funcionario> pesquisarPorDocumento(String cpfFuncionario);

}
