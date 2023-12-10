create database ajeitalar;
use ajeitalar;

CREATE TABLE Pedido 
( 
 PK_idpedi INT PRIMARY KEY AUTO_INCREMENT NOT NULL,  
 FK_idcliente INT,  
 FK_idcand INT,  
 pedi_img VARCHAR(255),  
 ped_tipo_imovel enum('casa','apartamento','kitnet','sobrado','Flat') NOT NULL,  
 pedi_descr VARCHAR(200) NOT NULL,  
 pedi_status enum('pendente', 'andamento', 'concluido') NOT NULL DEFAULT 'pendente',  
 pedi_tipo VARCHAR(100) NOT NULL,  
 pedi_nece_material BOOLEAN NOT NULL,  
 pedi_material VARCHAR(200),  
 pedi_informacao VARCHAR(200),
 pedi_data VARCHAR(10)
); 

CREATE TABLE Cliente 
( 
 PK_idclien INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
 clien_nome VARCHAR(100) NOT NULL,  
 clien_nasc VARCHAR(10) NOT NULL,  
 clien_bairro VARCHAR(100) NOT NULL,  
 clien_rua VARCHAR(100) NOT NULL,  
 clien_CEP INT NOT NULL,  
 clien_CPF VARCHAR(14) NOT NULL  
); 

CREATE TABLE Candidatura 
( 
 PK_idcand INT PRIMARY KEY AUTO_INCREMENT,  
 canda_msg VARCHAR(200) NOT NULL,  
 FK_idpresta INT
); 

CREATE TABLE Avaliacao 
( 
 PK_idvalia INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
 FK_idclien INT,  
 FK_idpresta INT,  
 valia_data VARCHAR(10) NOT NULL,  
 vali_msg VARCHAR(200) NOT NULL,  
 valia_classificacao INT NOT NULL DEFAULT '5'  
); 

CREATE TABLE Prestador 
( 
 PK_idpresta INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
 presta_nome VARCHAR(100) NOT NULL,  
 presta_nasc VARCHAR(10) NOT NULL,  
 presta_bairro VARCHAR(100) NOT NULL,  
 presta_rua VARCHAR(100) NOT NULL,  
 presta_CEP VARCHAR(100) NOT NULL,  
 presta_CPF VARCHAR(14) NOT NULL  
); 

ALTER TABLE Pedido ADD FOREIGN KEY(FK_idcliente) REFERENCES Cliente (PK_idclien);
ALTER TABLE Pedido ADD FOREIGN KEY(FK_idcand) REFERENCES Candidatura (PK_idcand);

ALTER TABLE Candidatura ADD FOREIGN KEY(FK_idpresta) REFERENCES Prestador (PK_idpresta);

ALTER TABLE Avaliacao ADD FOREIGN KEY(FK_idclien) REFERENCES Cliente (PK_idclien);
ALTER TABLE Avaliacao ADD FOREIGN KEY(FK_idpresta) REFERENCES Prestador (PK_idpresta);