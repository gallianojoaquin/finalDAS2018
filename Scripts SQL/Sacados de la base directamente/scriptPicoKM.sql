USE [PICOkm]
GO
/****** Object:  Table [dbo].[actualizaciones]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[actualizaciones](
	[id_actualizacion] [int] NOT NULL,
	[id_concesionaria] [smallint] NOT NULL,
	[fecha] [date] NOT NULL,
	[id_sorteo] [int] NULL,
	[estado] [varchar](10) NULL,
 CONSTRAINT [pk__actualizaciones__end] PRIMARY KEY CLUSTERED 
(
	[id_actualizacion] ASC,
	[id_concesionaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[administradores]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[administradores](
	[id_administrador] [smallint] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[clave] [varchar](50) NOT NULL,
	[dni] [int] NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[intentos_fallidos] [tinyint] NOT NULL DEFAULT ((0)),
	[bloqueado] [char](1) NOT NULL DEFAULT ('n'),
 CONSTRAINT [pk__administradores__end] PRIMARY KEY CLUSTERED 
(
	[id_administrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uq__administradores__1__end] UNIQUE NONCLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uq__administradores__2__end] UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uq__administradores__3__end] UNIQUE NONCLUSTERED 
(
	[mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[autos]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[autos](
	[id_auto] [int] IDENTITY(1,1) NOT NULL,
	[marca] [varchar](200) NOT NULL,
	[modelo] [varchar](200) NOT NULL,
	[version] [varchar](200) NOT NULL,
	[dominio] [varchar](100) NOT NULL,
	[año] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_auto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[avisos]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[avisos](
	[id] [int] NOT NULL,
	[nroAviso] [tinyint] NOT NULL,
	[aviso] [varchar](max) NOT NULL,
 CONSTRAINT [PK__AVISOS_PORTAL__END] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[nroAviso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clientes](
	[id_concesionaria] [smallint] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[dni] [int] NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[id_provincia] [tinyint] NOT NULL,
	[id_localidad] [smallint] NULL,
	[direccion] [varchar](100) NOT NULL,
	[clave] [varchar](20) NULL DEFAULT (''),
 CONSTRAINT [pk__clientes__end] PRIMARY KEY CLUSTERED 
(
	[id_concesionaria] ASC,
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[clientes_sorteo]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clientes_sorteo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_sorteo] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_concesionaria] [smallint] NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[dni] [int] NULL,
	[mail] [varchar](50) NULL,
	[ganador] [char](1) NULL,
 CONSTRAINT [PK__clientes_sorteo__END] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK__clientes_sorteo__dni__END] UNIQUE NONCLUSTERED 
(
	[id_sorteo] ASC,
	[dni] ASC,
	[id_concesionaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK__clientes_sorteo__END] UNIQUE NONCLUSTERED 
(
	[id_sorteo] ASC,
	[id_cliente] ASC,
	[id_concesionaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK__clientes_sorteo__id_sorteo__id_cliente__id_concesionaria__END] UNIQUE NONCLUSTERED 
(
	[id_sorteo] ASC,
	[id_cliente] ASC,
	[id_concesionaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[concesionarias]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[concesionarias](
	[id_concesionaria] [smallint] IDENTITY(1,1) NOT NULL,
	[razon_social] [varchar](50) NOT NULL,
	[cuit] [varchar](14) NOT NULL,
	[id_provincia] [tinyint] NOT NULL,
	[id_localidad] [smallint] NULL,
	[direccion] [varchar](100) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[estado_autorizacion] [char](1) NOT NULL,
	[ult_actualizacion] [date] NULL,
	[estado_actualizacion] [varchar](10) NULL,
	[cant_intentos] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [pk__concesionarias__end] PRIMARY KEY CLUSTERED 
(
	[id_concesionaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uq__concesionarias__1__end] UNIQUE NONCLUSTERED 
(
	[razon_social] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uq__concesionarias__2__end] UNIQUE NONCLUSTERED 
(
	[cuit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uq__concesionarias__3__end] UNIQUE NONCLUSTERED 
(
	[id_provincia] ASC,
	[id_localidad] ASC,
	[direccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[config_plan]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[config_plan](
	[id_config_plan] [int] IDENTITY(1,1) NOT NULL,
	[cant_cuotas] [int] NOT NULL,
	[cuota_min_sorteo] [int] NOT NULL,
	[cuota_max_sorteo] [int] NOT NULL,
	[cuota_entrega] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_config_plan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cuotas]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuotas](
	[id_concesionaria] [smallint] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_suscripcion] [int] NOT NULL,
	[id_cuota] [int] NOT NULL,
	[fecha_vencimiento] [date] NOT NULL,
	[fecha_pago] [date] NULL,
 CONSTRAINT [pk__cuotas__end] PRIMARY KEY CLUSTERED 
(
	[id_concesionaria] ASC,
	[id_cliente] ASC,
	[id_suscripcion] ASC,
	[id_cuota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[info_sorteo]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[info_sorteo](
	[id] [int] NOT NULL,
	[nroInfoSorteo] [tinyint] NOT NULL,
	[sorteo] [varchar](max) NOT NULL,
 CONSTRAINT [PK__INFO_SORTEO_PLAN__END] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[nroInfoSorteo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[informacion]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[informacion](
	[id] [int] NOT NULL,
	[nroInfo] [tinyint] NOT NULL,
	[informacion] [varchar](max) NOT NULL,
 CONSTRAINT [PK__INFORMACION_PORTAL__END] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[nroInfo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[localidades]    Script Date: 08/06/2019 22:36:52 ******/
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
/****** Object:  Table [dbo].[log_errores]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[log_errores](
	[id_error] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL DEFAULT (getdate()),
	[descripcion] [varchar](500) NOT NULL,
 CONSTRAINT [pk__log_errores__end] PRIMARY KEY CLUSTERED 
(
	[id_error] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[notas]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[notas](
	[id] [int] NOT NULL,
	[nroNota] [tinyint] NOT NULL,
	[nota] [varchar](max) NOT NULL,
 CONSTRAINT [PK__NOTAS_PORTAL__END] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[nroNota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[noticia_ppal]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[noticia_ppal](
	[id] [int] NOT NULL,
	[noticiaPpal] [varchar](max) NOT NULL,
 CONSTRAINT [PK__NOTICIA_PPAL_PORTAL__END] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[notificaciones]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notificaciones](
	[id_sorteo] [int] NOT NULL,
	[id_concesionaria] [smallint] NOT NULL,
	[fecha] [date] NOT NULL,
 CONSTRAINT [pk__notificaciones__end] PRIMARY KEY CLUSTERED 
(
	[id_sorteo] ASC,
	[id_concesionaria] ASC,
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[novedades]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[novedades](
	[id] [int] NOT NULL,
	[nroNovedad] [tinyint] NOT NULL,
	[novedad] [varchar](max) NOT NULL,
 CONSTRAINT [PK__NOVEDADES_PORTAL__END] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[nroNovedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[portal_web]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[portal_web](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_administrador] [smallint] NOT NULL,
 CONSTRAINT [PK__PORTALWEB__END] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[provincias]    Script Date: 08/06/2019 22:36:52 ******/
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
/****** Object:  Table [dbo].[servicios]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[servicios](
	[id_servicio] [tinyint] IDENTITY(1,1) NOT NULL,
	[id_concesionaria] [smallint] NOT NULL,
	[id_tecnologia] [tinyint] NOT NULL,
	[url] [varchar](500) NOT NULL,
	[funcion] [varchar](500) NOT NULL,
	[puerto] [smallint] NOT NULL,
 CONSTRAINT [pk__servicios__end] PRIMARY KEY CLUSTERED 
(
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uq__servicios__1__end] UNIQUE NONCLUSTERED 
(
	[id_concesionaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sorteos]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sorteos](
	[id_sorteo] [int] IDENTITY(1,1) NOT NULL,
	[fecha_original] [date] NOT NULL,
	[fecha_ejecucion] [date] NULL,
	[estado] [varchar](100) NOT NULL,
	[intentos_fallidos] [int] NOT NULL DEFAULT ((0)),
	[id_concesionaria] [smallint] NULL,
	[id_cliente] [int] NULL,
	[fecha_fin_ejecucion] [date] NULL,
 CONSTRAINT [pk__sorteos__end] PRIMARY KEY CLUSTERED 
(
	[id_sorteo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uq__sorteos__1__end] UNIQUE NONCLUSTERED 
(
	[fecha_original] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[suscripciones]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[suscripciones](
	[id_suscripcion] [int] NOT NULL,
	[identificador_gob] [varchar](20) NULL,
	[id_concesionaria] [smallint] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_auto] [int] NULL,
	[cant_cuotas_pagas] [smallint] NOT NULL,
	[al_dia] [char](1) NOT NULL,
 CONSTRAINT [pk__suscripciones__end] PRIMARY KEY CLUSTERED 
(
	[id_suscripcion] ASC,
	[id_cliente] ASC,
	[id_concesionaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tecnologias]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tecnologias](
	[id_tecnologia] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[sufijo] [varchar](5) NULL,
 CONSTRAINT [pk__tecnologias__end] PRIMARY KEY CLUSTERED 
(
	[id_tecnologia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uq__tecnologias__1__end] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[titulos]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[titulos](
	[id] [int] NOT NULL,
	[titulo] [varchar](max) NOT NULL,
 CONSTRAINT [PK__TITULOS_PORTAL__END] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[avisos]  WITH CHECK ADD  CONSTRAINT [FK__AVISOS_PORTAL__TO__PORTALWEB__END] FOREIGN KEY([id])
REFERENCES [dbo].[portal_web] ([id])
GO
ALTER TABLE [dbo].[avisos] CHECK CONSTRAINT [FK__AVISOS_PORTAL__TO__PORTALWEB__END]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [fk__clientes__concesionarias__1__end] FOREIGN KEY([id_concesionaria])
REFERENCES [dbo].[concesionarias] ([id_concesionaria])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [fk__clientes__concesionarias__1__end]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [fk__clientes__localidades__1__end] FOREIGN KEY([id_provincia], [id_localidad])
REFERENCES [dbo].[localidades] ([id_provincia], [id_localidad])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [fk__clientes__localidades__1__end]
GO
ALTER TABLE [dbo].[clientes_sorteo]  WITH CHECK ADD  CONSTRAINT [FK__clientes_sorteo__to__clientes__END] FOREIGN KEY([id_concesionaria], [id_cliente])
REFERENCES [dbo].[clientes] ([id_concesionaria], [id_cliente])
GO
ALTER TABLE [dbo].[clientes_sorteo] CHECK CONSTRAINT [FK__clientes_sorteo__to__clientes__END]
GO
ALTER TABLE [dbo].[clientes_sorteo]  WITH CHECK ADD  CONSTRAINT [FK__id_cliente__id_concesionaria__to__clientes__END] FOREIGN KEY([id_concesionaria], [id_cliente])
REFERENCES [dbo].[clientes] ([id_concesionaria], [id_cliente])
GO
ALTER TABLE [dbo].[clientes_sorteo] CHECK CONSTRAINT [FK__id_cliente__id_concesionaria__to__clientes__END]
GO
ALTER TABLE [dbo].[clientes_sorteo]  WITH CHECK ADD  CONSTRAINT [FK__id_sorteo__to__sorteo__END] FOREIGN KEY([id_sorteo])
REFERENCES [dbo].[sorteos] ([id_sorteo])
GO
ALTER TABLE [dbo].[clientes_sorteo] CHECK CONSTRAINT [FK__id_sorteo__to__sorteo__END]
GO
ALTER TABLE [dbo].[concesionarias]  WITH CHECK ADD  CONSTRAINT [fk__concesionarias__localidades__1__end] FOREIGN KEY([id_provincia], [id_localidad])
REFERENCES [dbo].[localidades] ([id_provincia], [id_localidad])
GO
ALTER TABLE [dbo].[concesionarias] CHECK CONSTRAINT [fk__concesionarias__localidades__1__end]
GO
ALTER TABLE [dbo].[info_sorteo]  WITH CHECK ADD  CONSTRAINT [FK__INFO_SORTEO_PLAN__TO__PORTALWEB__END] FOREIGN KEY([id])
REFERENCES [dbo].[portal_web] ([id])
GO
ALTER TABLE [dbo].[info_sorteo] CHECK CONSTRAINT [FK__INFO_SORTEO_PLAN__TO__PORTALWEB__END]
GO
ALTER TABLE [dbo].[informacion]  WITH CHECK ADD  CONSTRAINT [FK__INFORMACION_PORTAL__TO__PORTALWEB__END] FOREIGN KEY([id])
REFERENCES [dbo].[portal_web] ([id])
GO
ALTER TABLE [dbo].[informacion] CHECK CONSTRAINT [FK__INFORMACION_PORTAL__TO__PORTALWEB__END]
GO
ALTER TABLE [dbo].[localidades]  WITH CHECK ADD  CONSTRAINT [fk__localidades__provincias__1__end] FOREIGN KEY([id_provincia])
REFERENCES [dbo].[provincias] ([id_provincia])
GO
ALTER TABLE [dbo].[localidades] CHECK CONSTRAINT [fk__localidades__provincias__1__end]
GO
ALTER TABLE [dbo].[notas]  WITH CHECK ADD  CONSTRAINT [FK__NOTAS_PORTAL__TO__PORTALWEB__END] FOREIGN KEY([id])
REFERENCES [dbo].[portal_web] ([id])
GO
ALTER TABLE [dbo].[notas] CHECK CONSTRAINT [FK__NOTAS_PORTAL__TO__PORTALWEB__END]
GO
ALTER TABLE [dbo].[noticia_ppal]  WITH CHECK ADD  CONSTRAINT [FK__NOTICIA_PPAL_PORTAL__TO__PORTALWEB__END] FOREIGN KEY([id])
REFERENCES [dbo].[portal_web] ([id])
GO
ALTER TABLE [dbo].[noticia_ppal] CHECK CONSTRAINT [FK__NOTICIA_PPAL_PORTAL__TO__PORTALWEB__END]
GO
ALTER TABLE [dbo].[notificaciones]  WITH CHECK ADD  CONSTRAINT [fk__notificaciones__concesionarias__1__end] FOREIGN KEY([id_concesionaria])
REFERENCES [dbo].[concesionarias] ([id_concesionaria])
GO
ALTER TABLE [dbo].[notificaciones] CHECK CONSTRAINT [fk__notificaciones__concesionarias__1__end]
GO
ALTER TABLE [dbo].[novedades]  WITH CHECK ADD  CONSTRAINT [FK__NOVEDADES_PORTAL__TO__PORTALWEB__END] FOREIGN KEY([id])
REFERENCES [dbo].[portal_web] ([id])
GO
ALTER TABLE [dbo].[novedades] CHECK CONSTRAINT [FK__NOVEDADES_PORTAL__TO__PORTALWEB__END]
GO
ALTER TABLE [dbo].[portal_web]  WITH CHECK ADD  CONSTRAINT [FK__PORTALWEB__to__USUARIO__idUsuario__END] FOREIGN KEY([id_administrador])
REFERENCES [dbo].[administradores] ([id_administrador])
GO
ALTER TABLE [dbo].[portal_web] CHECK CONSTRAINT [FK__PORTALWEB__to__USUARIO__idUsuario__END]
GO
ALTER TABLE [dbo].[servicios]  WITH CHECK ADD  CONSTRAINT [fk__servicios__concesionarias__1__end] FOREIGN KEY([id_concesionaria])
REFERENCES [dbo].[concesionarias] ([id_concesionaria])
GO
ALTER TABLE [dbo].[servicios] CHECK CONSTRAINT [fk__servicios__concesionarias__1__end]
GO
ALTER TABLE [dbo].[servicios]  WITH CHECK ADD  CONSTRAINT [fk__servicios__tecnologias__1__end] FOREIGN KEY([id_tecnologia])
REFERENCES [dbo].[tecnologias] ([id_tecnologia])
GO
ALTER TABLE [dbo].[servicios] CHECK CONSTRAINT [fk__servicios__tecnologias__1__end]
GO
ALTER TABLE [dbo].[sorteos]  WITH CHECK ADD  CONSTRAINT [fk__sorteos__clientes__1__end] FOREIGN KEY([id_concesionaria], [id_cliente])
REFERENCES [dbo].[clientes] ([id_concesionaria], [id_cliente])
GO
ALTER TABLE [dbo].[sorteos] CHECK CONSTRAINT [fk__sorteos__clientes__1__end]
GO
ALTER TABLE [dbo].[suscripciones]  WITH CHECK ADD  CONSTRAINT [fk__suscripciones__autos__1__end] FOREIGN KEY([id_auto])
REFERENCES [dbo].[autos] ([id_auto])
GO
ALTER TABLE [dbo].[suscripciones] CHECK CONSTRAINT [fk__suscripciones__autos__1__end]
GO
ALTER TABLE [dbo].[suscripciones]  WITH CHECK ADD  CONSTRAINT [fk__suscripciones__clientes__1__end] FOREIGN KEY([id_concesionaria], [id_cliente])
REFERENCES [dbo].[clientes] ([id_concesionaria], [id_cliente])
GO
ALTER TABLE [dbo].[suscripciones] CHECK CONSTRAINT [fk__suscripciones__clientes__1__end]
GO
ALTER TABLE [dbo].[titulos]  WITH CHECK ADD  CONSTRAINT [FK__TO__PORTALWEB__END] FOREIGN KEY([id])
REFERENCES [dbo].[portal_web] ([id])
GO
ALTER TABLE [dbo].[titulos] CHECK CONSTRAINT [FK__TO__PORTALWEB__END]
GO
ALTER TABLE [dbo].[actualizaciones]  WITH CHECK ADD  CONSTRAINT [CK__actualizaciones__estado__failure__or__success__END] CHECK  (([estado]='FAILURE' OR [estado]='SUCCESS'))
GO
ALTER TABLE [dbo].[actualizaciones] CHECK CONSTRAINT [CK__actualizaciones__estado__failure__or__success__END]
GO
ALTER TABLE [dbo].[administradores]  WITH CHECK ADD  CONSTRAINT [ch__administradores__1__end] CHECK  (([bloqueado]='n' OR [bloqueado]='s'))
GO
ALTER TABLE [dbo].[administradores] CHECK CONSTRAINT [ch__administradores__1__end]
GO
ALTER TABLE [dbo].[administradores]  WITH CHECK ADD  CONSTRAINT [ch__intentos_fallidos__end] CHECK  (([intentos_fallidos]>=(0)))
GO
ALTER TABLE [dbo].[administradores] CHECK CONSTRAINT [ch__intentos_fallidos__end]
GO
ALTER TABLE [dbo].[concesionarias]  WITH CHECK ADD  CONSTRAINT [ch__concesionarias__1__end] CHECK  (([estado_autorizacion]='d' OR [estado_autorizacion]='a' OR [estado_autorizacion]='p'))
GO
ALTER TABLE [dbo].[concesionarias] CHECK CONSTRAINT [ch__concesionarias__1__end]
GO
ALTER TABLE [dbo].[suscripciones]  WITH CHECK ADD  CONSTRAINT [ch__suscripciones__al_dia__end] CHECK  (([al_dia]='Y' OR [al_dia]='N'))
GO
ALTER TABLE [dbo].[suscripciones] CHECK CONSTRAINT [ch__suscripciones__al_dia__end]
GO
/****** Object:  StoredProcedure [dbo].[actualizar_estado_sorteo]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[actualizar_estado_sorteo]
(
    @id_sorteo   INTEGER,
    @estado		VARCHAR(100)
)
as
BEGIN
	UPDATE dbo.sorteos SET estado = @estado WHERE id_sorteo = @id_sorteo
	IF(@estado = 'INIT')
	BEGIN
		UPDATE sorteos SET fecha_ejecucion = getdate() WHERE id_sorteo = @id_sorteo
	END	
END

GO
/****** Object:  StoredProcedure [dbo].[actualizar_sorteo_exitoso]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[actualizar_sorteo_exitoso]
(
    @id_sorteo integer,
    @id_concesionaria smallint ,
    @id_cliente integer
)
as
BEGIN

	IF(@id_concesionaria = 0 AND @id_cliente = 0)
	BEGIN 
		update sorteos
		   set fecha_ejecucion = getdate(),
			   estado = 'ejecutado'
		 where id_sorteo = @id_sorteo
	END 
	ELSE
    BEGIN 
		UPDATE sorteos SET fecha_fin_ejecucion = getdate(), estado = 'ejecutado' WHERE id_sorteo = @id_sorteo
		UPDATE dbo.clientes_sorteo SET ganador= 'Y' WHERE id_sorteo = @id_sorteo AND id_cliente = @id_cliente AND id_concesionaria = @id_concesionaria
	 END 
end

GO
/****** Object:  StoredProcedure [dbo].[cargar_sorteo]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[cargar_sorteo]
(
    @fecha_ejecucion   date
)
as
begin
    insert into sorteos (fecha_original, fecha_ejecucion, estado, intentos_fallidos, id_concesionaria, id_cliente)
    values (@fecha_ejecucion, null, 'pendiente', 0, null, null)
end


GO
/****** Object:  StoredProcedure [dbo].[eliminar_sorteo]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[eliminar_sorteo]
(
    @id_sorteo   integer
)
as
BEGIN
	DECLARE @err_message nvarchar(255)
	IF EXISTS(SELECT * FROM dbo.sorteos WHERE id_sorteo = @id_sorteo AND estado = 'pendiente')
		BEGIN 
			DELETE FROM sorteos WHERE id_sorteo = @id_sorteo 
		END 
	ELSE
		BEGIN
			SET @err_message = 'No se puede eliminar el sorteo ' + @id_sorteo
			RAISERROR(@err_message, 10, 1)
		END 
END


/*************************************************************************************************/
/************************** NUEVOS PROCEDIMIENTOS ALMACENADOS ************************************/
/*************************************************************************************************/


GO
/****** Object:  StoredProcedure [dbo].[get_actualizaciones]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_actualizaciones](
	@id_sorteo INT
)
as
BEGIN
	IF EXISTS (SELECT * FROM dbo.actualizaciones WHERE id_sorteo = @id_sorteo)
	BEGIN 
		SELECT 1 AS huboActualizaciones
	END 
	ELSE
    BEGIN 
		SELECT 0 AS huboActualizaciones
	END 
END
GO
/****** Object:  StoredProcedure [dbo].[get_actualizaciones_fallidas]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_actualizaciones_fallidas](
	@id_sorteo INT
)
as
BEGIN

	select c.id_concesionaria,
               c.razon_social,
               c.cuit,
               p.nombre as provincia,
               l.nombre as localidad,
               c.direccion,
               c.telefono,
               c.estado_autorizacion,
               s.id_servicio,
               s.url as url_servicio,
               s.funcion as funcion,
               s.puerto as puerto_servicio,
               t.nombre as tecnologia,
               t.sufijo
          from concesionarias c
          join provincias p
            on c.id_provincia = p.id_provincia
     left join localidades l
            on c.id_localidad = l.id_localidad
           and c.id_provincia = l.id_provincia
     left join servicios s
            on c.id_concesionaria = s.id_concesionaria
     left join tecnologias t
            on s.id_tecnologia = t.id_tecnologia
         where c.estado_autorizacion = 'a'
		 AND c.id_concesionaria IN (select a1.id_concesionaria
									  from actualizaciones a1
									  WHERE a1.id_sorteo= @id_sorteo AND estado ='FAILURE'
									  GROUP BY a1.id_concesionaria)
    
END

GO
/****** Object:  StoredProcedure [dbo].[get_aptos]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[get_aptos]
(
	@idSorteo INTEGER
)
AS  
BEGIN 
	SELECT *
	FROM dbo.clientes_sorteo cs 
	INNER JOIN dbo.clientes c ON c.id_concesionaria = cs.id_concesionaria AND c.id_cliente = cs.id_cliente
	INNER JOIN dbo.concesionarias con ON con.id_concesionaria = c.id_concesionaria 
	WHERE cs.id_sorteo = @idSorteo AND con.estado_autorizacion = 'a'
END
GO
/****** Object:  StoredProcedure [dbo].[get_clientes]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_clientes]
as
begin

    select convert(varchar(10),c.id_concesionaria) + '-' +
           convert(varchar(10),c.id_cliente) as id_cliente,
           c.nombre + ' ' + c.apellido as nombre,
           c.dni,
           c.mail,
           prov.nombre as provincia,
           c.direccion,
           au.marca,
           au.modelo,
           au.version,
           au.dominio,
           au.año,
           conc.razon_social as concesionaria,

           case when a.al_dia = 's'
                 and a.cant_cuotas_pagas >= (select top 1 cf.cuota_min_sorteo
                                              from config_plan cf )
                 and a.cant_cuotas_pagas <= (select top 1 cf.cuota_max_sorteo
                                              from config_plan cf )
                then 's'
                else 'n'
            end as apto_sorteo,

            a.cant_cuotas_pagas,
            a.al_dia,
           a.id_concesionaria as numero_id_concesionaria,
           a.id_cliente as numero_id_cliente
           
      from clientes c
      join provincias prov
        on c.id_provincia = prov.id_provincia
      join dbo.suscripciones a
        on c.id_concesionaria = a.id_concesionaria
       and c.id_cliente = a.id_cliente
 left join autos au
        on a.id_auto = au.id_auto
      join concesionarias conc
        on a.id_concesionaria = conc.id_concesionaria
END


GO
/****** Object:  StoredProcedure [dbo].[get_concesionarias]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[get_concesionarias]
as
	begin
        select c.id_concesionaria,
               c.razon_social,
               c.cuit,
               p.nombre as provincia,
               l.nombre as localidad,
               c.direccion,
               c.telefono,
               c.estado_autorizacion,
               s.id_servicio,
               s.url as url_servicio,
               s.funcion as funcion,
               s.puerto as puerto_servicio,
               t.nombre as tecnologia
          from concesionarias c
          join provincias p
            on c.id_provincia = p.id_provincia
     left join localidades l
            on c.id_localidad = l.id_localidad
           and c.id_provincia = l.id_provincia
     left join servicios s
            on c.id_concesionaria = s.id_concesionaria
     left join tecnologias t
            on s.id_tecnologia = t.id_tecnologia
      order by case
                   when c.estado_autorizacion = 'p' then '1'
                   when c.estado_autorizacion = 'a' then '2'
                   when c.estado_autorizacion = 'd' then '3'
               end
	end


GO
/****** Object:  StoredProcedure [dbo].[get_concesionarias_autorizadas]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_concesionarias_autorizadas]
as
	begin
        select c.id_concesionaria,
               c.razon_social,
               c.cuit,
               p.nombre as provincia,
               l.nombre as localidad,
               c.direccion,
               c.telefono,
               c.estado_autorizacion,
               s.id_servicio,
               s.url as url_servicio,
               s.funcion as funcion,
               s.puerto as puerto_servicio,
               t.nombre as tecnologia,
               t.sufijo
          from concesionarias c
          join provincias p
            on c.id_provincia = p.id_provincia
     left join localidades l
            on c.id_localidad = l.id_localidad
           and c.id_provincia = l.id_provincia
     left join servicios s
            on c.id_concesionaria = s.id_concesionaria
     left join tecnologias t
            on s.id_tecnologia = t.id_tecnologia
         where c.estado_autorizacion = 'a'
	end



GO
/****** Object:  StoredProcedure [dbo].[get_cuotas]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[get_cuotas](@id_concesionaria smallint,@id_cliente integer)
as
begin

    select *
      from cuotas
     where id_concesionaria = @id_concesionaria
       and id_cliente = @id_cliente
end


GO
/****** Object:  StoredProcedure [dbo].[get_detalle_sorteos]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_detalle_sorteos]
AS
BEGIN

	SELECT s.id_sorteo, s.fecha_original, s.fecha_ejecucion, s.fecha_fin_ejecucion,s.estado, s.intentos_fallidos, ISNULL(cs.nombre + ' ' + cs.apellido,'-') AS ganador, 
	ISNULL(cs.mail,'-') AS mail, ISNULL(c.razon_social,'-') AS concesionaria
	FROM dbo.sorteos s
	LEFT JOIN dbo.clientes_sorteo cs ON cs.id_sorteo = s.id_sorteo AND cs.ganador = 'Y'
	LEFT JOIN dbo.concesionarias c ON c.id_concesionaria = cs.id_concesionaria
	WHERE estado <> 'pendiente'
	ORDER BY s.fecha_original DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_ganador_sorteo]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_ganador_sorteo]
(
	@id_sorteo INTEGER
)
AS 
BEGIN

	SELECT cs.id_sorteo, id_cliente, c.id_concesionaria, c.razon_social, cs.nombre, cs.apellido, cs.mail
	FROM dbo.clientes_sorteo cs
	INNER JOIN dbo.concesionarias c ON c.id_concesionaria = cs.id_concesionaria
	WHERE id_sorteo = @id_sorteo AND ganador = 'Y'

END
GO
/****** Object:  StoredProcedure [dbo].[get_id_auto]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[get_id_auto]
(
    @marca varchar(200),
    @modelo varchar(200),
    @version varchar(200),
    @dominio varchar(100),
    @anio smallint   
)
as
begin
    select top 1 isnull(id_auto,-1) as id_auto
    from autos a
        where a.marca = @marca
          and a.modelo = @modelo
          and a.version = @version
          and a.año = @anio
          and a.dominio = @dominio
end


GO
/****** Object:  StoredProcedure [dbo].[get_localidades]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[get_localidades]
(
    @id_provincia   tinyint
)
as
begin
    select *
      from localidades l
     where l.id_provincia = @id_provincia
end


GO
/****** Object:  StoredProcedure [dbo].[get_max_id_actualizacion]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_max_id_actualizacion]
AS
BEGIN
	SELECT ISNULL(MAX(id_actualizacion),0) AS id_actualizacion FROM dbo.actualizaciones
END

GO
/****** Object:  StoredProcedure [dbo].[get_max_id_cliente]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[get_max_id_cliente]
(
    @id_concesionaria   smallint
)
as
begin
    select isnull(max(id_cliente),0) as max_id
      from clientes 
     where id_concesionaria = @id_concesionaria

end


GO
/****** Object:  StoredProcedure [dbo].[get_participantes_sorteo]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_participantes_sorteo]
(
	@idSorteo INTEGER
)
AS
BEGIN
	SELECT cs.id_sorteo, s.fecha_original, cs.nombre + ' ' + cs.apellido AS nombre, c.razon_social
	FROM dbo.clientes_sorteo cs
	INNER JOIN dbo.concesionarias c ON c.id_concesionaria = cs.id_concesionaria 
	INNER JOIN dbo.sorteos s ON s.id_sorteo = cs.id_sorteo
	WHERE cs.id_sorteo = @idSorteo
	ORDER BY cs.id_concesionaria ASC
END
GO
/****** Object:  StoredProcedure [dbo].[get_provincias]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[get_provincias]
as
begin
    select *
      from provincias p
end


GO
/****** Object:  StoredProcedure [dbo].[get_sorteos]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[get_sorteos]
as
begin
	select s.id_sorteo, s.fecha_original, s.fecha_ejecucion, s.estado, s.intentos_fallidos,
		conc.razon_social as concesionaria, c.nombre + ' ' + c.apellido as ganador, c.dni, c.mail,
		p.nombre as provincia
	from sorteos s
	left join clientes c on s.id_concesionaria = c.id_concesionaria and s.id_cliente = c.id_cliente
	left join concesionarias conc on c.id_concesionaria = conc.id_concesionaria
	left join provincias p on c.id_provincia = p.id_provincia
	order by s.fecha_original desc
END
GO
/****** Object:  StoredProcedure [dbo].[get_tecnologias]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_tecnologias]
as
begin
    select *
      from tecnologias t
end

GO
/****** Object:  StoredProcedure [dbo].[guardar_actualizacion]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[guardar_actualizacion]
(
	@id_actualizacion INTEGER,
    @id_concesionaria    SMALLINT,
	@id_sorteo			INT,
	@estado VARCHAR(10)
)
AS
BEGIN
    INSERT INTO actualizaciones(id_actualizacion, id_concesionaria,id_sorteo, estado, fecha)
    VALUES(@id_actualizacion, @id_concesionaria, @id_sorteo, @estado, GETDATE())

	IF(@estado = 'SUCCESS')
	BEGIN
		UPDATE dbo.concesionarias SET cant_intentos = 0, estado_actualizacion = @estado, ult_actualizacion = GETDATE() 
		WHERE id_concesionaria = @id_concesionaria
	END
    ELSE
    BEGIN 
		UPDATE dbo.concesionarias SET cant_intentos = cant_intentos+1 , estado_actualizacion = @estado, ult_actualizacion = GETDATE() 
		WHERE id_concesionaria = @id_concesionaria
	END 
END
GO
/****** Object:  StoredProcedure [dbo].[guardar_auto]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[guardar_auto]
(
    @marca varchar(200),
    @modelo varchar(200),
    @version varchar(200),
    @dominio varchar(100),
    @anio smallint   
)
as
begin
	IF NOT EXISTS(SELECT marca FROM dbo.autos WHERE marca = @marca AND modelo=@modelo AND version = @version AND dominio = @dominio)
	BEGIN 
		insert into autos(marca,modelo,version,dominio,año)
		values(@marca,@modelo,@version,@dominio,@anio)
	END 
END

GO
/****** Object:  StoredProcedure [dbo].[guardar_cliente]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[guardar_cliente]
(
    @id_concesionaria    smallint,
    @id_cliente          integer,
    @nombre              varchar (50),
    @apellido            varchar (50),
    @dni                 integer,
    @mail                varchar (50),
    @provincia           varchar (50),
    @localidad           varchar (50),
    @direccion           varchar (100)
)
AS 
BEGIN 

    declare @id_provincia tinyint
    
    set @id_provincia =  (select top 1 p.id_provincia
                              from provincias p
                            where p.nombre = @provincia)

    declare @id_localidad smallint
    
    set @id_localidad = (select top 1 l.id_localidad
                              from localidades l
                            where l.nombre = @localidad)

	IF NOT EXISTS(SELECT id_cliente FROM dbo.clientes WHERE dni = @dni AND id_concesionaria = @id_concesionaria ) 
	BEGIN

		INSERT INTO clientes (id_concesionaria, id_cliente, nombre, apellido, dni, mail, id_provincia, id_localidad, direccion)
		VALUES 
		   (@id_concesionaria, @id_cliente, @nombre, @apellido,  @dni, @mail, @id_provincia, @id_localidad, @direccion)
		END

	ELSE 
		UPDATE clientes SET nombre = @nombre, apellido = @apellido, mail = @mail, id_provincia = @id_provincia, direccion = @direccion
		WHERE id_cliente = @id_cliente AND id_concesionaria = @id_concesionaria 

END 


GO
/****** Object:  StoredProcedure [dbo].[guardar_cuota]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[guardar_cuota]
(
    @id_concesionaria    smallint,
    @dni				 INTEGER,
    @id_suscripcion      integer,
    @id_cuota            integer,
    @fecha_vencimiento   date,
    @fecha_pago          date
)
as
BEGIN
		DECLARE @id_cliente INTEGER
		SET @id_cliente = (SELECT id_cliente FROM dbo.clientes WHERE dni = @dni)

		IF NOT EXISTS (SELECT id_cuota FROM dbo.cuotas WHERE id_cuota= @id_cuota AND id_cliente=@id_cliente AND id_concesionaria=@id_concesionaria AND id_suscripcion=@id_suscripcion)
		BEGIN 
			insert into cuotas(id_concesionaria,id_cliente,id_suscripcion,id_cuota,fecha_vencimiento,fecha_pago)
			values(@id_concesionaria,@id_cliente,@id_suscripcion,@id_cuota,@fecha_vencimiento,@fecha_pago)
		END 
end

GO
/****** Object:  StoredProcedure [dbo].[guardar_error]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[guardar_error]
(
    @descripcion    varchar(500)
)
as
begin

    insert into log_errores(descripcion)
    values(@descripcion)
    
end


GO
/****** Object:  StoredProcedure [dbo].[guardar_suscripcion]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[guardar_suscripcion]
(
	@id_suscripcion   varchar(20),
    @identificador_gob   varchar(20),
    @id_concesionaria    smallint,
    @dni         integer,
    @id_auto             integer,
    @cant_cuotas_pagas   smallint,
    @al_dia              char(1)
)
as
BEGIN

	DECLARE @id_cliente INTEGER
    SET @id_cliente = (SELECT id_cliente FROM dbo.clientes WHERE dni = @dni AND id_concesionaria = @id_concesionaria)

	IF NOT EXISTS (SELECT id_suscripcion FROM dbo.suscripciones WHERE id_cliente = @id_cliente AND id_concesionaria = @id_concesionaria AND id_suscripcion = @id_suscripcion)
		BEGIN 
			insert into suscripciones(id_suscripcion,identificador_gob,id_concesionaria,id_cliente,id_auto, cant_cuotas_pagas, al_dia) 
			values(@id_suscripcion,@identificador_gob,@id_concesionaria,@id_cliente,@id_auto,@cant_cuotas_pagas,@al_dia)
		END
	ELSE 
		BEGIN
			UPDATE dbo.suscripciones SET id_auto = @id_auto, cant_cuotas_pagas = @cant_cuotas_pagas, al_dia = @al_dia    
			WHERE id_cliente = @id_cliente AND id_concesionaria = @id_concesionaria AND id_suscripcion = @id_suscripcion
		END
	
END 
GO
/****** Object:  StoredProcedure [dbo].[p_get_all_clientes]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[p_get_all_clientes]
AS
BEGIN
	SELECT DISTINCT dni, cli.nombre + ' ' + apellido AS nombre, con.id_concesionaria, prov.nombre AS provincia, cli.direccion + ', ' + loc.nombre AS direccion, 
	mail, au.marca,au.modelo,au.version, au.dominio, con.razon_social AS concesionaria, ad.cant_cuotas_pagas AS cuotas_pagas, ad.id_cliente, ad.al_dia, au.año AS anio
	FROM dbo.clientes cli
	INNER JOIN dbo.suscripciones ad ON ad.id_concesionaria = cli.id_concesionaria AND ad.id_cliente = cli.id_cliente
	INNER JOIN dbo.localidades loc ON loc.id_provincia = cli.id_provincia AND loc.id_localidad = cli.id_localidad
	INNER JOIN dbo.provincias prov ON prov.id_provincia = loc.id_provincia
	INNER JOIN dbo.concesionarias con ON con.id_concesionaria = cli.id_concesionaria
	LEFT JOIN dbo.autos au ON au.id_auto = ad.id_auto
	

END 
GO
/****** Object:  StoredProcedure [dbo].[P_get_blog]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_get_blog]
AS
BEGIN
	SELECT isp.sorteo, np.nota, novp.novedad, ip.informacion, ap.aviso, npp.noticiaPpal, tp.titulo
		FROM dbo.portal_web pw 
		LEFT JOIN dbo.info_sorteo isp
			on pw.id = isp.id
		LEFT JOIN dbo.notas np
			on pw.id = np.id
		LEFT JOIN dbo.novedades novp
			on pw.id = novp.id
		LEFT JOIN dbo.informacion ip
			on pw.id = ip.id
		LEFT JOIN dbo.avisos ap
			on pw.id = ap.id
		LEFT JOIN dbo.noticia_ppal npp
			on pw.id = npp.id
		LEFT JOIN dbo.titulos tp
			on pw.id = tp.id
		order by pw.id
END

GO
/****** Object:  StoredProcedure [dbo].[p_get_cant_concesionarias_por_estado]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[p_get_cant_concesionarias_por_estado]
AS
BEGIN
	SELECT COUNT(estado_autorizacion) AS cantidad, estado_autorizacion
	FROM dbo.concesionarias
	GROUP BY estado_autorizacion
END

GO
/****** Object:  StoredProcedure [dbo].[P_GET_CONCESIONARIAS]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_GET_CONCESIONARIAS]
AS
    SELECT conc.id_concesionaria, razon_social, cuit, direccion, telefono, ISNULL(serv.url, '') AS url, ISNULL(serv.puerto, 0) AS puerto, ISNULL(serv.id_tecnologia, 0) AS id_tecnologia, conc.estado_autorizacion
	FROM dbo.concesionarias conc
	LEFT JOIN dbo.servicios serv ON serv.id_concesionaria = conc.id_concesionaria



GO
/****** Object:  StoredProcedure [dbo].[p_get_datos_cuantitativos]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[p_get_datos_cuantitativos]
AS 
BEGIN
	DECLARE @cant_sorteos_pendientes SMALLINT
	DECLARE @cant_sorteos_atrasados SMALLINT
	DECLARE @prox_sorteo DATETIME
	DECLARE @cant_clientes SMALLINT
	DECLARE @cant_concesionarias_aprobadas SMALLINT
	DECLARE @cant_concesionarias_pendientes SMALLINT
	DECLARE @cant_concesionarias_rechazadas SMALLINT

	SET @cant_sorteos_pendientes = (SELECT COUNT(1) AS cant_sorteos_pendientes
									FROM dbo.sorteos
									WHERE estado ='pendiente')

	SET @cant_sorteos_atrasados = (SELECT COUNT(1) AS cant_sorteos_atrasados
									FROM dbo.sorteos
									WHERE estado ='pendiente' AND fecha_original < GETDATE())

	SET @prox_sorteo = (SELECT TOP 1 fecha_original
						FROM dbo.sorteos
						WHERE estado = 'pendiente' OR estado <> 'finalizado'
						ORDER BY fecha_original ASC)


	SET @cant_clientes = (SELECT COUNT(DISTINCT dni) 
							FROM dbo.clientes)

	SELECT @cant_concesionarias_aprobadas = COUNT(1) FROM dbo.concesionarias WHERE estado_autorizacion = 'a'

	SELECT @cant_concesionarias_pendientes = COUNT(1) FROM dbo.concesionarias WHERE estado_autorizacion = 'p'

	SELECT @cant_concesionarias_rechazadas = COUNT(1) FROM dbo.concesionarias WHERE estado_autorizacion = 'r'

	SELECT TOP 1 @cant_clientes AS cantidad_clientes, @cant_sorteos_atrasados AS cant_sorteos_atrasados, @cant_sorteos_pendientes AS cant_sorteos_pendientes, @prox_sorteo AS prox_sorteo,
	@cant_concesionarias_aprobadas AS cant_conces_aprob, @cant_concesionarias_pendientes AS cant_conces_pend, @cant_concesionarias_rechazadas AS cant_conces_rech,
	s.fecha_ejecucion, s.estado, cs.nombre + ' ' + cs.apellido AS nombre, c.razon_social
	FROM dbo.sorteos s 
	LEFT JOIN dbo.clientes_sorteo cs ON cs.id_sorteo = s.id_sorteo
	LEFT JOIN dbo.concesionarias c ON c.id_concesionaria = cs.id_concesionaria
	WHERE s.fecha_fin_ejecucion IS NOT NULL AND cs.ganador = 'Y'
	ORDER BY s.fecha_original DESC

END

GO
/****** Object:  StoredProcedure [dbo].[P_get_ganadores]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_get_ganadores]
	AS
	BEGIN
		SELECT s.fecha_fin_ejecucion AS fecha_ejecucion, c.apellido + ', ' + c.nombre AS cliente , co.razon_social 
		FROM dbo.sorteos s 
		INNER JOIN dbo.clientes_sorteo cs ON cs.id_sorteo = s.id_sorteo AND cs.ganador= 'Y'
		INNER JOIN dbo.clientes c ON c.id_concesionaria = cs.id_concesionaria AND c.id_cliente = cs.id_cliente
		INNER JOIN dbo.concesionarias co ON co.id_concesionaria = c.id_concesionaria
	END



GO
/****** Object:  StoredProcedure [dbo].[p_get_ultimas_actualizaciones_concesionarias]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[p_get_ultimas_actualizaciones_concesionarias]
AS
BEGIN
	SELECT DISTINCT c.razon_social, c.cuit, c.telefono, c.ult_actualizacion AS fecha_actualizacion, c.cant_intentos, c.estado_autorizacion, c.estado_actualizacion, c1.cant_clientes,
	c.direccion + ' - ' + l.nombre + ' - ' + p.nombre AS direccion
	FROM dbo.concesionarias c
	INNER JOIN ( SELECT COUNT(1) AS cant_clientes, id_concesionaria 
				FROM dbo.suscripciones 
				GROUP BY id_concesionaria) AS c1 ON c1.id_concesionaria = c.id_concesionaria
	LEFT JOIN dbo.provincias p ON p.id_provincia = c.id_provincia
	LEFT JOIN dbo.localidades l ON l.id_provincia = c.id_provincia AND l.id_localidad = c.id_localidad
	WHERE estado_autorizacion = 'a' 
	ORDER BY c.ult_actualizacion DESC

	
END

GO
/****** Object:  StoredProcedure [dbo].[P_SET_CONCESIONARIA_HABILITADA]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_SET_CONCESIONARIA_HABILITADA]
@idConcesionaria VARCHAR(10),
@habilitada CHAR(1),
@url varchar(500),
@tecnologia tinyint
AS
	IF(@idConcesionaria IS NOT NULL) BEGIN 
		UPDATE dbo.concesionarias SET estado_autorizacion = @habilitada WHERE id_concesionaria = @idConcesionaria

		IF NOT EXISTS(SELECT id_concesionaria FROM dbo.servicios WHERE id_concesionaria = @idConcesionaria)
		BEGIN
			INSERT INTO dbo.servicios( id_concesionaria ,id_tecnologia ,url ,funcion ,puerto)
			VALUES  ( @idConcesionaria ,@tecnologia ,@url ,'clientes' ,0)
        END
		ELSE        
			UPDATE dbo.servicios SET url = @url, id_tecnologia = @tecnologia WHERE id_concesionaria = @idConcesionaria
	END 


GO
/****** Object:  StoredProcedure [dbo].[set_actualizacion_erronea]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[set_actualizacion_erronea]
(
    @id_concesionaria  INTEGER 
)
AS 
BEGIN 
    UPDATE dbo.concesionarias SET cant_intentos = cant_intentos+1
    WHERE id_concesionaria = @id_concesionaria
END 

GO
/****** Object:  StoredProcedure [dbo].[set_clientes_sorteo]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[set_clientes_sorteo]
(
    @id_sorteo INTEGER
)
AS
BEGIN
		DECLARE @cantMinCuotas INTEGER
		DECLARE @cantMaxCuotas INTEGER
		SELECT @cantMinCuotas = cuota_min_sorteo, @cantMaxCuotas= cuota_max_sorteo FROM dbo.config_plan
	   
		INSERT INTO dbo.clientes_sorteo (id_sorteo, id_cliente, id_concesionaria, nombre, apellido, dni, mail)
		SELECT @id_sorteo, c.id_cliente, c.id_concesionaria, c.nombre, c.apellido,c.dni, c.mail
		FROM dbo.clientes c
		INNER JOIN dbo.suscripciones s ON s.id_concesionaria = c.id_concesionaria AND s.id_cliente = c.id_cliente
		WHERE s.al_dia = 'Y' 
		AND s.cant_cuotas_pagas BETWEEN @cantMinCuotas 
		AND @cantMaxCuotas AND NOT EXISTS ( SELECT * 
											FROM dbo.clientes_sorteo cs 
											WHERE ganador = 'Y' AND cs.id_cliente = c.id_cliente AND cs.id_concesionaria = c.id_concesionaria) 
			  
END
GO
/****** Object:  StoredProcedure [dbo].[set_fin_sorteo]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[set_fin_sorteo]
(
    @id_sorteo INTEGER 
)
AS
BEGIN

	UPDATE sorteos SET fecha_fin_ejecucion = GETDATE() WHERE id_sorteo = @id_sorteo

END

GO
/****** Object:  StoredProcedure [dbo].[set_ganador_sorteo]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[set_ganador_sorteo]
(
    @id_sorteo integer,
    @id_concesionaria smallint ,
    @id_cliente integer
)
AS
BEGIN
	UPDATE dbo.clientes_sorteo SET ganador= 'Y' 
	WHERE id_sorteo = @id_sorteo AND id_cliente = @id_cliente AND id_concesionaria = @id_concesionaria
END

GO
/****** Object:  StoredProcedure [dbo].[set_sorteo_erroneo]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[set_sorteo_erroneo]
(
    @id_sorteo  integer
)
as
begin
    update sorteos
       set intentos_fallidos = intentos_fallidos+1
     where id_sorteo = @id_sorteo
end


GO
/****** Object:  StoredProcedure [dbo].[solicitud_concesionaria]    Script Date: 08/06/2019 22:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[solicitud_concesionaria]
(
    @razon_social   varchar (50),
    @cuit           varchar (14),
    @id_provincia   tinyint,
    @id_localidad   smallint,
    @direccion      varchar (100),
    @telefono       varchar (20)
)
as
begin
    insert into concesionarias (razon_social,
                                cuit,
                                id_provincia,
                                id_localidad,
                                direccion,
                                telefono,
                                estado_autorizacion)
    values (@razon_social,
            @cuit,
            @id_provincia,
            @id_localidad,
            @direccion,
            @telefono,
            'p')
end


GO
