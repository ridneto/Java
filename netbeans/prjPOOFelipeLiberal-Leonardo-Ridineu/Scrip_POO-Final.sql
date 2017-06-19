CREATE TABLE Vendedor(
	CPF varchar2(15) PRIMARY KEY,
	Nome varchar(100),
	Endereco varchar2(100),
	CEP varchar(8),
	Cidade varchar2(100),
	UF varchar(10),
	Telefone_DDD varchar2(3),
	Telefone_Numero varchar(9),
	Salario_Base number(10, 2),
	Comissao number(4, 2) );
	
CREATE TABLE Cliente(
	CPF varchar2(15) PRIMARY KEY,
	Nome varchar(100),
	Endereco varchar2(100),
	CEP varchar(8),
	Cidade varchar2(100),
	UF varchar(10),
	Telefone_DDD varchar2(3),
	Telefone_Numero varchar(9),
	Limite_Credito number(10, 2),
	Limite_Disponivel number(10, 2) );
	
CREATE TABLE Produto(
	CodigoProduto number(5,0) PRIMARY KEY,
	Descricao varchar(100),
	QtdeDisponivel number(10, 0),
	PrecoUnit number(10, 2),
	EstoqueMinimo number(10, 0)	);
	
CREATE TABLE Pedido(
	Numero number(5, 0) PRIMARY KEY,
	Status varchar2(1) check (Status in ('0', '1')), 
	DataPedido varchar2(8),
	DataPagto varchar2(8),
	CPFCliente varchar2(15) REFERENCES Cliente,
	CPFVendedor varchar2(15) REFERENCES Vendedor );
	
CREATE TABLE Item_Pedido(
	NumeroPedido number(5, 0) REFERENCES Pedido,
	CodigoProduto number(5, 0) REFERENCES Produto,
	QtVendida number(10, 0) );