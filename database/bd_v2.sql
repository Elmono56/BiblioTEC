USE [master]
GO
/****** Object:  Database [BIblioTEC]    Script Date: 4/4/2023 12:33:04 ******/
CREATE DATABASE [BIblioTEC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BIblioTEC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MIRRORINSTANCE\MSSQL\DATA\BIblioTEC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BIblioTEC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MIRRORINSTANCE\MSSQL\DATA\BIblioTEC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BIblioTEC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BIblioTEC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BIblioTEC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BIblioTEC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BIblioTEC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BIblioTEC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BIblioTEC] SET ARITHABORT OFF 
GO
ALTER DATABASE [BIblioTEC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BIblioTEC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BIblioTEC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BIblioTEC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BIblioTEC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BIblioTEC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BIblioTEC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BIblioTEC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BIblioTEC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BIblioTEC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BIblioTEC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BIblioTEC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BIblioTEC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BIblioTEC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BIblioTEC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BIblioTEC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BIblioTEC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BIblioTEC] SET RECOVERY FULL 
GO
ALTER DATABASE [BIblioTEC] SET  MULTI_USER 
GO
ALTER DATABASE [BIblioTEC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BIblioTEC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BIblioTEC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BIblioTEC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BIblioTEC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BIblioTEC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BIblioTEC] SET QUERY_STORE = OFF
GO
USE [BIblioTEC]
GO
/****** Object:  Table [dbo].[Administradores]    Script Date: 4/4/2023 12:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administradores](
	[codAdmin] [int] IDENTITY(1,1) NOT NULL,
	[identPers] [int] NOT NULL,
	[correoElec] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cancelaciones]    Script Date: 4/4/2023 12:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cancelaciones](
	[idCancelacion] [int] IDENTITY(1,1) NOT NULL,
	[idReserva] [int] NOT NULL,
	[motivo] [varchar](100) NOT NULL,
	[momentoCan] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Confirmaciones]    Script Date: 4/4/2023 12:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Confirmaciones](
	[idConfirma] [int] IDENTITY(1,1) NOT NULL,
	[idReserva] [int] NOT NULL,
	[momentoCon] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cubiculos]    Script Date: 4/4/2023 12:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cubiculos](
	[numCubiculo] [int] NOT NULL,
	[idEstado] [int] NOT NULL,
	[capacidad] [int] NOT NULL,
	[servEsp] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Cubiculos] PRIMARY KEY CLUSTERED 
(
	[numCubiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadosCub]    Script Date: 4/4/2023 12:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadosCub](
	[idEstado] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EstadosCub] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadosEst]    Script Date: 4/4/2023 12:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadosEst](
	[idEstadoE] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EstadosEst] PRIMARY KEY CLUSTERED 
(
	[idEstadoE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estud_Eliminados]    Script Date: 4/4/2023 12:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estud_Eliminados](
	[idEstEl] [int] NOT NULL,
	[numCarnet] [int] NOT NULL,
	[motivo] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Estud_Eliminados] PRIMARY KEY CLUSTERED 
(
	[idEstEl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiantes]    Script Date: 4/4/2023 12:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiantes](
	[numCarnet] [int] NOT NULL,
	[idEstadoE] [int] NOT NULL,
	[correoElec] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
	[idServEsp] [int] NOT NULL,
	[identPers] [int] NOT NULL,
 CONSTRAINT [PK_Estudiantes_1] PRIMARY KEY CLUSTERED 
(
	[numCarnet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 4/4/2023 12:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[identPers] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apel1] [varchar](50) NOT NULL,
	[apel2] [varchar](50) NOT NULL,
	[fechaNaci] [date] NOT NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[identPers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservaciones]    Script Date: 4/4/2023 12:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservaciones](
	[idReserva] [int] IDENTITY(1,1) NOT NULL,
	[numCubiculo] [int] NOT NULL,
	[numCarnet] [int] NOT NULL,
	[fechaReserv] [date] NOT NULL,
	[horaInicio] [time](7) NOT NULL,
	[horaFinal] [time](7) NOT NULL,
 CONSTRAINT [PK_Reservaciones] PRIMARY KEY CLUSTERED 
(
	[idReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposServEsp]    Script Date: 4/4/2023 12:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposServEsp](
	[idServEsp] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TiposServEsp] PRIMARY KEY CLUSTERED 
(
	[idServEsp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Administradores]  WITH CHECK ADD  CONSTRAINT [FK_Administradores_Personas] FOREIGN KEY([identPers])
REFERENCES [dbo].[Personas] ([identPers])
GO
ALTER TABLE [dbo].[Administradores] CHECK CONSTRAINT [FK_Administradores_Personas]
GO
ALTER TABLE [dbo].[Cancelaciones]  WITH CHECK ADD  CONSTRAINT [FK_Cancelaciones_Reservaciones] FOREIGN KEY([idReserva])
REFERENCES [dbo].[Reservaciones] ([idReserva])
GO
ALTER TABLE [dbo].[Cancelaciones] CHECK CONSTRAINT [FK_Cancelaciones_Reservaciones]
GO
ALTER TABLE [dbo].[Confirmaciones]  WITH CHECK ADD  CONSTRAINT [FK_Confirmaciones_Reservaciones] FOREIGN KEY([idReserva])
REFERENCES [dbo].[Reservaciones] ([idReserva])
GO
ALTER TABLE [dbo].[Confirmaciones] CHECK CONSTRAINT [FK_Confirmaciones_Reservaciones]
GO
ALTER TABLE [dbo].[Cubiculos]  WITH CHECK ADD  CONSTRAINT [FK_Cubiculos_EstadosCub] FOREIGN KEY([idEstado])
REFERENCES [dbo].[EstadosCub] ([idEstado])
GO
ALTER TABLE [dbo].[Cubiculos] CHECK CONSTRAINT [FK_Cubiculos_EstadosCub]
GO
ALTER TABLE [dbo].[Estud_Eliminados]  WITH CHECK ADD  CONSTRAINT [FK_Estud_Eliminados_Estudiantes] FOREIGN KEY([numCarnet])
REFERENCES [dbo].[Estudiantes] ([numCarnet])
GO
ALTER TABLE [dbo].[Estud_Eliminados] CHECK CONSTRAINT [FK_Estud_Eliminados_Estudiantes]
GO
ALTER TABLE [dbo].[Estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_Estudiantes_EstadosEst] FOREIGN KEY([idEstadoE])
REFERENCES [dbo].[EstadosEst] ([idEstadoE])
GO
ALTER TABLE [dbo].[Estudiantes] CHECK CONSTRAINT [FK_Estudiantes_EstadosEst]
GO
ALTER TABLE [dbo].[Estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_Estudiantes_Personas] FOREIGN KEY([identPers])
REFERENCES [dbo].[Personas] ([identPers])
GO
ALTER TABLE [dbo].[Estudiantes] CHECK CONSTRAINT [FK_Estudiantes_Personas]
GO
ALTER TABLE [dbo].[Estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_Estudiantes_TiposServEsp] FOREIGN KEY([idServEsp])
REFERENCES [dbo].[TiposServEsp] ([idServEsp])
GO
ALTER TABLE [dbo].[Estudiantes] CHECK CONSTRAINT [FK_Estudiantes_TiposServEsp]
GO
ALTER TABLE [dbo].[Reservaciones]  WITH CHECK ADD  CONSTRAINT [FK_Reservaciones_Cubiculos] FOREIGN KEY([numCubiculo])
REFERENCES [dbo].[Cubiculos] ([numCubiculo])
GO
ALTER TABLE [dbo].[Reservaciones] CHECK CONSTRAINT [FK_Reservaciones_Cubiculos]
GO
ALTER TABLE [dbo].[Reservaciones]  WITH CHECK ADD  CONSTRAINT [FK_Reservaciones_Estudiantes] FOREIGN KEY([numCarnet])
REFERENCES [dbo].[Estudiantes] ([numCarnet])
GO
ALTER TABLE [dbo].[Reservaciones] CHECK CONSTRAINT [FK_Reservaciones_Estudiantes]
GO
USE [master]
GO
ALTER DATABASE [BIblioTEC] SET  READ_WRITE 
GO
