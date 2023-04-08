USE [master]
GO
/****** Object:  Database [BiblioTEC]    Script Date: 8/4/2023 15:54:57 ******/
CREATE DATABASE [BiblioTEC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BIblioTEC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MIRRORINSTANCE\MSSQL\DATA\BIblioTEC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BIblioTEC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MIRRORINSTANCE\MSSQL\DATA\BIblioTEC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BiblioTEC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BiblioTEC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BiblioTEC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BiblioTEC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BiblioTEC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BiblioTEC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BiblioTEC] SET ARITHABORT OFF 
GO
ALTER DATABASE [BiblioTEC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BiblioTEC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BiblioTEC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BiblioTEC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BiblioTEC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BiblioTEC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BiblioTEC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BiblioTEC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BiblioTEC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BiblioTEC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BiblioTEC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BiblioTEC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BiblioTEC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BiblioTEC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BiblioTEC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BiblioTEC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BiblioTEC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BiblioTEC] SET RECOVERY FULL 
GO
ALTER DATABASE [BiblioTEC] SET  MULTI_USER 
GO
ALTER DATABASE [BiblioTEC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BiblioTEC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BiblioTEC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BiblioTEC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BiblioTEC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BiblioTEC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BiblioTEC] SET QUERY_STORE = OFF
GO
USE [BiblioTEC]
GO
/****** Object:  Table [dbo].[Administradores]    Script Date: 8/4/2023 15:54:57 ******/
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
/****** Object:  Table [dbo].[Cancelaciones]    Script Date: 8/4/2023 15:54:57 ******/
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
/****** Object:  Table [dbo].[Confirmaciones]    Script Date: 8/4/2023 15:54:57 ******/
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
/****** Object:  Table [dbo].[Cubiculos]    Script Date: 8/4/2023 15:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cubiculos](
	[numCubiculo] [int] NOT NULL,
	[idEstado] [int] NOT NULL,
	[capacidad] [int] NOT NULL,
	[servEsp] [int] NOT NULL,
	[ubicacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cubiculos] PRIMARY KEY CLUSTERED 
(
	[numCubiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadosCub]    Script Date: 8/4/2023 15:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadosCub](
	[idEstadoCub] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EstadosCub] PRIMARY KEY CLUSTERED 
(
	[idEstadoCub] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadosEst]    Script Date: 8/4/2023 15:54:57 ******/
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
/****** Object:  Table [dbo].[Estud_Eliminados]    Script Date: 8/4/2023 15:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estud_Eliminados](
	[idEstEl] [int] IDENTITY(1,1) NOT NULL,
	[numCarnet] [int] NOT NULL,
	[motivo] [varchar](100) NOT NULL,
	[fechaE] [date] NOT NULL,
 CONSTRAINT [PK_Estud_Eliminados] PRIMARY KEY CLUSTERED 
(
	[idEstEl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiantes]    Script Date: 8/4/2023 15:54:57 ******/
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
/****** Object:  Table [dbo].[Personas]    Script Date: 8/4/2023 15:54:57 ******/
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
/****** Object:  Table [dbo].[Reservaciones]    Script Date: 8/4/2023 15:54:57 ******/
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
/****** Object:  Table [dbo].[TiposServEsp]    Script Date: 8/4/2023 15:54:57 ******/
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
REFERENCES [dbo].[EstadosCub] ([idEstadoCub])
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
/****** Object:  StoredProcedure [dbo].[CRUD_Administradores]    Script Date: 8/4/2023 15:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUD_Administradores]
	@pCodAdmin INT,
	@pIdentPers INT, 
	@pCorreo VARCHAR(50), 
	@pContra VARCHAR(50),
	@pOperacion VARCHAR(10)
AS
BEGIN

DECLARE @msgError VARCHAR(70);
SET @msgError = '';

	IF (@pCodAdmin IS NOT NULL)
	BEGIN

		IF (@pOperacion = 'CREATE')
		BEGIN

			IF ((SELECT COUNT(*) FROM Personas WHERE identPers = @pIdentPers) = 0)
			BEGIN
				SET @msgError = 'No existe persona registrada con esa identificación';
				SELECT @msgError;
			END

			IF (@pCorreo = '' OR @pCorreo IS NULL) 
			BEGIN
				SET @msgError = 'El correo es inválido';
				SELECT @msgError;
			END

			IF (@pContra = '' OR @pContra IS NULL OR (LEN(@pContra) < 10)) 
			BEGIN
				SET @msgError = 'La contraseña es inválida';
				SELECT @msgError;
			END

			INSERT INTO Administradores(identPers, correoElec, contraseña)
			VALUES (@pIdentPers, @pCorreo, @pContra);
		
		END



		IF (@pOperacion = 'READ')
		BEGIN

			IF ((SELECT COUNT(*) FROM Administradores WHERE codAdmin = @pCodAdmin) = 0)
			BEGIN
				SET @msgError = 'El administrador no existe, no se puede realizar la busqueda';
				SELECT @msgError;
			END

			SELECT * FROM Administradores WHERE codAdmin = @pCodAdmin;

		END



		IF (@pOperacion = 'UPDATE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM Administradores WHERE codAdmin = @pCodAdmin) = 0)
			BEGIN
				SET @msgError = 'El administrador no existe, no se puede modificar';
				SELECT @msgError;
			END

			IF (@pIdentPers IS NOT NULL AND (SELECT COUNT(*) FROM Personas WHERE identPers = @pIdentPers) = 0)
			BEGIN
				SET @msgError = 'No existe persona registrada asociada a esa identificacion';
				SELECT @msgError;
			END

			IF (@pCorreo = '') 
			BEGIN
				SET @msgError = 'El correo es inválido';
				SELECT @msgError;
			END

			IF (@pContra = '') 
			BEGIN
				SET @msgError = 'La contraseña es inválida';
				SELECT @msgError;
			END

			UPDATE Administradores
			SET identPers = ISNULL(@pIdentPers , identPers), correoElec = ISNULL(@pCorreo, correoElec), contraseña = ISNULL(@pContra, contraseña)
			WHERE codAdmin = @pCodAdmin;

		END
        


		IF (@pOperacion = 'DELETE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM Administradores WHERE codAdmin = @pCodAdmin) = 0)
			BEGIN
				SET @msgError = 'El administrador no existe, no se puede eliminar';
				SELECT @msgError;
			END

			DELETE FROM Administradores
			WHERE codAdmin = @pCodAdmin;
			
		END


        
	ELSE
		SET @msgError = 'El codigo de administrador está vacío';
        SELECT @msgError;
	END

END
GO
/****** Object:  StoredProcedure [dbo].[CRUD_Cancelaciones]    Script Date: 8/4/2023 15:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUD_Cancelaciones]
	@pIdCanc INT,
	@pIdReserva INT, 
	@pMotivo VARCHAR(100), 
	@pMomentoC DATETIME,
	@pOperacion VARCHAR(10)
AS
BEGIN

DECLARE @msgError VARCHAR(70);
SET @msgError = '';

	IF (@pIdCanc IS NOT NULL)
	BEGIN

		IF (@pOperacion = 'CREATE')
		BEGIN

			IF ((SELECT COUNT(*) FROM Reservaciones WHERE idReserva = @pIdReserva) = 0)
			BEGIN
				SET @msgError = 'No existe reservacion con ese id';
				SELECT @msgError;
			END

			IF (@pMotivo = '' OR @pMotivo IS NULL) 
			BEGIN
				SET @msgError = 'El motivo es inválido';
				SELECT @msgError;
			END

			IF (@pMomentoC IS NULL OR (SELECT DATEDIFF(DD, @pMomentoC, GETDATE())) < 0)
			BEGIN
				SET @msgError = 'El día y hora son inválidos';
				SELECT @msgError;
			END

			INSERT INTO Cancelaciones(idReserva, motivo, momentoCan)
			VALUES (@pIdReserva, @pMotivo, @pMomentoC);
		
		END



		IF (@pOperacion = 'READ')
		BEGIN

			IF ((SELECT COUNT(*) FROM Cancelaciones WHERE idCancelacion = @pIdCanc) = 0)
			BEGIN
				SET @msgError = 'La cancelacion no existe, no se puede realizar la busqueda';
				SELECT @msgError;
			END

			SELECT * FROM Cancelaciones WHERE idCancelacion = @pIdCanc;

		END



		IF (@pOperacion = 'UPDATE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM Cancelaciones WHERE idCancelacion = @pIdCanc) = 0)
			BEGIN
				SET @msgError = 'La cancelacion no existe, no se puede modificar';
				SELECT @msgError;
			END

			IF (@pIdReserva IS NOT NULL AND (SELECT COUNT(*) FROM Reservaciones WHERE idReserva = @pIdReserva) = 0)
			BEGIN
				SET @msgError = 'No existe reservacion con ese id';
				SELECT @msgError;
			END

			IF (@pMotivo = '') 
			BEGIN
				SET @msgError = 'El correo es inválido';
				SELECT @msgError;
			END

			UPDATE Cancelaciones
			SET idReserva = ISNULL(@pIdReserva, idReserva), motivo = ISNULL(@pMotivo, motivo), momentoCan = ISNULL(@pMomentoC, momentoCan)
			WHERE idCancelacion = @pIdCanc;

		END
        


		IF (@pOperacion = 'DELETE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM Cancelaciones WHERE idCancelacion = @pIdCanc) = 0)
			BEGIN
				SET @msgError = 'La cancelacion no existe, no se puede eliminar';
				SELECT @msgError;
			END

			DELETE FROM Cancelaciones
			WHERE idCancelacion = @pIdCanc;
			
		END


        
	ELSE
		SET @msgError = 'El id de cancelacion está vacío';
        SELECT @msgError;
	END

END
GO
/****** Object:  StoredProcedure [dbo].[CRUD_Confirmaciones]    Script Date: 8/4/2023 15:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUD_Confirmaciones]
	@pIdConf INT,
	@pIdReserva INT,
	@pMomentoC DATETIME,
	@pOperacion VARCHAR(10)
AS
BEGIN

DECLARE @msgError VARCHAR(70);
SET @msgError = '';

	IF (@pIdConf IS NOT NULL)
	BEGIN

		IF (@pOperacion = 'CREATE')
		BEGIN

			IF ((SELECT COUNT(*) FROM Reservaciones WHERE idReserva = @pIdReserva) = 0)
			BEGIN
				SET @msgError = 'No existe reservacion con ese id';
				SELECT @msgError;
			END

			IF (@pMomentoC IS NULL OR (SELECT DATEDIFF(DD, @pMomentoC, GETDATE())) < 0)
			BEGIN
				SET @msgError = 'El día y hora son inválidos';
				SELECT @msgError;
			END

			INSERT INTO Confirmaciones(idReserva, momentoCon)
			VALUES (@pIdReserva, @pMomentoC);
		
		END



		IF (@pOperacion = 'READ')
		BEGIN

			IF ((SELECT COUNT(*) FROM Confirmaciones WHERE idConfirma = @pIdConf) = 0)
			BEGIN
				SET @msgError = 'La confirmacion de reserva no existe, no se puede realizar la busqueda';
				SELECT @msgError;
			END

			SELECT * FROM Confirmaciones WHERE idConfirma = @pIdConf;

		END



		IF (@pOperacion = 'UPDATE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM Confirmaciones WHERE idConfirma = @pIdConf) = 0)
			BEGIN
				SET @msgError = 'La confirmacion de reserva no existe, no se puede modificar';
				SELECT @msgError;
			END

			IF (@pIdReserva IS NOT NULL AND (SELECT COUNT(*) FROM Reservaciones WHERE idReserva = @pIdReserva) = 0)
			BEGIN
				SET @msgError = 'No existe reservacion con ese id';
				SELECT @msgError;
			END

			UPDATE Confirmaciones
			SET idReserva = ISNULL(@pIdReserva, idReserva), momentoCon = ISNULL(@pMomentoC, momentoCon)
			WHERE idConfirma = @pIdConf;

		END
        


		IF (@pOperacion = 'DELETE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM Confirmaciones WHERE idConfirma = @pIdConf) = 0)
			BEGIN
				SET @msgError = 'La confirmacion de reserva no existe, no se puede eliminar';
				SELECT @msgError;
			END

			DELETE FROM Confirmaciones
			WHERE idConfirma = @pIdConf;
			
		END


        
	ELSE
		SET @msgError = 'El id de confirmacion está vacío';
        SELECT @msgError;
	END

END
GO
/****** Object:  StoredProcedure [dbo].[CRUD_Cubiculos]    Script Date: 8/4/2023 15:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUD_Cubiculos]
	@pNumCub INT, 
	@pCantPers INT, 
	@pServEsp BIT, 
	@pUbicacion VARCHAR(100), 
	@pIdEstado INT, 
	@pOperacion VARCHAR(10)
AS
BEGIN

DECLARE @msgError VARCHAR(70);
SET @msgError = '';

	IF (@pNumCub IS NOT NULL)
	BEGIN

		IF (@pOperacion = 'CREATE')
		BEGIN

			IF ((SELECT COUNT(*) FROM Cubiculos WHERE numCubiculo = @pNumCub) > 0)
			BEGIN
				SET @msgError = 'El numero de cubiculo ya existe';
				SELECT @msgError;
			END

			IF (@pCantPers <= 0 OR @pCantPers IS NULL)
			BEGIN
				SET @msgError = 'La cantidad de personas es inválida';
				SELECT @msgError;
			END

			IF (@pServEsp IS NULL)
			BEGIN
				SET @msgError = 'La accesibilidad indicada es inválida';
				SELECT @msgError;
			END

			IF (@pUbicacion = '' OR @pUbicacion IS NULL) 
			BEGIN
				SET @msgError = 'La ubicación es inválida';
				SELECT @msgError;
			END

			INSERT INTO Cubiculos(numCubiculo, idEstado, capacidad, servEsp, ubicacion)
			VALUES (@pNumCub, 1, @pCantPers, @pServEsp, @pUbicacion);
		
		END



		IF (@pOperacion = 'READ')
		BEGIN

			IF ((SELECT COUNT(*) FROM Cubiculos WHERE numCubiculo = @pNumCub) = 0)
			BEGIN
				SET @msgError = 'El cubiculo no existe, no se puede realizar la busqueda';
				SELECT @msgError;
			END

			SELECT * FROM Cubiculos WHERE numCubiculo = @pNumCub;

		END



		IF (@pOperacion = 'UPDATE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM Cubiculos WHERE numCubiculo = @pNumCub) = 0)
			BEGIN
				SET @msgError = 'El cubiculo no existe, no se puede realizar la busqueda';
				SELECT @msgError;
			END

			IF (@pCantPers <= 0)
			BEGIN
				SET @msgError = 'La cantidad de personas es inválida';
				SELECT @msgError;
			END

			IF (@pUbicacion = '')
			BEGIN
				SET @msgError = 'La ubicación es inválida';
				SELECT @msgError;
			END

			UPDATE Cubiculos
			SET numCubiculo = ISNULL(@pNumCub, numCubiculo), capacidad = ISNULL(@pCantPers, capacidad), servEsp = ISNULL(@pServEsp, servEsp), ubicacion= ISNULL(@pUbicacion, ubicacion), idEstado = ISNULL(@pIdEstado, idEstado)
			WHERE numCubiculo = @pNumCub;
		END
        


		IF (@pOperacion = 'DELETE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM Cubiculos WHERE numCubiculo = @pNumCub) = 0) 
			BEGIN
				SET @msgError = 'No se puede eliminar, el cubiculo no existe';
				SELECT @msgError;
			END

			IF ((SELECT COUNT(*) FROM Reservaciones WHERE numCubiculo = @pNumCub) > 0)
			BEGIN
				SET @msgError = 'No se puede eliminar, cubiculo asociado a reservaciones';
				SELECT @msgError;
			END

			DELETE FROM Cubiculos
			WHERE numCubiculo = @pNumCub;
			
		END


        
	ELSE
		SET @msgError = 'El numero de cubiculo es vacío';
        SELECT @msgError;
	END

END
GO
/****** Object:  StoredProcedure [dbo].[CRUD_EstadoCub]    Script Date: 8/4/2023 15:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUD_EstadoCub]
	@pIdEstCub INT, 
	@pDescr VARCHAR(50),
	@pOperacion VARCHAR(10)
AS
BEGIN

DECLARE @msgError VARCHAR(70);
SET @msgError = '';

	IF (@pIdEstCub IS NOT NULL)
	BEGIN

		IF (@pOperacion = 'CREATE')
		BEGIN

			IF (@pDescr = '' OR @pDescr IS NULL)
			BEGIN
				SET @msgError = 'La descripción es inválida';
				SELECT @msgError;
			END

			INSERT INTO EstadosCub(descripcion)
			VALUES (@pDescr);
		
		END



		IF (@pOperacion = 'READ')
		BEGIN

			IF ((SELECT COUNT(*) FROM EstadosCub WHERE idEstadoCub = @pIdEstCub) = 0)
			BEGIN
				SET @msgError = 'El estado de cubículo no existe, no se puede realizar la busqueda';
				SELECT @msgError;
			END

			SELECT * FROM EstadosCub WHERE idEstadoCub = @pIdEstCub;

		END



		IF (@pOperacion = 'UPDATE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM EstadosCub WHERE idEstadoCub = @pIdEstCub) = 0)
			BEGIN
				SET @msgError = 'El estado de cubículo no existe, no se puede modificar';
				SELECT @msgError;
			END

			IF (@pDescr = '')
			BEGIN
				SET @msgError = 'La descripcion es inválida';
				SELECT @msgError;
			END

			UPDATE EstadosCub
			SET descripcion = ISNULL(@pDescr, descripcion)
			WHERE idEstadoCub = @pIdEstCub;

		END
        


		IF (@pOperacion = 'DELETE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM EstadosCub WHERE idEstadoCub = @pIdEstCub) = 0)
			BEGIN
				SET @msgError = 'El estado de cubículo no existe, no se puede eliminar';
				SELECT @msgError;
			END

			IF ((SELECT COUNT(*) FROM Cubiculos WHERE idEstado = @pIdEstCub) > 0)
			BEGIN
				SET @msgError = 'No se puede eliminar, estado asociado a cubiculo';
				SELECT @msgError;
			END

			DELETE FROM EstadosCub
			WHERE idEstadoCub = @pIdEstCub;
			
		END
        
	ELSE
		SET @msgError = 'El id de estado de cubiculo es vacío';
        SELECT @msgError;
	END

END
GO
/****** Object:  StoredProcedure [dbo].[CRUD_EstadoEst]    Script Date: 8/4/2023 15:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUD_EstadoEst]
	@pIdEstEst INT, 
	@pDescr VARCHAR(50),
	@pOperacion VARCHAR(10)
AS
BEGIN

DECLARE @msgError VARCHAR(70);
SET @msgError = '';

	IF (@pIdEstEst IS NOT NULL)
	BEGIN

		IF (@pOperacion = 'CREATE')
		BEGIN

			IF (@pDescr = '' OR @pDescr IS NULL)
			BEGIN
				SET @msgError = 'La descripción es inválida';
				SELECT @msgError;
			END

			INSERT INTO EstadosEst(descripcion)
			VALUES (@pDescr);
		
		END



		IF (@pOperacion = 'READ')
		BEGIN

			IF ((SELECT COUNT(*) FROM EstadosEst WHERE idEstadoE = @pIdEstEst) = 0)
			BEGIN
				SET @msgError = 'El estado de estudiante no existe, no se puede realizar la busqueda';
				SELECT @msgError;
			END

			SELECT * FROM EstadosEst WHERE idEstadoE = @pIdEstEst;

		END



		IF (@pOperacion = 'UPDATE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM EstadosEst WHERE idEstadoE = @pIdEstEst) = 0)
			BEGIN
				SET @msgError = 'El estado de estudiante no existe, no se puede modificar';
				SELECT @msgError;
			END

			IF (@pDescr = '')
			BEGIN
				SET @msgError = 'La descripcion es inválida';
				SELECT @msgError;
			END

			UPDATE EstadosEst
			SET descripcion = ISNULL(@pDescr, descripcion)
			WHERE idEstadoE = @pIdEstEst;

		END
        


		IF (@pOperacion = 'DELETE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM EstadosEst WHERE idEstadoE = @pIdEstEst) = 0)
			BEGIN
				SET @msgError = 'El estado de estudiante no existe, no se puede eliminar';
				SELECT @msgError;
			END

			IF ((SELECT COUNT(*) FROM Estudiantes WHERE idEstadoE = @pIdEstEst) > 0)
			BEGIN
				SET @msgError = 'No se puede eliminar, estado asociado a estudiantes';
				SELECT @msgError;
			END

			DELETE FROM EstadosEst
			WHERE idEstadoE = @pIdEstEst;
			
		END
        
	ELSE
		SET @msgError = 'El id de estado de estudiante es vacío';
        SELECT @msgError;
	END

END
GO
/****** Object:  StoredProcedure [dbo].[CRUD_EstudEli]    Script Date: 8/4/2023 15:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUD_EstudEli]
	@pIdEstEl INT,
	@pNumCarnet INT, 
	@pMotivo VARCHAR(100), 
	@pFechaE DATE,
	@pOperacion VARCHAR(10)
AS
BEGIN

DECLARE @msgError VARCHAR(70);
SET @msgError = '';

	IF (@pIdEstEl IS NOT NULL)
	BEGIN

		IF (@pOperacion = 'CREATE')
		BEGIN

			IF ((SELECT COUNT(*) FROM Estudiantes WHERE numCarnet = @pNumCarnet) = 0)
			BEGIN
				SET @msgError = 'El estudiante no existe';
				SELECT @msgError;
			END

			IF (@pMotivo = '' OR @pMotivo IS NULL) 
			BEGIN
				SET @msgError = 'El motivo es inválido';
				SELECT @msgError;
			END

			IF (@pFechaE IS NULL) 
			BEGIN
				SET @msgError = 'La fecha es inválida';
				SELECT @msgError;
			END

			INSERT INTO Estud_Eliminados(numCarnet,motivo,fechaE)
			VALUES (@pNumCarnet, @pMotivo, @pFechaE);
		
		END



		IF (@pOperacion = 'READ')
		BEGIN

			IF ((SELECT COUNT(*) FROM Estud_Eliminados WHERE idEstEl = @pIdEstEl) = 0)
			BEGIN
				SET @msgError = 'El estudiante eliminado no existe, no se puede realizar la busqueda';
				SELECT @msgError;
			END

			SELECT * FROM Estud_Eliminados WHERE idEstEl = @pIdEstEl;

		END



		IF (@pOperacion = 'UPDATE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM Estud_Eliminados WHERE idEstEl = @pIdEstEl) = 0)
			BEGIN
				SET @msgError = 'El estudiante eliminado no existe, no se puede modificar';
				SELECT @msgError;
			END

			IF (@pNumCarnet IS NOT NULL AND ((SELECT COUNT(*) FROM Estudiantes WHERE numCarnet = @pNumCarnet) = 0))
			BEGIN
				SET @msgError = 'El estudiante no existe';
				SELECT @msgError;
			END

			IF (@pMotivo = '') 
			BEGIN
				SET @msgError = 'El motivo es inválido';
				SELECT @msgError;
			END

			UPDATE Estud_Eliminados
			SET numCarnet = ISNULL(@pNumCarnet, numCarnet), motivo = ISNULL(@pMotivo, motivo), fechaE = ISNULL(@pFechaE, fechaE)
			WHERE idEstEl = @pIdEstEl;

		END
        


		IF (@pOperacion = 'DELETE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM Estud_Eliminados WHERE idEstEl = @pIdEstEl) = 0)
			BEGIN
				SET @msgError = 'El estudiante eliminado no existe, no se puede eliminar';
				SELECT @msgError;
			END

			DELETE FROM Estud_Eliminados
			WHERE idEstEl = @pIdEstEl;
			
		END


        
	ELSE
		SET @msgError = 'El id de estudiante eliminado está vacío';
        SELECT @msgError;
	END

END
GO
/****** Object:  StoredProcedure [dbo].[CRUD_Estudiantes]    Script Date: 8/4/2023 15:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUD_Estudiantes]
	@pNumCarnet INT,
	@pIdEstadoE INT, 
	@pCorreo VARCHAR(50), 
	@pContra VARCHAR(50),
	@pIdServEsp INT,
	@pIdentPers INT,
	@pOperacion VARCHAR(10)
AS
BEGIN

DECLARE @msgError VARCHAR(70);
SET @msgError = '';

	IF (@pNumCarnet IS NOT NULL)
	BEGIN

		IF (@pOperacion = 'CREATE')
		BEGIN

			IF (@pCorreo = '' OR @pCorreo IS NULL) 
			BEGIN
				SET @msgError = 'El correo es inválido';
				SELECT @msgError;
			END

			IF (@pContra = '' OR @pContra IS NULL OR (LEN(@pContra) < 10)) 
			BEGIN
				SET @msgError = 'La contraseña es inválida';
				SELECT @msgError;
			END

			IF ((SELECT COUNT(*) FROM TiposServEsp WHERE idServEsp = @pIdServEsp) = 0)
			BEGIN
				SET @msgError = 'No existe ese tipo de servicios especiales';
				SELECT @msgError;
			END

			IF ((SELECT COUNT(*) FROM Personas WHERE identPers = @pIdentPers) = 0)
			BEGIN
				SET @msgError = 'No existe persona registrada con esa identificación';
				SELECT @msgError;
			END

			INSERT INTO Estudiantes(idEstadoE, correoElec, contraseña, idServEsp, identPers)
			VALUES (1, @pCorreo, @pContra, @pIdServEsp, @pIdentPers);
		
		END



		IF (@pOperacion = 'READ')
		BEGIN

			IF ((SELECT COUNT(*) FROM Estudiantes WHERE numCarnet = @pNumCarnet) = 0)
			BEGIN
				SET @msgError = 'El estudiante no existe, no se puede realizar la busqueda';
				SELECT @msgError;
			END

			SELECT * FROM Estudiantes WHERE numCarnet = @pNumCarnet;

		END



		IF (@pOperacion = 'UPDATE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM Estudiantes WHERE numCarnet = @pNumCarnet) = 0)
			BEGIN
				SET @msgError = 'El estudiante no existe, no se puede modificar';
				SELECT @msgError;
			END

			IF (@pIdEstadoE IS NOT NULL AND (SELECT COUNT(*) FROM EstadosEst WHERE idEstadoE = @pIdEstadoE) = 0)
			BEGIN
				SET @msgError = 'El estado de estudiante no existe';
				SELECT @msgError;
			END

			IF (@pCorreo = '') 
			BEGIN
				SET @msgError = 'El correo es inválido';
				SELECT @msgError;
			END

			IF (@pContra = '') 
			BEGIN
				SET @msgError = 'La contraseña es inválida';
				SELECT @msgError;
			END

			IF (@pIdServEsp IS NOT NULL AND (SELECT COUNT(*) FROM TiposServEsp WHERE idServEsp = @pIdServEsp) = 0)
			BEGIN
				SET @msgError = 'El tipo de servicio especial no existe';
				SELECT @msgError;
			END

			IF (@pIdentPers IS NOT NULL AND (SELECT COUNT(*) FROM Personas WHERE identPers = @pIdentPers) = 0)
			BEGIN
				SET @msgError = 'No existe persona registrada asociada a esa identificacion';
				SELECT @msgError;
			END

			UPDATE Estudiantes
			SET idEstadoE = ISNULL(@pIdEstadoE, idEstadoE), correoElec = ISNULL(@pCorreo, correoElec), contraseña = ISNULL(@pContra, contraseña), idServEsp = ISNULL(@pIdServEsp, idServEsp), identPers = ISNULL(@pIdentPers, identPers)
			WHERE numCarnet = @pNumCarnet;

		END
        


		IF (@pOperacion = 'DELETE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM Estudiantes WHERE numCarnet = @pNumCarnet) = 0)
			BEGIN
				SET @msgError = 'El estudiante no existe, no se puede eliminar';
				SELECT @msgError;
			END

			IF ((SELECT COUNT(*) FROM Estud_Eliminados WHERE numCarnet = @pNumCarnet) = 0)
			BEGIN
				SET @msgError = 'No se puede eliminar, estudiante ya fue eliminado';
				SELECT @msgError;
			END

			IF ((SELECT COUNT(*) FROM Reservaciones WHERE numCarnet = @pNumCarnet) = 0)
			BEGIN
				SET @msgError = 'El estudiante está asociado a reservaciones, no se puede eliminar';
				SELECT @msgError;
			END

			DELETE FROM Estudiantes
			WHERE numCarnet = @pNumCarnet;
			
		END


        
	ELSE
		SET @msgError = 'El numero de carnet está vacío';
        SELECT @msgError;
	END

END
GO
/****** Object:  StoredProcedure [dbo].[CRUD_Personas]    Script Date: 8/4/2023 15:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUD_Personas]
	@pIdentPers INT, 
	@pNombre VARCHAR(50), 
	@pApel1 VARCHAR(50), 
	@pApel2 VARCHAR(50), 
	@pFechaNac DATE,
	@pOperacion VARCHAR(10)
AS
BEGIN

DECLARE @msgError VARCHAR(70);
SET @msgError = '';

	IF (@pIdentPers IS NOT NULL)
	BEGIN

		IF (@pOperacion = 'CREATE')
		BEGIN

			IF ((SELECT COUNT(*) FROM Personas WHERE identPers = @pIdentPers) > 0)
			BEGIN
				SET @msgError = 'Ya existe una persona registrada con esa identificación';
				SELECT @msgError;
			END

			IF (@pNombre = '' OR @pNombre IS NULL) 
			BEGIN
				SET @msgError = 'El nombre es inválido';
				SELECT @msgError;
			END

			IF (@pApel1 = '' OR @pApel1 IS NULL) 
			BEGIN
				SET @msgError = 'El primer apellido es inválido';
				SELECT @msgError;
			END

			IF (@pApel2 = '' OR @pApel2 IS NULL) 
			BEGIN
				SET @msgError = 'El segundo apellido es inválido';
				SELECT @msgError;
			END

			IF (@pFechaNac IS NULL OR (SELECT DATEDIFF(YEAR, '1953/01/01', @pFechaNac)) > 70) 
			BEGIN
				SET @msgError = 'La fecha de nacimineto es inválida';
				SELECT @msgError;
			END

			INSERT INTO Personas(identPers, nombre, apel1, apel2, fechaNaci)
			VALUES (@pIdentPers, @pNombre, @pApel1, @pApel2, @pFechaNac);
		
		END



		IF (@pOperacion = 'READ')
		BEGIN

			IF ((SELECT COUNT(*) FROM Personas WHERE identPers = @pIdentPers) = 0)
			BEGIN
				SET @msgError = 'La persona no existe, no se puede realizar la busqueda';
				SELECT @msgError;
			END

			SELECT * FROM Personas WHERE identPers = @pIdentPers;

		END



		IF (@pOperacion = 'UPDATE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM Personas WHERE identPers = @pIdentPers) = 0)
			BEGIN
				SET @msgError = 'La persona no existe, no se puede modificar';
				SELECT @msgError;
			END

			IF (@pNombre = '') 
			BEGIN
				SET @msgError = 'El nombre es inválido';
				SELECT @msgError;
			END

			IF (@pApel1 = '') 
			BEGIN
				SET @msgError = 'El primer apellido es inválido';
				SELECT @msgError;
			END

			IF (@pApel2 = '') 
			BEGIN
				SET @msgError = 'El segundo apellido es inválido';
				SELECT @msgError;
			END

			IF ((SELECT DATEDIFF(YEAR, '1953/01/01', @pFechaNac)) > 70) 
			BEGIN
				SET @msgError = 'La fecha de nacimineto es inválida';
				SELECT @msgError;
			END

			UPDATE Personas
			SET nombre = ISNULL(@pNombre, nombre), apel1 = ISNULL(@pApel1, apel1), apel2 = ISNULL(@pApel2, apel2), fechaNaci = ISNULL(@pFechaNac, fechaNaci)
			WHERE identPers = @pIdentPers;

		END
        


		IF (@pOperacion = 'DELETE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM Personas WHERE identPers = @pIdentPers) = 0)
			BEGIN
				SET @msgError = 'La persona no existe, no se puede eliminar';
				SELECT @msgError;
			END

			IF ((SELECT COUNT(*) FROM Estudiantes WHERE identPers = @pIdentPers) > 0)
			BEGIN
				SET @msgError = 'No se puede eliminar, persona asociada a estudiante';
				SELECT @msgError;
			END

			IF ((SELECT COUNT(*) FROM Administradores WHERE identPers = @pIdentPers) > 0)
			BEGIN
				SET @msgError = 'No se puede eliminar, persona asociada a administrador';
				SELECT @msgError;
			END

			DELETE FROM Personas
			WHERE identPers = @pIdentPers;
			
		END


        
	ELSE
		SET @msgError = 'La identificacion personl es vacía';
        SELECT @msgError;
	END

END
GO
/****** Object:  StoredProcedure [dbo].[CRUD_Reservaciones]    Script Date: 8/4/2023 15:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUD_Reservaciones]
	@pIdReserva INT, 
	@pNumCubi INT,
	@pNumCarnet INT,
	@pFechaR DATE,
	@pHInicio TIME(7),
	@pHFinal TIME(7),
	@pOperacion VARCHAR(10)
AS
BEGIN

DECLARE @msgError VARCHAR(70);
SET @msgError = '';

	IF (@pIdReserva IS NOT NULL)
	BEGIN

		IF (@pOperacion = 'CREATE')
		BEGIN

			IF ((SELECT COUNT(*) FROM Cubiculos WHERE numCubiculo = @pNumCubi) = 0)
			BEGIN
				SET @msgError = 'No existe el cubiculo ingresado';
				SELECT @msgError;
			END

			IF ((SELECT COUNT(*) FROM Estudiantes WHERE numCarnet = @pNumCarnet) = 0)
			BEGIN
				SET @msgError = 'No existe el estudiante ingresado';
				SELECT @msgError;
			END

			IF (@pFechaR IS NULL OR (SELECT DATEDIFF(DAY, GETDATE() , @pFechaR)) < 0) 
			BEGIN
				SET @msgError = 'La fecha de reserva es inválida';
				SELECT @msgError;
			END

			IF (@pHInicio IS NULL OR DATEPART(HH,@pHInicio) < 7 OR DATEPART(HH,@pHInicio) > 20) 
			BEGIN
				SET @msgError = 'La hora de inicio es inválida';
				SELECT @msgError;
			END

			IF (@pHFinal IS NULL OR DATEPART(HH,@pHFinal) < 7 OR DATEPART(HH,@pHFinal) > 20) 
			BEGIN
				SET @msgError = 'La hora de inicio es inválida';
				SELECT @msgError;
			END

			IF (DATEDIFF(HH, @pHInicio, @pHFinal)<=0)
			BEGIN
				SET @msgError = 'La hora de finalizacion debe ser mayor que la de inicio';
				SELECT @msgError;
			END

			INSERT INTO Reservaciones(numCubiculo, numCarnet, fechaReserv, horaInicio, horaFinal)
			VALUES (@pNumCubi, @pNumCarnet, @pFechaR, @pHInicio, @pHFinal);
		
		END



		IF (@pOperacion = 'READ')
		BEGIN

			IF ((SELECT COUNT(*) FROM Reservaciones WHERE idReserva = @pIdReserva) = 0)
			BEGIN
				SET @msgError = 'La reserva no existe, no se puede realizar la busqueda';
				SELECT @msgError;
			END

			SELECT * FROM Reservaciones WHERE idReserva = @pIdReserva;

		END



		IF (@pOperacion = 'UPDATE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM Reservaciones WHERE idReserva = @pIdReserva) = 0)
			BEGIN
				SET @msgError = 'La reserva no existe, no se puede modificar';
				SELECT @msgError;
			END

			IF (@pNumCubi IS NOT NULL AND (SELECT COUNT(*) FROM Cubiculos WHERE numCubiculo = @pNumCubi) = 0)
			BEGIN
				SET @msgError = 'No existe el cubiculo ingresado';
				SELECT @msgError;
			END

			IF (@pNumCarnet IS NOT NULL AND (SELECT COUNT(*) FROM Estudiantes WHERE numCarnet = @pNumCarnet) = 0)
			BEGIN
				SET @msgError = 'No existe el estdiante ingresado';
				SELECT @msgError;
			END

			IF (@pFechaR IS NOT NULL AND (SELECT DATEDIFF(DAY, GETDATE() , @pFechaR)) < 0) 
			BEGIN
				SET @msgError = 'La fecha de reserva es inválida';
				SELECT @msgError;
			END

			IF (@pHInicio IS NOT NULL AND (DATEPART(HH,@pHInicio) < 7 OR DATEPART(HH,@pHInicio) > 20)) 
			BEGIN
				SET @msgError = 'La hora de inicio es inválida';
				SELECT @msgError;
			END

			IF (@pHFinal IS NOT NULL AND (DATEPART(HH,@pHFinal) < 7 OR DATEPART(HH,@pHFinal) > 20))
			BEGIN
				SET @msgError = 'La hora de inicio es inválida';
				SELECT @msgError;
			END

			IF (@pHInicio IS NOT NULL AND @pHFinal IS NOT NULL AND DATEDIFF(HH, @pHInicio, @pHFinal)<=0)
			BEGIN
				SET @msgError = 'La hora de finalizacion debe ser mayor que la de inicio';
				SELECT @msgError;
			END

			UPDATE Reservaciones
			SET numCubiculo = ISNULL(@pNumCubi, numCubiculo), numCarnet = ISNULL(@pNumCarnet, numCarnet), fechaReserv = ISNULL(@pFechaR, fechaReserv), horaInicio = ISNULL(@pHInicio, horaInicio), horaFinal = ISNULL(@pHFinal, horaFinal)
			WHERE idReserva = @pIdReserva;

		END
        


		IF (@pOperacion = 'DELETE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM Reservaciones WHERE idReserva = @pIdReserva) = 0)
			BEGIN
				SET @msgError = 'La reserva no existe, no se puede eliminar';
				SELECT @msgError;
			END

			IF ((SELECT COUNT(*) FROM Confirmaciones WHERE idReserva = @pIdReserva) = 0)
			BEGIN
				SET @msgError = 'No se puede eliminar, reservacion asociada a confirmacion';
				SELECT @msgError;
			END

			IF ((SELECT COUNT(*) FROM Cancelaciones WHERE idReserva = @pIdReserva) = 0)
			BEGIN
				SET @msgError = 'No se puede eliminar, reservacion asociada a cancelacion ';
				SELECT @msgError;
			END

			DELETE FROM Reservaciones 
			WHERE idReserva = @pIdReserva;
			
		END


        
	ELSE
		SET @msgError = 'El id de reservación está vacío';
        SELECT @msgError;
	END

END
GO
/****** Object:  StoredProcedure [dbo].[CRUD_TipServEsp]    Script Date: 8/4/2023 15:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CRUD_TipServEsp]
	@pIdServEsp INT, 
	@pDescr VARCHAR(50),
	@pOperacion VARCHAR(10)
AS
BEGIN

DECLARE @msgError VARCHAR(70);
SET @msgError = '';

	IF (@pIdServEsp IS NOT NULL)
	BEGIN

		IF (@pOperacion = 'CREATE')
		BEGIN

			IF (@pDescr = '' OR @pDescr IS NULL)
			BEGIN
				SET @msgError = 'La descripción es inválida';
				SELECT @msgError;
			END

			INSERT INTO TiposServEsp(descripcion)
			VALUES (@pDescr);
		
		END



		IF (@pOperacion = 'READ')
		BEGIN

			IF ((SELECT COUNT(*) FROM TiposServEsp WHERE idServEsp = @pIdServEsp) = 0)
			BEGIN
				SET @msgError = 'El tipo de servicio especial no existe, no se puede realizar la busqueda';
				SELECT @msgError;
			END

			SELECT * FROM TiposServEsp WHERE idServEsp = @pIdServEsp;

		END



		IF (@pOperacion = 'UPDATE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM TiposServEsp WHERE idServEsp = @pIdServEsp) = 0)
			BEGIN
				SET @msgError = 'El tipo de servicio especial no existe, no se puede modificar';
				SELECT @msgError;
			END

			IF (@pDescr = '')
			BEGIN
				SET @msgError = 'La descripcion es inválida';
				SELECT @msgError;
			END

			UPDATE TiposServEsp
			SET descripcion = ISNULL(@pDescr, descripcion)
			WHERE idServEsp = @pIdServEsp;

		END
        


		IF (@pOperacion = 'DELETE') 
		BEGIN

			IF ((SELECT COUNT(*) FROM TiposServEsp WHERE idServEsp = @pIdServEsp) = 0)
			BEGIN
				SET @msgError = 'El tipo de servicio especial no existe, no se puede eliminar';
				SELECT @msgError;
			END

			IF ((SELECT COUNT(*) FROM Cubiculos WHERE servEsp = @pIdServEsp) > 0)
			BEGIN
				SET @msgError = 'No se puede eliminar, servicio especial asociado a cubiculo';
				SELECT @msgError;
			END

			DELETE FROM TiposServEsp
			WHERE idServEsp = @pIdServEsp;
			
		END
        
	ELSE
		SET @msgError = 'El id de servicio especial es vacío';
        SELECT @msgError;
	END

END
GO
/****** Object:  StoredProcedure [dbo].[sp_BuscarCubiculosDisponibles]    Script Date: 8/4/2023 15:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_BuscarCubiculosDisponibles]
    @fecha_reservacion DATE,
    @hora_inicio TIME,
    @hora_fin TIME,
    @capacidad INT = NULL,
    @servicio_especial INT = NULL
AS
BEGIN
    SELECT c.numCubiculo, c.capacidad, c.servEsp
    FROM Cubiculos c
    WHERE c.idEstado = 1 -- Estado disponible
        AND c.capacidad >= ISNULL(@capacidad, 0)
        AND c.servEsp = ISNULL(@servicio_especial, c.servEsp)
        AND c.numCubiculo NOT IN (
            SELECT r.numCubiculo
            FROM Reservaciones r
            WHERE r.fechaReserv = @fecha_reservacion
                AND (
                    (@hora_inicio BETWEEN r.horaInicio AND r.horaFinal)
                    OR (@hora_fin BETWEEN r.horaInicio AND r.horaFinal)
                    OR (r.horaInicio BETWEEN @hora_inicio AND @hora_fin)
                    OR (r.horaFinal BETWEEN @hora_inicio AND @hora_fin)
                )
        )
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetCubiculos]    Script Date: 8/4/2023 15:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCubiculos]
AS
BEGIN

	SELECT * FROM Cubiculos

END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarCubiculo]    Script Date: 8/4/2023 15:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RegistrarCubiculo]
    @numCubiculo int,
    @cantPersonas int,
    @accesible bit,
    @ubicacion varchar(100)
AS
BEGIN
    INSERT INTO Cubiculos(numCubiculo, idEstado, capacidad, servEsp)
    VALUES (@numCubiculo, 1, @cantPersonas, @accesible);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarUsuario]    Script Date: 8/4/2023 15:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RegistrarUsuario]
    @numCarnet varchar(50),
    @nombre varchar(50),
    @apellido1 varchar(50),
    @apellido2 varchar(50),
    @fechaNaci datetime,
    @correoElec varchar(50),
    @contraseña varchar(50)
AS
BEGIN
    INSERT INTO Personas (identPers, nombre, apel1, apel2, fechaNaci)
    VALUES (@numCarnet, @nombre, @apellido1, @apellido2, @fechaNaci);

    INSERT INTO Estudiantes (numCarnet, idEstadoE, correoElec, contraseña)
    VALUES (@numCarnet, 1, @correoElec, @contraseña);
END;

GO
USE [master]
GO
ALTER DATABASE [BiblioTEC] SET  READ_WRITE 
GO
