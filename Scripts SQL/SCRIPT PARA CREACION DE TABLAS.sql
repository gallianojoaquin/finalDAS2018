/*CREACION DE TABLAS*/
--USE PICOKM
CREATE TABLE dbo.CONCESIONARIA
(
    idConcesionaria VARCHAR(10) NOT NULL,
    razonSocial		VARCHAR(100) NOT NULL,
    CUIT            VARCHAR(15) NOT NULL,
    direccion       VARCHAR(30) NOT NULL,
    tipoWS          CHAR(2)		NOT NULL,
    URLWS           VARCHAR(30) NOT NULL,
    habilitada      CHAR(1)		NOT NULL,
	calle VARCHAR(50) NOT NULL,
	numeracionCalle INTEGER NULL,
	codigoPostal VARCHAR(10) NULL,
	provincia VARCHAR(50) NULL,
    mail            VARCHAR(30) NOT NULL,
	nroTelefono		VARCHAR(30)

	CONSTRAINT PK__CONCESIONARIA__END PRIMARY KEY (idConcesionaria),
	CONSTRAINT UK__CONCESIONARIA__CUIT__END UNIQUE (CUIT),
	CONSTRAINT UK__CONCESIONARIA__razonSocial__END UNIQUE (razonSocial),
	CONSTRAINT UK__CONCESIONARIA__URLWS__END UNIQUE (URLWS),
	CONSTRAINT CK__CONCESIONARIA__habilitada__END CHECK (habilitada IN ('S','N'))
)
GO 

CREATE TABLE PERSONAS
(
	idCliente		INTEGER IDENTITY(1,1) NOT NULL,
    idConcesionaria VARCHAR(10) NOT NULL,
	idSuscripcion	VARCHAR(12) NOT NULL,
	idPlan			INTEGER NOT NULL,
	-----------------------------------------------
	tipoDocumento VARCHAR(5) NOT NULL,
	documento VARCHAR(20) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	sexo CHAR(1) NOT NULL,
	calle VARCHAR(50) NOT NULL,
	numeracionCalle INTEGER NULL,
	piso TINYINT NULL,
	departamento VARCHAR(2) NULL,
	torre VARCHAR(2) NULL,
	barrio VARCHAR(50) NULL,
	provincia VARCHAR(50) NULL,
	pais VARCHAR(50) NULL,
	codigoPostal VARCHAR(10) NULL,
	cuitCuil VARCHAR(12) NULL,
	email VARCHAR(50) NULL,
	----------------------------------------------
	telefono	VARCHAR(20),
	telefonoMovil	VARCHAR(20)

	CONSTRAINT PK__PERSONAS__END PRIMARY KEY (idCliente),
	CONSTRAINT FK__CLIENTE__to__CONCESIONARIA__idConcesionaria__END FOREIGN KEY (idConcesionaria) REFERENCES CONCESIONARIA(idConcesionaria)

)

CREATE TABLE PLAN_DETALLE
(
    idPlan			INTEGER IDENTITY(1,1) NOT NULL,
    descripcion		VARCHAR(18) NOT NULL,
    cuotas			TINYINT NULL

	CONSTRAINT PK__PLAN_DETALLE__END PRIMARY KEY(idPlan)
)
GO  

GO 
CREATE TABLE dbo.EMPLEADO
(
    idEmpleado	INTEGER IDENTITY(1,1),
	nombre		VARCHAR(20)	NOT NULL,
	apellido	VARCHAR(20)	NOT NULL

	CONSTRAINT PK__EMPLEADO__END PRIMARY KEY(idEmpleado)
)
GO
CREATE TABLE dbo.USUARIOS
(
    idUsuario		INTEGER IDENTITY(1,1),
	usuario			VARCHAR(10)	NOT NULL,
	contrasena		VARCHAR(10)	NOT NULL,
	nroDocCliente	INTEGER NULL,
	idEmpleado		INTEGER NULL,
	habilitado		CHAR(1) NOT NULL,
	perfil			VARCHAR(20) NOT NULL

	CONSTRAINT PK__USUARIOS__END PRIMARY KEY(idUsuario),
	CONSTRAINT UK__USUARIOS__END UNIQUE(usuario),
	CONSTRAINT CK__USUARIOS__idCliente_idEmpleado__END CHECK ((nroDocCliente IS NULL AND idEmpleado IS NOT NULL) OR (nroDocCliente IS NOT NULL AND idEmpleado IS NULL)),
	--CONSTRAINT FK__USUARIOS__to__CLIENTE__nroDocCliente__END FOREIGN KEY(nroDocCliente) REFERENCES dbo.CLIENTE,
	--CONSTRAINT FK__USUARIOS__to__EMPLEADO__idEmpleado__END FOREIGN KEY(idEmpleado) REFERENCES dbo.EMPLEADO,
	CONSTRAINT CK__USUARIOS__habilidado__END CHECK (habilitado IN ('S','N'))
)
GO 
CREATE TABLE dbo.PORTALWEB 
(
    fecha			DATETIME	NOT NULL,
    titulo			VARCHAR(20),
    noticiaPpal		VARCHAR(20),
    novedades		VARCHAR(20),
    avisos			VARCHAR(20),
    notas			VARCHAR(20),
    infoPlan		VARCHAR(20),
    sorteo			VARCHAR(20),
    proxSorteo		VARCHAR(20),
	idUsuario		INTEGER		NOT NULL

	CONSTRAINT PK__PORTALWEB__END PRIMARY KEY (fecha),
	CONSTRAINT FK__PORTALWEB__to__USUARIO__idUsuario__END FOREIGN KEY(idUsuario) REFERENCES USUARIOS(idUsuario)
)
GO
CREATE TABLE dbo.SORTEOS
(
    idSorteo	INTEGER IDENTITY(1,1),
	fechaSorteo DATE	NOT NULL,
	idCliente	INTEGER	NULL,
	estadoCuenta	VARCHAR(9) NULL

	CONSTRAINT PK__SORTEOS__END PRIMARY KEY(idSorteo),
	CONSTRAINT UK__SORTEOS__fechaSorteo__END UNIQUE (fechaSorteo),
	CONSTRAINT CK__SORTEOS__idCliente_estadoCuenta__END CHECK ((idCliente IS NULL AND estadoCuenta IS NULL) OR (idCliente IS NOT NULL AND estadoCuenta IS NOT NULL)) ,
	CONSTRAINT FK__SORTEOS__to__CLIENTE__idCliente__END FOREIGN KEY (idCliente) REFERENCES dbo.PERSONAS(idCliente),
	CONSTRAINT CK__SORTEOS__estadoCuenta__END CHECK (estadoCuenta IN ('ENTREGADO','PENDIENTE','BAJA',NULL))
)
GO

/*INSERT DE DATOS A LAS TABLAS*/
INSERT INTO dbo.CONCESIONARIA( idConcesionaria ,razonSocial ,CUIT ,direccion ,tipoWS ,URLWS ,habilitada ,mail ,nroTelefono)
VALUES	( 'PETITTIFOR','PETITTI AUTOMOTORES FORD','11-PETITTIFOR-1','RIO TERCERO 123','RE','http://www.google.com','S','ventas@PETITTIFOR.com.ar',''),
	    ( 'GIODAAUTOM','GIODA AUTOMOTORES','11-GIODAAUTOM-1','RIO TERCERO 123','RE','http://www.google1.com','S','ventas@GIODAAUTOM.com.ar','03571GIODA'),
		( 'PETITTIFIA','PETITTI AUTOMOTORES FIAT','11-PETITTIFIA-1','RIO TERCERO 123','CX','http://www.google2.com','S','ventas@PETITTIFIA.com.ar','0357112312312'),
		( 'PETITTIVW1','PETITTI AUTOMOTORES VW','11-PETITTIVW1-1','RIO TERCERO 123','CX','http://www.google3.com','S','ventas@PETITTIVW1.com.ar','0357112312312'),
		( 'GIODAUSADO','GIODA AUTOMOTORES USADOS','11-GIODAUSADO-1','RIO TERCERO 123','AX','http://www.google4.com','S','ventas@GIODAUSADO.com.ar','0357112312312')
GO
INSERT INTO dbo.CLIENTE( idConcesionaria,idSuscripcion,nroDoc,apellido,nombre,domicilio,mail,telParticular,telComercial)
VALUES  --( 'PETITTIFOR' ,'000137321390' ,37321390 ,'GALLIANO' ,'JOAQUIN' ,'CERVANTES' ,'CHACHEAS@GMAIL.COM' ,'0357115600039' ,'-'),
        ( 'PETITTIFOR' ,'000237321390' ,37321390 ,'GALLIANO' ,'JOAQUIN' ,'CERVANTES' ,'CHACHEAS@GMAIL.COM' ,'0357115600039' ,'-'),
		( 'PETITTIFOR' ,'000337321390' ,37321390 ,'GALLIANO' ,'JOAQUIN' ,'CERVANTES' ,'CHACHEAS@GMAIL.COM' ,'0357115600039' ,'-'),
		( 'GIODAUSADO' ,'000137321390' ,37321390 ,'GALLIANO' ,'JOAQUIN' ,'CERVANTES' ,'CHACHEAS@GMAIL.COM' ,'0357115600039' ,'-')
GO
INSERT INTO dbo.USUARIOS( usuario ,contrasena ,nroDocCliente ,idEmpleado ,habilitado ,perfil)
VALUES  ( 'cheas','cheas',37321390,NULL,'S','ADMIN'),
		('chacheas','chacheas',37321360,NULL,'S','ADMIN')
GO
INSERT INTO dbo.SORTEOS(fechaSorteo,idCliente,estadoCuenta)
VALUES  ('2017-12-01',NULL ,NULL),
		('2017-02-01',NULL ,NULL),
		('2017-03-01',NULL ,NULL),
		('2017-04-01',NULL ,NULL),
		('2017-05-01',NULL ,NULL),
		('2017-06-01',NULL ,NULL),
		('2017-07-01',NULL ,NULL),
		('2017-08-01',NULL ,NULL),
		('2017-09-01',NULL ,NULL),
		('2017-10-01',NULL ,NULL),
		('2017-11-01',NULL ,NULL),
		('2017-01-01',NULL ,NULL)
GO


/*CONSULTAS*/
SELECT * FROM dbo.CONCESIONARIA

/**CANT DE SUSCRIPCIONES POR CONCESIONARIA**/
SELECT COUNT(CL.idCliente) AS [CANT. DE SUSCRIPCIONES], CO.razonSocial
FROM dbo.CLIENTE CL
	INNER JOIN dbo.CONCESIONARIA CO
		ON CO.idConcesionaria = CL.idConcesionaria
GROUP BY CO.idConcesionaria, CO.razonSocial




SELECT /*S.fechaSorteo AS [FECHA DE SORTEO],*/ CL.apellido + ', '+ CL.nombre AS [GANADOR], CO.razonSocial AS [CONCESIONARIA], CL.idSuscripcion AS [SUSCRIPCION] 
FROM dbo.CLIENTE CL
	INNER JOIN dbo.CONCESIONARIA CO
		ON CO.idConcesionaria = CL.idConcesionaria
	INNER JOIN dbo.SORTEOS S
		ON S.idCliente = CL.idCliente

UPDATE dbo.SORTEOS SET idCliente = 1, estadoCuenta = 'ENTREGADO' WHERE fechaSorteo = '2017-01-01'

SELECT * FROM   dbo.SORTEOS
--DBCC CHECKIDENT (SORTEOS, RESEED, 0)  /*PARA REINICIAR CONTADOR DE IDENTITY A 0*/