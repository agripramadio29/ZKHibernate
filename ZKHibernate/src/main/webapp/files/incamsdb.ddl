
CREATE TABLE 
    MPRODUCTTYPE 
    ( 
        MPRODUCTTYPEPK		  INTEGER NOT NULL, 
        PRODUCTTYPE	  CHARACTER(20) DEFAULT '', /* ATM, JAKCARD */
        LASTUPDATED DATE,
        UPDATEDBY CHAR(20) DEFAULT '',
        PRIMARY KEY (MPRODUCTTYPEPK) 
    );
    
CREATE TABLE 
    tcounterengine 
    ( 
        countername CHARACTER(70) DEFAULT '', 
        lastcounter INTEGER DEFAULT 0 
    );
    
CREATE TABLE 
    MSYSPARAM 
    ( 
        PARAMCODE   CHARACTER(30) DEFAULT ''::BPCHAR NOT NULL, 
        PARAMVALUE  CHARACTER(100) DEFAULT ''::BPCHAR, 
        PARAMDESC   CHARACTER(100) DEFAULT ''::BPCHAR, 
        PARAMGROUP  CHARACTER(30) DEFAULT ''::BPCHAR, 
		ORDERNO     INTEGER DEFAULT 0, 
        ISMASKED    CHARACTER(1) DEFAULT 'N'::BPCHAR, 
        LASTUPDATED TIMESTAMP(6) WITHOUT TIME ZONE, 
        UPDATEDBY   CHARACTER(20) DEFAULT ''::BPCHAR, 
        PRIMARY KEY (PARAMCODE) 
    );
	
CREATE TABLE 
    MUNIT 
    ( 
        MUNITPK		  INTEGER NOT NULL, 
        UNITCODE	  CHARACTER(5) DEFAULT '', /* PPA, OPS, DIG, CAB, MER, VEN */
		UNITNAME	  CHARACTER(40) DEFAULT '',
        PRIMARY KEY (MUNITPK) 
    );
	
CREATE SEQUENCE MUSERGROUP_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE 
    MUSERGROUP 
    ( 
        MUSERGROUPPK  INTEGER NOT NULL, 
        USERGROUPCODE CHARACTER(20) DEFAULT '', 
        USERGROUPNAME CHARACTER(40) DEFAULT '', 
        USERGROUPDESC CHARACTER(100) DEFAULT '', 
        UNITCODE	  CHAR(5) DEFAULT '',
		CREATETIME TIMESTAMP,
		CREATEDBY CHAR(20) DEFAULT '',
        LASTUPDATED   TIMESTAMP(6) WITHOUT TIME ZONE, 
        UPDATEDBY     CHARACTER(20) DEFAULT '', 
        PRIMARY KEY (MUSERGROUPPK) 
    );

CREATE SEQUENCE MREGION_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE 
    MREGION 
    ( 
        MREGIONPK   INTEGER NOT NULL, 
        REGIONCODE  CHARACTER(10) DEFAULT '', 
        REGIONNAME  CHARACTER(70) DEFAULT '', 
        LASTUPDATED TIMESTAMP(6) WITHOUT TIME ZONE, 
        UPDATEDBY   CHARACTER(15) DEFAULT '', 
        PRIMARY KEY (MREGIONPK) 
    );
	
CREATE SEQUENCE MBRANCH_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;    
CREATE TABLE 
    MBRANCH 
    ( 
        MBRANCHPK        INTEGER NOT NULL, 
        MREGIONFK        INTEGER, 
        BRANCHCODE       CHARACTER(10) DEFAULT '', 
        BRANCHNAME       CHARACTER(70) DEFAULT '', 
		BRANCHADDRESS    CHARACTER(200) DEFAULT '', 
        BRANCHCITY       CHARACTER(70) DEFAULT '', 
		ISHO		     CHARACTER(1), 
        LASTUPDATED      TIMESTAMP(6) WITHOUT TIME ZONE, 
        UPDATEDBY        CHARACTER(20) DEFAULT '', 
        PRIMARY KEY (MBRANCHPK), 
        CONSTRAINT MBRANCH_FK1 FOREIGN KEY (MREGIONFK) REFERENCES MREGION (MREGIONPK) ON 
DELETE 
    CASCADE
    );

CREATE SEQUENCE MUSER_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE MUSER ( 
	MUSERPK INTEGER NOT NULL, 
	MBRANCHFK  INTEGER, 
	MUSERGROUPFK   INTEGER NOT NULL, 
	USERID CHARACTER(20) DEFAULT ''::BPCHAR, 
	USERNAME   CHARACTER(40) DEFAULT ''::BPCHAR, 
	PASSWORD   CHARACTER(70) DEFAULT ''::BPCHAR, 
	LASTLOGIN  TIMESTAMP, 
	CREATETIME TIMESTAMP,
	CREATEDBY CHAR(20) DEFAULT '',
	LASTUPDATED TIMESTAMP(6) WITHOUT TIME ZONE, 
	UPDATEDBY  CHARACTER(20) DEFAULT ''::BPCHAR, 
	PRIMARY KEY (MUSERPK), 
	CONSTRAINT MUSER_FK1 FOREIGN KEY (MUSERGROUPFK) REFERENCES MUSERGROUP (MUSERGROUPPK) 
	ON 
	DELETE 
	RESTRICT,
	CONSTRAINT MUSER_FK2 FOREIGN KEY (MBRANCHFK) REFERENCES MBRANCH (MBRANCHPK) 
	ON 
	DELETE 
	RESTRICT
);

CREATE SEQUENCE MMENU_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE 
    MMENU 
    ( 
        MMENUPK          INTEGER NOT NULL, 
        MENUORDERNO      INTEGER DEFAULT 0, 
        MENUGROUP        CHARACTER(20) DEFAULT '', 
        MENUSUBGROUP     CHARACTER(20) DEFAULT '', 
        MENUNAME         CHARACTER(40) DEFAULT '', 
        MENUPATH         CHARACTER(70) DEFAULT '', 
        MENUPARAMNAME    CHARACTER(10) DEFAULT '', 
        MENUPARAMVALUE   CHARACTER(20) DEFAULT '', 
        MENUGROUPICON    CHARACTER(50), 
        MENUSUBGROUPICON CHARACTER(50), 
        MENUICON         CHARACTER(50), 
        PRIMARY KEY (MMENUPK) 
    );
	
CREATE SEQUENCE MUSERGROUPMENU_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE MUSERGROUPMENU ( 
	MUSERGROUPMENUPK INTEGER NOT NULL, 
	MUSERGROUPFK INTEGER NOT NULL, 
	MMENUFK  INTEGER NOT NULL, 
	PRIMARY KEY (MUSERGROUPMENUPK), 
	CONSTRAINT MUSERGROUPMENU_FK1 FOREIGN KEY (MUSERGROUPFK) REFERENCES MUSERGROUP 
	(MUSERGROUPPK) ON 
	DELETE 
	CASCADE, 
	CONSTRAINT MUSERGROUPMENU_FK2 FOREIGN KEY (MMENUFK) REFERENCES MMENU (MMENUPK) 
	ON 
	DELETE 
	CASCADE 
);

CREATE SEQUENCE MVENDOR_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE 
    MVENDOR 
    ( 
        MVENDORPK INTEGER NOT NULL, 
        VENDORCODE     CHARACTER(10) DEFAULT '', 
        VENDORNAME     CHARACTER(70) DEFAULT '', 
        VENDORPICNAME  CHARACTER(40) DEFAULT '', 
        VENDORPICPHONE CHARACTER(20) DEFAULT '', 
        VENDORPICEMAIL CHARACTER(100) DEFAULT '', 
		VENDORLOGO     CHARACTER(50) DEFAULT '', 
		ADDRESS1 CHAR(70) DEFAULT '',
		ADDRESS2 CHAR(70) DEFAULT '',
		ADDRESS3 CHAR(70) DEFAULT '',
		ADDRESS4 CHAR(70) DEFAULT '',
		CITY CHAR(70) DEFAULT '',
		ZIPCODE CHAR(5) DEFAULT '',
        CREATETIME TIMESTAMP,
		CREATEDBY CHAR(20) DEFAULT '',
		LASTUPDATED    TIMESTAMP(6) WITHOUT TIME ZONE, 
        UPDATEDBY      CHARACTER(20) DEFAULT '', 
        PRIMARY KEY (MVENDORPK) 
    );

CREATE SEQUENCE MHOLIDAY_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE 
    MHOLIDAY 
    ( 
        MHOLIDAYPK  INTEGER NOT NULL, 
        HOLIDAY     DATE, 
        DESCRIPTION CHARACTER(70) DEFAULT '', 
        LASTUPDATED TIMESTAMP(6) WITHOUT TIME ZONE, 
        UPDATEDBY   CHARACTER(20) DEFAULT '', 
        PRIMARY KEY (MHOLIDAYPK) 
    );

CREATE SEQUENCE MPRODUCT_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;	
CREATE TABLE 
    MPRODUCT 
    ( 
        MPRODUCTPK     INTEGER NOT NULL, 
       	MPRODUCTTYPEFK INTEGER,
        PRODUCTCODE    CHARACTER(10) DEFAULT '', 
        PRODUCTNAME    CHARACTER(70) DEFAULT '', 
        PREFIX       CHARACTER(6) DEFAULT '',
		LASTNO    INTEGER DEFAULT 0,
		CARDIMGID CHAR(20) DEFAULT '' ,
		CARDIMGNAME CHAR(100) DEFAULT '' ,
		ARTWORKIMGID CHAR(20) DEFAULT '' ,
		ARTWORKIMGNAME CHAR(100) DEFAULT '' ,
        STOCKMIN              INTEGER DEFAULT 0, 
        ESTDAYS               INTEGER DEFAULT 0, 
        ESTDATE               DATE, 
        VELOCITY              INTEGER DEFAULT 0, 
        LASTUPDATED    TIMESTAMP(6) WITHOUT TIME ZONE, 
        UPDATEDBY      CHARACTER(20) DEFAULT '', 
        PRIMARY KEY (MPRODUCTPK),
        CONSTRAINT MPRODUCTTYPE_FK1 FOREIGN KEY (MPRODUCTTYPEFK) REFERENCES MPRODUCTTYPE (MPRODUCTTYPEPK) ON DELETE RESTRICT
    );

CREATE SEQUENCE TORDER_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE TORDER (
	TORDERPK INTEGER NOT NULL,
	MBRANCHFK INTEGER,
	MPRODUCTFK INTEGER,
	ORDERNO CHAR(20) DEFAULT '',
	MEMONO CHAR(20) DEFAULT '',
	ORDERDATE DATE,
	ORDERQTY INTEGER DEFAULT 0,
	TOTALPROSES INTEGER DEFAULT 0;
	ORDERAMOUNT DECIMAL(17,0) DEFAULT 0,
	UNITREQ CHAR(5) DEFAULT '',
	UNITCURR CHAR(5) DEFAULT '',
	PREFIX CHAR(6) DEFAULT '',
	CARDNOSTART INTEGER,
	ISDONE CHAR(1) DEFAULT '',
	STATUS CHAR(2) DEFAULT '',
	STATUSFLOW INTEGER DEFAULT 0,
	CARDFILENAME CHAR(70) DEFAULT '',
	CREATETIME TIMESTAMP,
	CREATEDBY CHAR(20),
	LASTUPDATED TIMESTAMP,
	UPDATEDBY CHAR(20),
	DECISIONTIME TIMESTAMP,
	DECISIONBY CHAR(20),
	DECISIONNOTES CHAR(100) DEFAULT '',
	TGLTERIMA DATE,
	PENERIMA CHAR(40) DEFAULT '',
	SALECUSTNAME CHAR(40) DEFAULT '',
	SALEDATE DATE,
	PRIMARY KEY (TORDERPK),
	CONSTRAINT TORDER_FK1 FOREIGN KEY (MBRANCHFK) REFERENCES MBRANCH (MBRANCHPK) ON DELETE RESTRICT,
	CONSTRAINT TORDER_FK2 FOREIGN KEY (MPRODUCTFK) REFERENCES MPRODUCT (MPRODUCTPK) ON DELETE RESTRICT
);

CREATE SEQUENCE TPROCUR_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE TPROCUR (
	TPROCURPK INTEGER NOT NULL, 
	MVENDORFK INTEGER,
	MPRODUCTTYPEFK INTEGER,
	PKSNO CHAR(20) DEFAULT '',
	PKSDATE DATE,
	PKSUNIT CHAR(5) DEFAULT '',
	PROCURAMOUNT DECIMAL(17,0) DEFAULT 0,
	PROCURQTY INTEGER DEFAULT 0,
	ITEMPRICE DECIMAL(6,0) DEFAULT 0,
	PROCURDOCID CHAR(20) DEFAULT '',
	PROCURDOCNAME CHAR(100) DEFAULT '',
	POQTY INTEGER DEFAULT 0,
	ISACTIVE CHAR(1) DEFAULT '',
	CREATETIME TIMESTAMP,
	CREATEDBY CHAR(20) DEFAULT '',
	LASTUPDATED TIMESTAMP,
	UPDATEDBY CHAR(20),
	PRIMARY KEY (TPROCURPK),
	CONSTRAINT TPROCUR_FK1 FOREIGN KEY (MVENDORFK) REFERENCES MVENDOR (MVENDORPK) ON DELETE RESTRICT,
	CONSTRAINT TPROCUR_FK2 FOREIGN KEY (MPRODUCTTYPEFK) REFERENCES MPRODUCTTYPE (MPRODUCTTYPEPK) ON DELETE RESTRICT
);

CREATE SEQUENCE TPO_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE TPO (
	TPOPK INTEGER NOT NULL,
	TORDERFK INTEGER,
	TPROCURFK INTEGER,
	UNITCODE CHAR(5) DEFAULT '',
	PONO CHAR(20) DEFAULT '',
	PODATE DATE,
	POQTY INTEGER DEFAULT 0,
	ITEMPRICE DECIMAL(6,0) DEFAULT 0,
	POAMOUNT DECIMAL(17,0) DEFAULT 0,
	CARDNOBEGIN INTEGER DEFAULT 0,
	CARDNOEND INTEGER DEFAULT 0,
	STATUS CHAR(2) DEFAULT '',
	CREATETIME TIMESTAMP,
	CREATEDBY CHAR(20) DEFAULT '',
	LASTUPDATED TIMESTAMP,
	UPDATEDBY CHAR(20) DEFAULT '',
	PRIMARY KEY (TPOPK),
	CONSTRAINT TPO_FK1 FOREIGN KEY (TORDERFK) REFERENCES TORDER (TORDERPK) ON DELETE RESTRICT,
	CONSTRAINT TPO_FK2 FOREIGN KEY (TPROCURFK) REFERENCES TPROCUR (TPROCURPK) ON DELETE RESTRICT
);

CREATE SEQUENCE TDO_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE TDO (
	TDOPK INTEGER NOT NULL,
	TPOFK INTEGER,
	DONO CHAR(20) DEFAULT '',
	DODATE DATE,
	DOQTY INTEGER DEFAULT 0,
	CARDNOBEGIN INTEGER DEFAULT 0,
	CARDNOEND INTEGER DEFAULT 0,
	CARDFILEID CHAR(20) DEFAULT '',
	CARDFILENAME CHAR(100) DEFAULT '',
	STATUS CHAR(2) DEFAULT '',
	NOTES CHAR(100) DEFAULT '',
	CREATETIME TIMESTAMP,
	CREATEDBY CHAR(20) DEFAULT '',
	LASTUPDATED TIMESTAMP,
	UPDATEDBY CHAR(20) DEFAULT '',
	PRIMARY KEY (TDOPK),
	CONSTRAINT TDO_FK1 FOREIGN KEY (TPOFK) REFERENCES TPO (TPOPK) ON DELETE RESTRICT
);

CREATE SEQUENCE TDOCARDNO_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE TDOCARDNO (
	TDOCARDNOPK INTEGER NOT NULL,
	TDOFK INTEGER,
	CARDNO CHAR(16) DEFAULT '',
	PRIMARY KEY (TDOCARDNOPK),
	CONSTRAINT TDOCARDNO_FK1 FOREIGN KEY (TDOFK) REFERENCES TDO (TDOPK) ON DELETE CASCADE
);

CREATE SEQUENCE TORDERDOC_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE TORDERDOC (
	TORDERDOCPK INTEGER NOT NULL,
	TORDERFK INTEGER,
	DOCID CHAR(20) DEFAULT '',
	DOCFILENAME CHAR(100) DEFAULT '',
	DOCFILESIZE INTEGER DEFAULT 0,
	DOCTIME TIMESTAMP,
	PRIMARY KEY (TORDERDOCPK),
	CONSTRAINT TORDERDOC_FK1 FOREIGN KEY (TORDERFK) REFERENCES TORDER (TORDERPK) ON DELETE CASCADE
);

CREATE SEQUENCE TORDERMEMO_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE TORDERMEMO (
	TORDERMEMOPK INTEGER NOT NULL,
	TORDERFK INTEGER,
	MEMO CHAR(200) DEFAULT '',
	MEMOBY CHAR(40) DEFAULT '',
	MEMOTIME TIMESTAMP,	
	UNITCODE CHAR(5) DEFAULT '',
	PRIMARY KEY (TORDERMEMOPK), 
	CONSTRAINT TORDERMEMO_FK1 FOREIGN KEY (TORDERFK) REFERENCES TORDER (TORDERPK) ON DELETE CASCADE
);

CREATE SEQUENCE TSTOCK_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE 
    TSTOCK 
    ( 
        TSTOCKPK INTEGER NOT NULL, 
        MBRANCHFK      INTEGER NOT NULL, 
        MPRODUCTFK     INTEGER NOT NULL, 
		UNITCODE		CHAR(5) DEFAULT '',
        INCOMING	 INTEGER DEFAULT 0, 
		STOCK			INTEGER DEFAULT 0,
        OUTGOING    INTEGER DEFAULT 0, 
        RESERVED    INTEGER DEFAULT 0,
        PRIMARY KEY (TSTOCKPK), 
        CONSTRAINT TSTOCK_FK1 FOREIGN KEY (MBRANCHFK) REFERENCES MBRANCH (MBRANCHPK) ON 
DELETE 
    RESTRICT, 
    CONSTRAINT TSTOCK_FK2 FOREIGN KEY (MPRODUCTFK) REFERENCES MPRODUCT (MPRODUCTPK) 
ON 
DELETE 
    RESTRICT 
    );
    
CREATE SEQUENCE TCARDNO_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE TCARDNO (
	TCARDNOPK INTEGER NOT NULL,
	TORDERFK INTEGER,
	TPROCURFK INTEGER,
	TSTOCKFK INTEGER,
	CARDNO CHAR(16) DEFAULT '',
	CARDPRICE DECIMAL(6,0) DEFAULT 0,
	CARDSTATUS CHAR(2) DEFAULT '',
	UNITCODE CHAR(5) DEFAULT '',
    LASTSTOCK INTEGER DEFAULT 0, 
	STOCKRESERVED INTEGER DEFAULT 0, 
	CREATETIME TIMESTAMP,
	CREATEDBY CHAR(20) DEFAULT '',
	LASTUPDATED TIMESTAMP,
	UPDATEDBY CHAR(20),
	PRIMARY KEY (TCARDNOPK),
	CONSTRAINT TCARDNO_FK1 FOREIGN KEY (TORDERFK) REFERENCES TORDER (TORDERPK) ON DELETE CASCADE,
	CONSTRAINT TCARDNO_FK2 FOREIGN KEY (TPROCURFK) REFERENCES TPROCUR (TPROCURPK) ON DELETE RESTRICT,
	CONSTRAINT TCARDNO_FK3 FOREIGN KEY (TSTOCKFK) REFERENCES TSTOCK (TSTOCKPK) ON DELETE RESTRICT
);

CREATE SEQUENCE TCARDHISTORY_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE TCARDHISTORY (
	TCARDHISTORYPK INTEGER NOT NULL,
	TCARDNOFK INTEGER,
	UNITCODE CHAR(5) DEFAULT '',
	STATUS CHAR(2) DEFAULT '',
	DESCRIPTION CHAR(100) DEFAULT '',
	CARDTIME TIMESTAMP,
	PRIMARY KEY (TCARDHISTORYPK),
	CONSTRAINT TCARDHISTORY_FK1 FOREIGN KEY (TCARDNOFK) REFERENCES TCARDNO (TCARDNOPK) ON DELETE CASCADE
);

CREATE SEQUENCE TORDERCARD_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE TORDERCARD (
	TORDERCARDPK INTEGER NOT NULL,
	TORDERFK INTEGER,
	TCARDNOFK INTEGER,
	PRIMARY KEY (TORDERCARDPK),
	CONSTRAINT TORDERCARD_FK1 FOREIGN KEY (TORDERFK) REFERENCES TORDER (TORDERPK) ON DELETE CASCADE,
	CONSTRAINT TORDERCARD_FK2 FOREIGN KEY (TCARDNOFK) REFERENCES TCARDNO (TCARDNOPK) ON DELETE RESTRICT
);

CREATE SEQUENCE MFLOW_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE MFLOW (
	MFLOWPK INTEGER NOT NULL,
	UNITCODE CHAR(5) DEFAULT '',
	FLOWORDERNO INTEGER DEFAULT 0,
	ISDONE CHAR(1) DEFAULT ''
);

CREATE SEQUENCE TORDERFLOW_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE 
    TORDERFLOW 
    ( 
        TORDERFLOWPK    INTEGER NOT NULL, 
        TORDERFK        INTEGER, 
        FLOWNO        CHARACTER(20) DEFAULT '', 
        UNITCODE       CHARACTER(5) DEFAULT '', 
		STARTTIME		TIMESTAMP,
		FINISHTIME		TIMESTAMP,
		AGING			INTEGER DEFAULT 0,
        PROCESSEDBY     CHARACTER(15) DEFAULT '', 
        DESCRIPTION            CHARACTER(100) DEFAULT '', 
        PRIMARY KEY (TORDERFLOWPK), 
    CONSTRAINT TORDERFLOW_FK1 FOREIGN KEY (TORDERFK) REFERENCES TORDER (TORDERPK) 
ON 
DELETE 
    CASCADE 
    );

CREATE SEQUENCE TDELIVERY_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE 
    TDELIVERY 
    ( 
        TDELIVERYPK        INTEGER NOT NULL, 
        MBRANCHFK          INTEGER, 
        DLVID              CHARACTER(30) DEFAULT '', 
        STATUS             CHARACTER(3) DEFAULT '', 
        TOTALDATA          INTEGER DEFAULT 0, 
        PROCESSTIME        TIMESTAMP(6) WITHOUT TIME ZONE, 
        PROCESSEDBY        CHARACTER(15) DEFAULT '', 
        LETTERTYPE         CHARACTER(10) DEFAULT '', 
        ISURGENT           CHARACTER(1) DEFAULT '', 
        BRANCHPOOL         CHARACTER(5) DEFAULT '',
        TGLTERIMA          DATE, 
        PENERIMA           CHARACTER(40) DEFAULT '', 
        AWB                CHARACTER(40), 
        NOTES               CHARACTER(200), 
        PRIMARY KEY (TDELIVERYPK), 
    CONSTRAINT TDELIVERY_FK1 FOREIGN KEY (MBRANCHFK) REFERENCES MBRANCH (MBRANCHPK) 
ON 
DELETE 
    RESTRICT
    );
	
CREATE SEQUENCE TDELIVERYDATA_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE 
    TDELIVERYDATA 
    ( 
        TDELIVERYDATAPK     INTEGER NOT NULL, 
        TDELIVERYFK         INTEGER, 
        TORDERFK        	INTEGER, 
        PRIMARY KEY (TDELIVERYDATAPK), 
        CONSTRAINT TDELIVERYDATA_FK1 FOREIGN KEY (TDELIVERYFK) REFERENCES TDELIVERY (TDELIVERYPK) ON DELETE CASCADE,
        CONSTRAINT TDELIVERYDATA_FK2 FOREIGN KEY (TORDERFK) REFERENCES TORDER (TORDERPK) ON DELETE CASCADE
);

CREATE SEQUENCE TCARDSALE_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE TCARDSALE (
	TCARDSALEPK INTEGER NOT NULL,
	MBRANCHFK INTEGER,
	UNITCODE CHAR(5) DEFAULT '',
	SALEDATE DATE,
	SALEQTY INTEGER DEFAULT 0,
	SALEAMOUNT DECIMAL(17,0) DEFAULT 0,
	CREATETIME TIMESTAMP,
	CREATEDBY CHAR(20) DEFAULT '',
	LASTUPDATED TIMESTAMP,
	UPDATEDBY CHAR(20),
	PRIMARY KEY (TCARDSALEPK),
	CONSTRAINT TCARDSALE_FK1 FOREIGN KEY (MBRANCHFK) REFERENCES MBRANCH (MBRANCHPK) ON DELETE RESTRICT
);

CREATE SEQUENCE TCARDNOSALE_SEQ INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE TABLE TCARDNOSALE (
	TCARDNOSALEPK INTEGER NOT NULL,
	TCARDSALEFK INTEGER,
	TCARDNOFK INTEGER,
	CARDNO CHAR(20) DEFAULT '',
	CUSTNAME CHAR(40) DEFAULT '',
	SALEDATE DATE,
	CONSTRAINT TCARDNOSALE_FK1 FOREIGN KEY (TCARDSALEFK) REFERENCES TCARDSALE (TCARDSALEPK) ON DELETE RESTRICT,
	CONSTRAINT TCARDNOSALE_FK2 FOREIGN KEY (TCARDNOFK) REFERENCES TCARDNO (TCARDNOPK) ON DELETE RESTRICT
);