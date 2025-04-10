CREATE TABLE FILME (
  cd_filme NUMERIC(5)   NOT NULL ,
  nm_filme VARCHAR(30)      ,
PRIMARY KEY(cd_filme));



CREATE TABLE CLIENTE (
  cd_cliente NUMERIC(5)   NOT NULL ,
  nm_cliente VARCHAR(30)      ,
PRIMARY KEY(cd_cliente));



CREATE TABLE SOLICITACAO_LOCACAO (
  cd_solicitacao_locacao INTEGER   NOT NULL ,
  CLIENTE_cd_cliente NUMERIC(5)   NOT NULL ,
  dt_solicitacao_locacao DATE      ,
PRIMARY KEY(cd_solicitacao_locacao),
  FOREIGN KEY(CLIENTE_cd_cliente)
    REFERENCES CLIENTE(cd_cliente));

CREATE INDEX IFK_solicita ON SOLICITACAO_LOCACAO (CLIENTE_cd_cliente);


CREATE TABLE COPIA_FILME (
  cd_copia_filme NUMERIC(5)   NOT NULL ,
  FILME_cd_filme NUMERIC(5)   NOT NULL   ,
PRIMARY KEY(cd_copia_filme, FILME_cd_filme),
  FOREIGN KEY(FILME_cd_filme)
    REFERENCES FILME(cd_filme));

CREATE INDEX IFK_possui ON COPIA_FILME (FILME_cd_filme);


CREATE TABLE SOLICITACAO_LOCACAO_has_COPIA_FILME (
  SOLICITACAO_LOCACAO_cd_solicitacao_locacao INTEGER   NOT NULL ,
  COPIA_FILME_FILME_cd_filme NUMERIC(5)   NOT NULL ,
  COPIA_FILME_cd_copia_filme NUMERIC(5)   NOT NULL ,
  dt_prevista_devolucao DATE    ,
  dt_real_devolucao DATE      ,
PRIMARY KEY(SOLICITACAO_LOCACAO_cd_solicitacao_locacao, COPIA_FILME_FILME_cd_filme, COPIA_FILME_cd_copia_filme),
  FOREIGN KEY(SOLICITACAO_LOCACAO_cd_solicitacao_locacao)
    REFERENCES SOLICITACAO_LOCACAO(cd_solicitacao_locacao),
  FOREIGN KEY(COPIA_FILME_cd_copia_filme, COPIA_FILME_FILME_cd_filme)
    REFERENCES COPIA_FILME(cd_copia_filme, FILME_cd_filme));

CREATE INDEX IFK_tem ON SOLICITACAO_LOCACAO_has_COPIA_FILME (SOLICITACAO_LOCACAO_cd_solicitacao_locacao);
CREATE INDEX IFK_e_tido ON SOLICITACAO_LOCACAO_has_COPIA_FILME (COPIA_FILME_cd_copia_filme, COPIA_FILME_FILME_cd_filme);



