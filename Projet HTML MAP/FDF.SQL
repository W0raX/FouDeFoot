
CREATE DATABASE IF NOT EXISTS FDF;
USE FDF;
# -----------------------------------------------------------------------------
#       TABLE : ADHERANT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ADHERANT
 (
   NOADH INTEGER(5) NOT NULL  ,
   USER CHAR(8) NOT NULL  ,
   NOMADH CHAR(40) NULL  ,
   PRENOMADH CHAR(30) NULL  ,
   ADRMAILADH CHAR(50) NULL  ,
   NOTELADH CHAR(15) NULL  ,
   NOPORTADH CHAR(15) NULL  ,
   DTNAISSADH DATE NULL  ,
   NOTELURG CHAR(15) NULL  ,
   DTINSCRIPTION DATE NULL  ,
   DTFINADH DATE NULL  
   , PRIMARY KEY (NOADH) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ADHERANT
# -----------------------------------------------------------------------------


CREATE UNIQUE INDEX I_FK_ADHERANT_COMPTE
     ON ADHERANT (USER ASC);

# -----------------------------------------------------------------------------
#       TABLE : PRESTATION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PRESTATION
 (
   CODEPREST CHAR(6) NOT NULL  ,
   CODETYPEPRESTA CHAR(5) NOT NULL  ,
   NOMPREST CHAR(40) NULL  ,
   NBREPLACE INTEGER(2) NULL  ,
   TARIFPREST DECIMAL(7,2) NULL  ,
   DATECREATION DATE NULL  ,
   DATEVALIDITE DATE NULL  ,
   AGELIMITE INTEGER(2) NULL  ,
   DESCRIPREST CHAR(200) NULL  ,
   COMMENPREST CHAR(255) NULL  
   , PRIMARY KEY (CODEPREST) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PRESTATION
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PRESTATION_TYPE_PRESTA
     ON PRESTATION (CODETYPEPRESTA ASC);

# -----------------------------------------------------------------------------
#       TABLE : TYPE_PRESTA
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TYPE_PRESTA
 (
   CODETYPEPRESTA CHAR(5) NOT NULL  ,
   NOMTYPEPRESTA CHAR(25) NULL  
   , PRIMARY KEY (CODETYPEPRESTA) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ETAT_SEANCE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ETAT_SEANCE
 (
   CODEETATSEANCE CHAR(2) NOT NULL  ,
   NOMETATSEANCE CHAR(15) NULL  
   , PRIMARY KEY (CODEETATSEANCE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : COMPTE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COMPTE
 (
   USER CHAR(8) NOT NULL  ,
   MDP CHAR(10) NULL  ,
   NOMCPTE CHAR(40) NULL  ,
   PRENOMCPTE CHAR(30) NULL  ,
   DATEINSCPTE DATE NULL  ,
   DATESUPCPTE DATE NULL  ,
   TYPECOMPTE CHAR(5) NULL       CHECK (TYPECOMPTE in ("AD","RES","FDF"))
   , PRIMARY KEY (USER) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SEANCE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SEANCE
 (
   CODEPREST CHAR(6) NOT NULL  ,
   DATESEANCE DATE NOT NULL  ,
   CODEETATSEANCE CHAR(2) NOT NULL  ,
   PRIXSEANCE DECIMAL(7,2) NULL  ,
   HEUREDEBSEANCE TIME NULL  ,
   HEUREFINSEANCE TIME NULL  ,
   NOTERRAIN INTEGER(2) NULL  
   , PRIMARY KEY (CODEPREST,DATESEANCE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE SEANCE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_SEANCE_ETAT_SEANCE
     ON SEANCE (CODEETATSEANCE ASC);

CREATE  INDEX I_FK_SEANCE_PRESTATION
     ON SEANCE (CODEPREST ASC);

# -----------------------------------------------------------------------------
#       TABLE : INSCRIPTION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS INSCRIPTION
 (
   CODEPREST CHAR(6) NOT NULL  ,
   DATESEANCE DATE NOT NULL  ,
   NOADH INTEGER(5) NOT NULL  ,
   DATEINSCRIP DATE NULL  ,
   DATEANNULATIONINSCRIP DATE NULL  ,
   NBREJOUEUR INTEGER(2) NULL  
   , PRIMARY KEY (CODEPREST,DATESEANCE,NOADH) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE INSCRIPTION
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_INSCRIPTION_SEANCE
     ON INSCRIPTION (CODEPREST ASC,DATESEANCE ASC);

CREATE  INDEX I_FK_INSCRIPTION_ADHERANT
     ON INSCRIPTION (NOADH ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE ADHERANT 
  ADD FOREIGN KEY FK_ADHERANT_COMPTE (USER)
      REFERENCES COMPTE (USER) ;


ALTER TABLE PRESTATION 
  ADD FOREIGN KEY FK_PRESTATION_TYPE_PRESTA (CODETYPEPRESTA)
      REFERENCES TYPE_PRESTA (CODETYPEPRESTA) ;


ALTER TABLE SEANCE 
  ADD FOREIGN KEY FK_SEANCE_ETAT_SEANCE (CODEETATSEANCE)
      REFERENCES ETAT_SEANCE (CODEETATSEANCE) ;


ALTER TABLE SEANCE 
  ADD FOREIGN KEY FK_SEANCE_PRESTATION (CODEPREST)
      REFERENCES PRESTATION (CODEPREST) ;


ALTER TABLE INSCRIPTION 
  ADD FOREIGN KEY FK_INSCRIPTION_SEANCE (CODEPREST,DATESEANCE)
      REFERENCES SEANCE (CODEPREST,DATESEANCE) ;


ALTER TABLE INSCRIPTION 
  ADD FOREIGN KEY FK_INSCRIPTION_ADHERANT (NOADH)
      REFERENCES ADHERANT (NOADH) ;

