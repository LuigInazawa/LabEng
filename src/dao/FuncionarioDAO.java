package dao;

import java.util.List;
import model.Funcionario;

public interface FuncionarioDAO {

	public void adicionar(Funcionario f);
	public List<Funcionario> pesquisarPorDocumento(String cpfFuncionario);
}
