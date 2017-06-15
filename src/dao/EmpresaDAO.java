package dao;

import java.util.List;

import model.Empresa;

public interface EmpresaDAO {

	public void adicionar(Empresa e);
	public List<Empresa> pesquisarPorDocumento(String cnpjEmpresa);
}
