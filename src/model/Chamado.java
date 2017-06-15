package model;

public class Chamado {
	
	private int idChamado;
	private String tipoChamado;
	private String motivoChamado;
	private String retornoChamado;
	private String cnpjCliente;
	private String cpfFuncionario;
	
	public String getCnpjCliente() {
		return cnpjCliente;
	}
	public void setCnpjCliente(String cnpjCliente) {
		this.cnpjCliente = cnpjCliente;
	}
	public String getCpfFuncionario() {
		return cpfFuncionario;
	}
	public void setCpfFuncionario(String cpfFuncionario) {
		this.cpfFuncionario = cpfFuncionario;
	}
	public int getIdChamado() {
		return idChamado;
	}
	public void setIdChamado(int idChamado) {
		this.idChamado = idChamado;
	}
	public String getTipoChamado() {
		return tipoChamado;
	}
	public void setTipoChamado(String tipoChamado) {
		this.tipoChamado = tipoChamado;
	}
	public String getMotivoChamado() {
		return motivoChamado;
	}
	public void setMotivoChamado(String motivoChamado) {
		this.motivoChamado = motivoChamado;
	}
	public String getRetornoChamado() {
		return retornoChamado;
	}
	public void setRetornoChamado(String retornoChamado) {
		this.retornoChamado = retornoChamado;
	}

	
	
	

}
