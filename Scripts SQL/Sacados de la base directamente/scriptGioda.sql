USE [GIODA]
GO
/****** Object:  Table [dbo].[autos]    Script Date: 08/06/2019 22:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[autos](
	[id_auto] [int] IDENTITY(1,1) NOT NULL,
	[id_marca] [smallint] NOT NULL,
	[id_modelo] [smallint] NOT NULL,
	[id_version] [tinyint] NOT NULL,
	[dominio] [varchar](7) NULL,
	[num_motor] [varchar](15) NOT NULL,
	[num_chasis] [varchar](15) NOT NULL,
	[año] [smallint] NOT NULL,
	[color] [varchar](20) NOT NULL,
 CONSTRAINT [pk__autos__end] PRIMARY KEY CLUSTERED 
(
	[id_auto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 08/06/2019 22:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clientes](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[dni] [int] NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[fecha_ingreso] [date] NOT NULL DEFAULT (getdate()),
	[id_provincia] [tinyint] NOT NULL,
	[id_localidad] [smallint] NOT NULL,
	[direccion] [varchar](50) NOT NULL,
 CONSTRAINT [pk__clientes__end] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uq__clientes__1__end] UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cuotas]    Script Date: 08/06/2019 22:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuotas](
	[id_suscripcion_plan] [int] NOT NULL,
	[id_cuota] [smallint] NOT NULL,
	[fecha_vencimiento] [date] NOT NULL,
	[fecha_pago] [date] NULL,
	[id_medio_pago] [tinyint] NULL,
 CONSTRAINT [pk__cuotas__end] PRIMARY KEY CLUSTERED 
(
	[id_cuota] ASC,
	[id_suscripcion_plan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[error_actualizacion]    Script Date: 08/06/2019 22:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[error_actualizacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[localidades]    Script Date: 08/06/2019 22:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[localidades](
	[id_provincia] [tinyint] NOT NULL,
	[id_localidad] [smallint] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [pk__localidades__end] PRIMARY KEY CLUSTERED 
(
	[id_provincia] ASC,
	[id_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uq__localidades__1__end] UNIQUE NONCLUSTERED 
(
	[id_provincia] ASC,
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[log_errores]    Script Date: 08/06/2019 22:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[log_errores](
	[id_error] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
 CONSTRAINT [pk__log_errores__end] PRIMARY KEY CLUSTERED 
(
	[id_error] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[marcas]    Script Date: 08/06/2019 22:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[marcas](
	[id_marca] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
 CONSTRAINT [pk__marcas__end] PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uq__marcas__1__end] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[medios_pago]    Script Date: 08/06/2019 22:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[medios_pago](
	[id_medio_pago] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_medio_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[modelos]    Script Date: 08/06/2019 22:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[modelos](
	[id_marca] [smallint] NOT NULL,
	[id_modelo] [smallint] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
 CONSTRAINT [pk__modelos__end] PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC,
	[id_modelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uq__modelos__1__end] UNIQUE NONCLUSTERED 
(
	[id_marca] ASC,
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[planes]    Script Date: 08/06/2019 22:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[planes](
	[id_plan] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre_plan] [varchar](50) NOT NULL,
	[cantidad_cuotas] [tinyint] NOT NULL,
	[cuota_entrega] [tinyint] NOT NULL,
 CONSTRAINT [pk__planes__end] PRIMARY KEY CLUSTERED 
(
	[id_plan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[planes_versiones]    Script Date: 08/06/2019 22:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[planes_versiones](
	[id_plan] [smallint] NOT NULL,
	[id_marca] [smallint] NOT NULL,
	[id_modelo] [smallint] NOT NULL,
	[id_version] [tinyint] NOT NULL,
 CONSTRAINT [pk__planes_versiones__end] PRIMARY KEY CLUSTERED 
(
	[id_plan] ASC,
	[id_marca] ASC,
	[id_modelo] ASC,
	[id_version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[provincias]    Script Date: 08/06/2019 22:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[provincias](
	[id_provincia] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [pk__provincias__end] PRIMARY KEY CLUSTERED 
(
	[id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uq__provincias__end] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[solicitantes_autorizados]    Script Date: 08/06/2019 22:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[solicitantes_autorizados](
	[identificador_solicitante] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[identificador_solicitante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[suscripciones_planes]    Script Date: 08/06/2019 22:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[suscripciones_planes](
	[id_suscripcion_plan] [int] IDENTITY(1,1) NOT NULL,
	[identificador_gob] [varchar](20) NULL DEFAULT ('NUEVOCOMPRADOR'),
	[id_cliente] [int] NOT NULL,
	[id_plan] [smallint] NOT NULL,
	[id_marca] [smallint] NOT NULL,
	[id_modelo] [smallint] NOT NULL,
	[id_version] [tinyint] NOT NULL,
	[id_auto] [int] NULL,
	[fecha_suscripcion] [date] NOT NULL DEFAULT (getdate()),
 CONSTRAINT [pk__suscripciones_planes__end] PRIMARY KEY CLUSTERED 
(
	[id_suscripcion_plan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ultimos_ganadores]    Script Date: 08/06/2019 22:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ultimos_ganadores](
	[id_ganador] [int] IDENTITY(1,1) NOT NULL,
	[nombre_concesionaria] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[id_sorteo] [int] NULL,
 CONSTRAINT [pk__ultimos_ganadores__end] PRIMARY KEY CLUSTERED 
(
	[id_ganador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[versiones]    Script Date: 08/06/2019 22:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[versiones](
	[id_marca] [smallint] NOT NULL,
	[id_modelo] [smallint] NOT NULL,
	[id_version] [tinyint] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[precio] [int] NOT NULL,
	[cilindrada] [int] NOT NULL,
	[potencia] [smallint] NOT NULL,
	[traccion] [char](1) NOT NULL,
	[transmision] [char](2) NOT NULL,
	[ficha_tecnica_url] [varchar](200) NOT NULL,
 CONSTRAINT [pk__versiones__end] PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC,
	[id_modelo] ASC,
	[id_version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[log_errores] ADD  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[autos]  WITH CHECK ADD  CONSTRAINT [fk__autos__versiones__1__end] FOREIGN KEY([id_marca], [id_modelo], [id_version])
REFERENCES [dbo].[versiones] ([id_marca], [id_modelo], [id_version])
GO
ALTER TABLE [dbo].[autos] CHECK CONSTRAINT [fk__autos__versiones__1__end]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [fk__clientes__localidades__1__end] FOREIGN KEY([id_provincia], [id_localidad])
REFERENCES [dbo].[localidades] ([id_provincia], [id_localidad])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [fk__clientes__localidades__1__end]
GO
ALTER TABLE [dbo].[cuotas]  WITH CHECK ADD  CONSTRAINT [fk__cuotas__medios_pago__1__end] FOREIGN KEY([id_medio_pago])
REFERENCES [dbo].[medios_pago] ([id_medio_pago])
GO
ALTER TABLE [dbo].[cuotas] CHECK CONSTRAINT [fk__cuotas__medios_pago__1__end]
GO
ALTER TABLE [dbo].[cuotas]  WITH CHECK ADD  CONSTRAINT [fk__cuotas__suscripciones_planes__1__end] FOREIGN KEY([id_suscripcion_plan])
REFERENCES [dbo].[suscripciones_planes] ([id_suscripcion_plan])
GO
ALTER TABLE [dbo].[cuotas] CHECK CONSTRAINT [fk__cuotas__suscripciones_planes__1__end]
GO
ALTER TABLE [dbo].[localidades]  WITH CHECK ADD  CONSTRAINT [fk__localidades__provincias__1__end] FOREIGN KEY([id_provincia])
REFERENCES [dbo].[provincias] ([id_provincia])
GO
ALTER TABLE [dbo].[localidades] CHECK CONSTRAINT [fk__localidades__provincias__1__end]
GO
ALTER TABLE [dbo].[modelos]  WITH CHECK ADD  CONSTRAINT [fk__modelos__marcas__1__end] FOREIGN KEY([id_marca])
REFERENCES [dbo].[marcas] ([id_marca])
GO
ALTER TABLE [dbo].[modelos] CHECK CONSTRAINT [fk__modelos__marcas__1__end]
GO
ALTER TABLE [dbo].[planes_versiones]  WITH CHECK ADD  CONSTRAINT [fk__planes_versiones__planes__1__end] FOREIGN KEY([id_plan])
REFERENCES [dbo].[planes] ([id_plan])
GO
ALTER TABLE [dbo].[planes_versiones] CHECK CONSTRAINT [fk__planes_versiones__planes__1__end]
GO
ALTER TABLE [dbo].[planes_versiones]  WITH CHECK ADD  CONSTRAINT [fk__planes_versiones__versiones__1__end] FOREIGN KEY([id_marca], [id_modelo], [id_version])
REFERENCES [dbo].[versiones] ([id_marca], [id_modelo], [id_version])
GO
ALTER TABLE [dbo].[planes_versiones] CHECK CONSTRAINT [fk__planes_versiones__versiones__1__end]
GO
ALTER TABLE [dbo].[suscripciones_planes]  WITH CHECK ADD  CONSTRAINT [fk__suscripciones_planes__autos__1__end] FOREIGN KEY([id_auto])
REFERENCES [dbo].[autos] ([id_auto])
GO
ALTER TABLE [dbo].[suscripciones_planes] CHECK CONSTRAINT [fk__suscripciones_planes__autos__1__end]
GO
ALTER TABLE [dbo].[suscripciones_planes]  WITH CHECK ADD  CONSTRAINT [fk__suscripciones_planes__clientes__1__end] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[suscripciones_planes] CHECK CONSTRAINT [fk__suscripciones_planes__clientes__1__end]
GO
ALTER TABLE [dbo].[suscripciones_planes]  WITH CHECK ADD  CONSTRAINT [fk__suscripciones_planes__planes__1__end] FOREIGN KEY([id_plan])
REFERENCES [dbo].[planes] ([id_plan])
GO
ALTER TABLE [dbo].[suscripciones_planes] CHECK CONSTRAINT [fk__suscripciones_planes__planes__1__end]
GO
ALTER TABLE [dbo].[suscripciones_planes]  WITH CHECK ADD  CONSTRAINT [fk__suscripciones_planes__versiones__1__end] FOREIGN KEY([id_marca], [id_modelo], [id_version])
REFERENCES [dbo].[versiones] ([id_marca], [id_modelo], [id_version])
GO
ALTER TABLE [dbo].[suscripciones_planes] CHECK CONSTRAINT [fk__suscripciones_planes__versiones__1__end]
GO
ALTER TABLE [dbo].[versiones]  WITH CHECK ADD  CONSTRAINT [fk__versiones__modelos__1__end] FOREIGN KEY([id_marca], [id_modelo])
REFERENCES [dbo].[modelos] ([id_marca], [id_modelo])
GO
ALTER TABLE [dbo].[versiones] CHECK CONSTRAINT [fk__versiones__modelos__1__end]
GO
ALTER TABLE [dbo].[planes]  WITH CHECK ADD  CONSTRAINT [ch__planes__1__end] CHECK  (([cantidad_cuotas]>(0)))
GO
ALTER TABLE [dbo].[planes] CHECK CONSTRAINT [ch__planes__1__end]
GO
ALTER TABLE [dbo].[planes]  WITH CHECK ADD  CONSTRAINT [ch__planes__2__end] CHECK  (([cuota_entrega]>=(1) AND [cuota_entrega]<=[cantidad_cuotas]))
GO
ALTER TABLE [dbo].[planes] CHECK CONSTRAINT [ch__planes__2__end]
GO
ALTER TABLE [dbo].[versiones]  WITH CHECK ADD  CONSTRAINT [ch__traccion__1__end] CHECK  (([traccion]='I' OR [traccion]='T' OR [traccion]='D'))
GO
ALTER TABLE [dbo].[versiones] CHECK CONSTRAINT [ch__traccion__1__end]
GO
ALTER TABLE [dbo].[versiones]  WITH CHECK ADD  CONSTRAINT [ch__transmision__1__end] CHECK  (([transmision]='MT' OR [transmision]='AT'))
GO
ALTER TABLE [dbo].[versiones] CHECK CONSTRAINT [ch__transmision__1__end]
GO
/****** Object:  StoredProcedure [dbo].[get_clientes]    Script Date: 08/06/2019 22:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_clientes]
(
    @solicitante    VARCHAR(100),
	@fechaSorteo	VARCHAR(10)
)
AS 
BEGIN 
	SELECT sp.id_suscripcion_plan AS id_suscripcion, cli.nombre, cli.apellido, dni, cli.mail, cli.telefono, sp.fecha_suscripcion, 
			cli.direccion, loc.nombre AS localidad, prov.nombre AS provincia,
			detalle_cuotas.cant_cuotas_pagas, detalle_cuotas.ult_cuota_paga, detalle_cuotas.al_dia,
			marca.nombre AS marca, mod.nombre AS modelo, vers.nombre AS version,
			auto.num_motor, auto.num_chasis, auto.año, auto.color, auto.dominio
	FROM dbo.clientes cli
	INNER JOIN dbo.suscripciones_planes sp ON sp.id_cliente = cli.id_cliente
	INNER JOIN (SELECT c.id_suscripcion_plan, COUNT(fecha_pago) cant_cuotas_pagas, MAX(c.fecha_pago) AS ult_cuota_paga, alDia.al_dia
				FROM dbo.cuotas c
				INNER JOIN (SELECT id_suscripcion_plan,
							CASE WHEN YEAR(MAX(fecha_pago)) >= YEAR(@fechaSorteo) AND MONTH(MAX(fecha_pago)) >= MONTH(@fechaSorteo) AND DAY(MAX(fecha_pago)) >= DAY(@fechaSorteo) THEN 'Y'
								 WHEN YEAR(MAX(fecha_pago)) >= YEAR(@fechaSorteo) AND MONTH(@fechaSorteo) >= MONTH(@fechaSorteo) THEN 'Y' 
								 WHEN YEAR(MAX(fecha_pago)) > YEAR(@fechaSorteo) THEN 'Y' ELSE 'N' END AS al_dia
							FROM cuotas
							WHERE fecha_pago <= @fechaSorteo
							GROUP BY id_suscripcion_plan) AS alDia ON alDia.id_suscripcion_plan = c.id_suscripcion_plan 
				WHERE c.fecha_pago <= @fechaSorteo
				GROUP BY c.id_suscripcion_plan, alDia.al_dia) AS detalle_cuotas ON detalle_cuotas.id_suscripcion_plan = sp.id_suscripcion_plan
	INNER JOIN dbo.provincias prov ON prov.id_provincia = cli.id_provincia
	INNER JOIN dbo.localidades loc ON loc.id_provincia = cli.id_provincia AND loc.id_localidad = cli.id_localidad
	INNER JOIN dbo.marcas marca ON marca.id_marca = sp.id_marca
	INNER JOIN dbo.modelos mod ON mod.id_marca = marca.id_marca AND sp.id_modelo = mod.id_modelo
	INNER JOIN dbo.versiones vers ON vers.id_marca = mod.id_marca AND vers.id_modelo = mod.id_modelo AND sp.id_version = vers.id_version
	LEFT JOIN dbo.autos auto ON auto.id_marca = vers.id_marca AND auto.id_modelo = vers.id_modelo AND auto.id_version = vers.id_version AND sp.id_auto = auto.id_auto
    WHERE @solicitante = 'GOBIERNO'
END 
GO
/****** Object:  StoredProcedure [dbo].[set_ganador_sorteo]    Script Date: 08/06/2019 22:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[set_ganador_sorteo]
(
	@idGanador INT,
	@idSorteo INT,
	@concesionaria VARCHAR(50),
	@nombre VARCHAR(50),
	@apellido VARCHAR(50)
)
AS
BEGIN
	DECLARE @idMedioPago TINYINT
	SELECT @idMedioPago = id_medio_pago FROM dbo.medios_pago WHERE nombre = 'Sorteo'
	IF(@concesionaria = 'GIODA')
	BEGIN 
		INSERT INTO error_actualizacion(descripcion)
		VALUES('ENTRA EN EL IF. DATOS: GANADOR->' + CONVERT(VARCHAR(10),@idGanador) + ' - CONCESIONARIA -> ' + @concesionaria) 

		UPDATE dbo.cuotas SET fecha_pago = GETDATE(), id_medio_pago = @idMedioPago WHERE fecha_pago IS NULL AND id_suscripcion_plan = @idGanador
	END 
	ELSE
    BEGIN
		INSERT INTO error_actualizacion(descripcion)
		VALUES('NO ENTRA EN EL IF. DATOS: GANADOR->' + CONVERT(VARCHAR(10),@idGanador) + ' - CONCESIONARIA -> ' + @concesionaria) 
	END 
	INSERT INTO dbo.ultimos_ganadores(id_sorteo, nombre_concesionaria, nombre, apellido)
	VALUES  (@idSorteo, @concesionaria, @nombre, @apellido)
END
GO
