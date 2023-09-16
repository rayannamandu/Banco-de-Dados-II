CREATE DATABASE meu_banco_sql
GO

USE meu_banco_sql 
GO

------------------------------------------------------------------------------------------------------------------

CREATE TABLE Clientes (
  IDCliente INT identity(1,1) primary key,
  CodigoDoCliente VARCHAR(5) NOT NULL,
  NomeDaEmpresa VARCHAR(40) NULL,
  NomeDoContato VARCHAR(30) NULL,
  CargoDoContato VARCHAR(30) NULL,
  Endereco VARCHAR(60) NULL,
  Cidade VARCHAR(15) NULL,
  Regiao VARCHAR(15) NULL,
  CEP VARCHAR(10) NULL,
  Pais VARCHAR(15) NULL,
  Telefone VARCHAR(24) NULL,
  Fax VARCHAR(24) NULL
);

------------------------------------------------------------------------------------------------------------------

CREATE TABLE Funcionarios (
  CodigoDoFuncionario INT identity(1,1) primary key,
  Sobrenome VARCHAR(20) NULL,
  Nome VARCHAR(10) NULL,
  Cargo VARCHAR(30) NULL,
  Tratamento VARCHAR(25) NULL,
  DataDeNascimento DATE NULL,
  DataDeContratacao DATE NULL,
  Endereco VARCHAR(60) NULL,
  Cidade VARCHAR(15) NULL,
  Regiao VARCHAR(15) NULL,
  CEP VARCHAR(10) NULL,
  Pais VARCHAR(15) NULL,
  TelefoneResidencial VARCHAR(24) NULL,
  Ramal VARCHAR(4) NULL,
  Foto VARCHAR(15) NULL,
  Observacoes text NULL,
  Supervisor INT NULL,
  CONSTRAINT FK_supervisor FOREIGN KEY (Supervisor) REFERENCES Funcionarios(CodigoDoFuncionario)
);

------------------------------------------------------------------------------------------------------------------

CREATE TABLE Transportadoras (
  CodigoDaTransportadora INT identity(1,1) primary key,
  NomeDaEmpresa VARCHAR(40) NULL,
  Telefone VARCHAR(24) NULL
);

------------------------------------------------------------------------------------------------------------------

CREATE TABLE Pedidos (
  NumeroDoPedido INT identity(1,1) primary key,
  IDCliente INT NULL,
  CodigoDoFuncionario INT NULL,
  DataDoPedido DATE NULL,
  DataDeEntrega DATE NULL,
  DataDeEnvio DATE NULL,
  CodigoDaTransportadora INT NULL,
  Frete DECIMAL(19, 4) NULL,
  NomeDoDestinatario VARCHAR(40) NULL,
  EndereçoDoDestinatario VARCHAR(60) NULL,
  CidadeDeDestino VARCHAR(15) NULL,
  RegiaoDeDestino VARCHAR(15) NULL,
  CEPdeDestino VARCHAR(10) NULL,
  PaisDeDestino VARCHAR(15) NULL,
  CONSTRAINT FK_IDCLiente FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente),
  CONSTRAINT FK_codigofuncionario FOREIGN KEY (CodigoDoFuncionario) REFERENCES Funcionarios(CodigoDoFuncionario),
  CONSTRAINT FK_codigotransportadora FOREIGN KEY (CodigoDaTransportadora) REFERENCES Transportadoras(CodigoDaTransportadora)
);

------------------------------------------------------------------------------------------------------------------

CREATE TABLE Categorias (
  CodigoDaCategoria INT identity(1,1) primary key,
  NomeDaCategoria VARCHAR(15) NULL,
  Descricao VARCHAR(50) NULL,
  Figura VARCHAR(15) NULL
);

------------------------------------------------------------------------------------------------------------------

CREATE TABLE Fornecedores (
  CodigoDoFornecedor INT identity(1,1) primary key,
  NomeDaEmpresa VARCHAR(40) NULL,
  NomeDoContato VARCHAR(30) NULL,
  CargoDoContato VARCHAR(30) NULL,
  Endereco VARCHAR(60) NULL,
  Cidade VARCHAR(15) NULL,
  Regiao VARCHAR(15) NULL,
  CEP VARCHAR(10) NULL,
  Pais VARCHAR(15) NULL,
  Telefone VARCHAR(24) NULL,
  Fax VARCHAR(24) NULL,
  HomePage text NULL
);

------------------------------------------------------------------------------------------------------------------

CREATE TABLE Produtos (
  CodigoDoProduto INT identity(1,1) primary key,
  NomeDoProduto VARCHAR(40) NULL,
  CodigoDoFornecedor INT NULL,
  CodigoDaCategoria INT NULL,
  QuantidadePorUnidade VARCHAR(25) NULL,
  PrecoUnitario DECIMAL(19, 4) NULL,
  UnidadesEmEstoque INT NULL,
  UnidadesPedidas INT NULL,
  NivelDeReposicao INT NULL,
  Descontinuado INT NOT NULL,
  CONSTRAINT FK_codigofornecedor FOREIGN KEY (CodigoDoFornecedor) REFERENCES Fornecedores(CodigoDoFornecedor),
  CONSTRAINT FK_codigocategoria FOREIGN KEY (CodigoDaCategoria) REFERENCES Categorias(CodigoDaCategoria)
);

------------------------------------------------------------------------------------------------------------------

CREATE TABLE Detalhes_do_Pedido (
  NumeroDoPedido INT identity(1,1) primary key,
  CodigoDoProduto INT NULL,
  PrecoUnitário INT NULL,
  Quantidade INT NULL,
  Desconto INT NULL,
  CONSTRAINT FK_codigoproduto FOREIGN KEY (CodigoDoProduto) REFERENCES Produtos(CodigoDoProduto)
);

INSERT INTO Clientes(CodigoDoCliente, NomeDaEmpresa, NomeDoContato, CargoDoContato, Endereco, Cidade, Regiao, CEP, Pais, Telefone, Fax)
VALUES ('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Representante de Vendas', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Alemanha', '030-0074321', '030-0076545'),
('ANATR', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Proprietário', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'México', '(5) 555-4729', '(5) 555-3745'),('ANTON', 'Antonio Moreno Taquería', 'Antonio Moreno', 'Proprietário', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'México', '(5) 555-3932', NULL),('AROUT', 'Around the Horn', 'Thomas Hardy', 'Representante de Vendas', '120 Hanover Sq.', 'London', NULL, 'WA1 1DP', 'Reino Unido', '(171) 555-7788', '(171) 555-6750'),('BERGS', 'Berglunds snabbköp', 'Christina Berglund', 'Administrador de Pedidos', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suécia', '0921-12 34 65', '0921-12 34 67'),('BLAUS', 'Blauer See Delikatessen', 'Hanna Moos', 'Representante de Vendas', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Alemanha', '0621-08460', '0621-08924'),('BLONP', 'Blondel père et fils', 'Frédérique Citeaux', 'Gerente de Marketing', '24, place Kléber', 'Strasbourg', NULL, '67000', 'França', '88.60.15.31', '88.60.15.32'),('BOLID', 'Bólido Comidas preparadas', 'Martín Sommer', 'Proprietário', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Espanha', '(91) 555 22 82', '(91) 555 91 99'),('BONAP', 'Bon app ', 'Laurence Lebihan', 'Proprietário', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'França', '91.24.45.40', '91.24.45.41'),('BOTTM', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Gerente Financeiro', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá', '(604) 555-4729', '(604) 555-3745'),('BSBEV', 'B s Beverages', 'Victoria Ashworth', 'Representante de Vendas', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'Reino Unido', '(171) 555-1212', NULL),('CACTU', 'Cactus Comidas para llevar', 'Patricio Simpson', 'Agente de Vendas', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5555', '(1) 135-4892'),('CENTC', 'Centro comercial Moctezuma', 'Francisco Chang', 'Gerente de Marketing', 'Sierras de Granada 9993', 'México D.F.', NULL, '05022', 'México', '(5) 555-3392', '(5) 555-7293'),('CHOPS', 'Chop-suey Chinese', 'Yang Wang', 'Proprietário', 'Hauptstr. 29', 'Bern', NULL, '3012', 'Suíça', '0452-076545', NULL),('COMMI', 'Comércio Mineiro', 'Pedro Afonso', 'Assessor de Vendas', 'Av. dos Lusíadas, 23', 'São Paulo', 'SP', '05432-043', 'Brasil', '(11) 555-7647', NULL),('CONSH', 'Consolidated Holdings', 'Elizabeth Brown', 'Representante de Vendas', 'Berkeley Gardens\r\n12  Brewery ', 'London', NULL, 'WX1 6LT', 'Reino Unido', '(171) 555-2282', '(171) 555-9199'),('DRACD', 'Drachenblut Delikatessen', 'Sven Ottlieb', 'Administrador de Pedidos', 'Walserweg 21', 'Aachen', NULL, '52066', 'Alemanha', '0241-039123', '0241-059428'),('DUMON', 'Du monde entier', 'Janine Labrune', 'Proprietário', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'França', '40.67.88.88', '40.67.89.89'),('EASTC', 'Eastern Connection', 'Ann Devon', 'Agente de Vendas', '35 King George', 'London', NULL, 'WX3 6FW', 'Reino Unido', '(171) 555-0297', '(171) 555-3373'),('ERNSH', 'Ernst Handel', 'Roland Mendel', 'Gerente de Vendas', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Áustria', '7675-3425', '7675-3426'),  ('FAMIA', 'Familia Arquibaldo', 'Aria Cruz', 'Assistente de Marketing', 'Rua Orós, 92', 'São Paulo', 'SP', '05442-030', 'Brasil', '(11) 555-9857', NULL),
  ('FISSA', 'FISSA Fabrica Inter. Salchichas S.A.', 'Diego Roel', 'Gerente Financeiro', 'C/ Moralzarzal, 86', 'Madrid', NULL, '28034', 'Espanha', '(91) 555 94 44', '(91) 555 55 93'),
  ('FOLIG', 'Folies gourmandes', 'Martine Rancé', 'Assistente do Agente de Vendas', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'França', '20.16.10.16', '20.16.10.17'),
  ('FOLKO', 'Folk och fä HB', 'Maria Larsson', 'Proprietário', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suécia', '0695-34 67 21', NULL),
  ('FRANK', 'Frankenversand', 'Peter Franken', 'Gerente de Marketing', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemanha', '089-0877310', '089-0877451'),
  ('FRANR', 'France restauration', 'Carine Schmitt', 'Gerente de Marketing', '54, rue Royale', 'Nantes', NULL, '44000', 'França', '40.32.21.21', '40.32.21.20'),
  ('FRANS', 'Franchi S.p.A.', 'Paolo Accorti', 'Representante de Vendas', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Itália', '011-4988260', '011-4988261'),
  ('FURIB', 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez ', 'Gerente de Vendas', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', '(1) 354-2534', '(1) 354-2535'),
  ('GALED', 'Galería del gastrónomo', 'Eduardo Saavedra', 'Gerente de Marketing', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '08022', 'Espanha', '(93) 203 4560', '(93) 203 4561'),
  ('GODOS', 'Godos Cocina Típica', 'José Pedro Freyre', 'Gerente de Vendas', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Espanha', '(95) 555 82 82', NULL),
  ('GOURL', 'Gourmet Lanchonetes', 'André Fonseca', 'Assessor de Vendas', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brasil', '(11) 555-9482', NULL),
  ('GREAL', 'Great Lakes Food Market', 'Howard Snyder', 'Gerente de Marketing', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'EUA', '(503) 555-7555', NULL),
  ('GROSR', 'GROSELLA-Restaurante', 'Manuel Pereira', 'Proprietário', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela', '(2) 283-2951', '(2) 283-3397'),
  ('HANAR', 'Hanari Carnes', 'Mario Pontes', 'Gerente Financeiro', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brasil', '(21) 555-0091', '(21) 555-8765'),
  ('HILAA', 'HILARIÓN-Abastos', 'Carlos Hernández', 'Representante de Vendas', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', '(5) 555-1340', '(5) 555-1948'),  ('HUNGC', 'Hungry Coyote Import Store', 'Yoshi Latimer', 'Representante de Vendas', 'City Center Plaza\r\n516 Main St.', 'Elgin', 'OR', '97827', 'EUA', '(503) 555-6874', '(503) 555-2376'),  ('HUNGO', 'Hungry Owl All-Night Grocers', 'Patricia McKenna', 'Assessor de Vendas', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda', '2967 542', '2967 3333'),('ISLAT', 'Island Trading', 'Helen Bennett', 'Gerente de Marketing', 'Garden House\r\nCrowther Way', 'Cowes', 'Isle of Wigth', 'PO31 7PJ', 'Reino Unido', '(198) 555-8888', NULL),('KOENE', 'Königlich Essen', 'Philip Cramer', 'Assessor de Vendas', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Alemanha', '0555-09876', NULL),('LACOR', 'La corne d abondance', 'Daniel Tonini', 'Representante de Vendas', '67, avenue de l Europe', 'Versailles', NULL, '78000', 'França', '30.59.84.10', '30.59.85.11'),('LAMAI', 'La maison d Asie', 'Annette Roulet', 'Gerente de Vendas', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'França', '61.77.61.10', '61.77.61.11'),('LAUGB', 'Laughing Bacchus Wine Cellars', 'Yoshi Tannamuri', 'Assistente de Marketing', '1900 Oak St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canadá', '(604) 555-3392', '(604) 555-7293'),('LAZYK', 'Lazy K Kountry Store', 'John Steel', 'Gerente de Marketing', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'EUA', '(509) 555-7969', '(509) 555-6221'),('LEHMS', 'Lehmanns Marktstand', 'Renate Messner', 'Representante de Vendas', 'Magazinweg 7', 'Frankfurt a.M. ', NULL, '60528', 'Alemanha', '069-0245984', '069-0245874'),('LETSS', 'Let s Stop N Shop', 'Jaime Yorres', 'Proprietário', '87 Polk St.\r\nSuite 5', 'San Francisco', 'CA', '94117', 'EUA', '(415) 555-5938', NULL),('LILAS', 'LILA-Supermercado', 'Carlos González', 'Gerente Financeiro', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', '(9) 331-6954', '(9) 331-7256'),('LINOD', 'LINO-Delicateses', 'Felipe Izquierdo', 'Proprietário', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', '(8) 34-56-12', '(8) 34-93-93'),('LONEP', 'Lonesome Pine Restaurant', 'Fran Wilson', 'Gerente de Vendas', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'EUA', '(503) 555-9573', '(503) 555-9646'),('MAGAA', 'Magazzini Alimentari Riuniti', 'Giovanni Rovelli', 'Gerente de Marketing', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Itália', '035-640230', '035-640231'),('MAISD', 'Maison Dewey', 'Catherine Dewey', 'Agente de Vendas', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Bélgica', '(02) 201 24 67', '(02) 201 24 68'),('MEREP', 'Mère Paillarde', 'Jean Fresnière', 'Assistente de Marketing', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá', '(514) 555-8054', '(514) 555-8055'),('MORGK', 'Morgenstern Gesundkost', 'Alexander Feuer', 'Assistente de Marketing', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Alemanha', '0342-023176', NULL),('NORTS', 'North/South', 'Simon Crowther', 'Assessor de Vendas', 'South House\r\n300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'Reino Unido', '(171) 555-7733', '(171) 555-2530'),('OCEAN', 'Océano Atlántico Ltda.', 'Yvonne Moncada', 'Agente de Vendas', 'Ing. Gustavo Moncada 8585\r\nPiso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5333', '(1) 135-5535'),('OLDWO', 'Old World Delicatessen', 'Rene Phillips', 'Representante de Vendas', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'EUA', '(907) 555-7584', '(907) 555-2880'),('OTTIK', 'Ottilies Käseladen', 'Henriette Pfalzheim', 'Proprietário', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Alemanha', '0221-0644327', '0221-0765721'),('PARIS', 'Paris spécialités', 'Marie Bertrand', 'Proprietário', '265, boulevard Charonne', 'Paris', NULL, '75012', 'França', '(1) 42.34.22.66', '(1) 42.34.22.77'),('PERIC', 'Pericles Comidas clásicas', 'Guillermo Fernández', 'Representante de Vendas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'México', '(5) 552-3745', '(5) 545-3745'),('PICCO', 'Piccolo und mehr', 'Georg Pipps', 'Gerente de Vendas', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Áustria', '6562-9722', '6562-9723'),('PRINI', 'Princesa Isabel Vinhos', 'Isabel de Castro', 'Representante de Vendas', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal', '(1) 356-5634', NULL),('QUEDE', 'Que Delícia', 'Bernardo Batista', 'Gerente Financeiro', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brasil', '(21) 555-4252', '(21) 555-4545'),('QUEEN', 'Queen Cozinha', 'Lúcia Carvalho', 'Assistente de Marketing', 'Alameda dos Canàrios, 891', 'São Paulo', 'SP', '05487-020', 'Brasil', '(11) 555-1189', NULL),('QUICK', 'QUICK-Stop', 'Horst Kloss', 'Gerente Financeiro', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemanha', '0372-035188', NULL),('RANCH', 'Rancho grande', 'Sergio Gutiérrez', 'Representante de Vendas', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 123-5555', '(1) 123-5556'),('RATTC', 'Rattlesnake Canyon Grocery', 'Paula Wilson', 'Assistente do Repr. de Vendas', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'EUA', '(505) 555-5939', '(505) 555-3620'),('REGGC', 'Reggiani Caseifici', 'Maurizio Moroni', 'Assessor de Vendas', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Itália', '0522-556721', '0522-556722'),('RICAR', 'Ricardo Adocicados', 'Janete Limeira', 'Assistente do Agente de Vendas', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brasil', '(21) 555-3412', NULL),('RICSU', 'Richter Supermarkt', 'Michael Holz', 'Gerente de Vendas', 'Grenzacherweg 237', 'Genève', NULL, '1203', 'Suíça', '0897-034214', NULL),('ROMEY', 'Romero y tomillo', 'Alejandra Camino', 'Gerente Financeiro', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Espanha', '(91) 745 6200', '(91) 745 6210'),('SANTG', 'Santé Gourmet', 'Jonas Bergulfsen', 'Proprietário', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Noruega', '07-98 92 35', '07-98 92 47'),('SAVEA', 'Save-a-lot Markets', 'Jose Pavarotti', 'Representante de Vendas', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'EUA', '(208) 555-8097', NULL),('SEVES', 'Seven Seas Imports', 'Hari Kumar', 'Gerente de Vendas', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'Reino Unido', '(171) 555-1717', '(171) 555-5646'),('SIMOB', 'Simons bistro', 'Jytte Petersen', 'Proprietário', 'Vinbæltet 34', 'København', NULL, '1734', 'Dinamarca', '31 12 34 56', '31 13 35 57'),('SPECD', 'Spécialités du monde', 'Dominique Perrier', 'Gerente de Marketing', '25, rue Lauriston', 'Paris', NULL, '75016', 'França', '(1) 47.55.60.10', '(1) 47.55.60.20'),('SPLIR', 'Split Rail Beer & Ale', 'Art Braunschweiger', 'Gerente de Vendas', 'P.O. Box 555', 'Lander', 'WY', '82520', 'EUA', '(307) 555-4680', '(307) 555-6525'),('SUPRD', 'Suprêmes délices', 'Pascale Cartrain', 'Gerente Financeiro', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica', '(071) 23 67 22 20', '(071) 23 67 22 21'),('THEBI', 'The Big Cheese', 'Liz Nixon', 'Gerente de Marketing', '89 Jefferson Way\r\nSuite 2', 'Portland', 'OR', '97201', 'EUA', '(503) 555-3612', NULL),('THECR', 'The Cracker Box', 'Liu Wong', 'Assistente de Marketing', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'EUA', '(406) 555-5834', '(406) 555-8083'),('TOMSP', 'Toms Spezialitäten', 'Karin Josephs', 'Gerente de Marketing', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Alemanha', '0251-031259', '0251-035695'),('TORTU', 'Tortuga Restaurante', 'Miguel Angel Paolino', 'Proprietário', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'México', '(5) 555-2933', NULL),('TRADH', 'Tradição Hipermercados', 'Anabela Domingues', 'Representante de Vendas', 'Av. Inês de Castro, 414', 'São Paulo', 'SP', '05634-030', 'Brasil', '(11) 555-2167', '(11) 555-2168'),('TRAIH', 'Trail s Head Gourmet Provisioners', 'Helvetius Nagy', 'Assessor de Vendas', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'EUA', '(206) 555-8257', '(206) 555-2174'),('VAFFE', 'Vaffeljernet', 'Palle Ibsen', 'Gerente de Vendas', 'Smagsløget 45', 'Århus', NULL, '8200', 'Dinamarca', '86 21 32 43', '86 22 33 44'),('VICTE', 'Victuailles en stock', 'Mary Saveley', 'Agente de Vendas', '2, rue du Commerce', 'Lyon', NULL, '69004', 'França', '78.32.54.86', '78.32.54.87'),('VINET', 'Vins et alcools Chevalier', 'Paul Henriot', 'Gerente Financeiro', '59 rue de l Abbaye', 'Reims', NULL, '51100', 'França', '26.47.15.10', '26.47.15.11'),('WANDK', 'Die Wandernde Kuh', 'Rita Müller', 'Representante de Vendas', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Alemanha', '0711-020361', '0711-035428'),('WARTH', 'Wartian Herkku', 'Pirkko Koskitalo', 'Gerente Financeiro', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlândia', '981-443655', '981-443655'),('WELLI', 'Wellington Importadora', 'Paula Parente', 'Gerente de Vendas', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brasil', '(14) 555-8122', NULL),('WHITC', 'White Clover Markets', 'Karl Jablonski', 'Proprietário', '305 - 14th Ave. S.\r\nSuite 3B', 'Seattle', 'WA', '98128', 'EUA', '(206) 555-4112', '(206) 555-4115'),('WILMK', 'Wilman Kala', 'Matti Karttunen', 'Proprietário/Assist. Marketing', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finlândia', '90-224 8858', '90-224 8858'),('WOLZA', 'Wolski  Zajazd', 'Zbyszek Piestrzeniewicz', 'Proprietário', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Polônia', '(26) 642-7012', '(26) 642-7012');

  SELECT * FROM Clientes
  --WHERE Cidade = 'Berlin'
  GO


  ------------------------------------------------------------------------------------------------------------------

INSERT INTO Categorias(NomeDaCategoria, Descricao, Figura)
VALUES ('Bebidas', 'Refrigerantes, cafés, chás e cervejas', ''),
  ('Condimentos', 'Patês, temperos, picles e molhos doces e salgados', ''),
  ('Confeitos', 'Sobremesas, doces, pães doces', ''),
  ('Laticínios', 'Queijos', ''),
  ('Grãos/Cereais', 'Pães, biscoitos, massas e cereais', ''),
  ('Carnes/Aves', 'Carnes preparadas', ''),
  ('Hortigranjeiros', 'Frutas secas e pastas vegetais', ''),
  ('Frutos do Mar', 'Peixes e algas marinhas', '');

  SELECT * FROM Categorias
  GO

  ------------------------------------------------------------------------------------------------------------------

INSERT INTO Transportadoras(NomeDaEmpresa, Telefone)
VALUES ('Speedy Express', '(503) 555-9831'),
  ('United Package', '(503) 555-3199'),
  ('Federal Shipping', '(503) 555-9931');

SELECT * FROM Transportadoras
GO

 ------------------------------------------------------------------------------------------------------------------


 