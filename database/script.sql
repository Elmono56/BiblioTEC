USE [master]
GO
/****** Object:  Database [BiblioTEC]    Script Date: 13/04/2023 10:43:22 p. m. ******/
CREATE DATABASE [BiblioTEC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BiblioTEC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BiblioTEC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BiblioTEC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BiblioTEC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
EXEC sys.sp_db_vardecimal_storage_format N'BiblioTEC', N'ON'
GO
ALTER DATABASE [BiblioTEC] SET QUERY_STORE = OFF
GO
USE [BiblioTEC]
GO
/****** Object:  Table [dbo].[Administradores]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administradores](
	[idAdministrador] [int] IDENTITY(1,1) NOT NULL,
	[identUsuario] [int] NOT NULL,
	[correoITCR] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Administradores_1] PRIMARY KEY CLUSTERED 
(
	[idAdministrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cubiculos]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cubiculos](
	[idCubiculo] [int] IDENTITY(1,1) NOT NULL,
	[idEstado] [int] NOT NULL,
	[capacidad] [int] NOT NULL,
	[servEsp] [int] NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[tiempoDeUsoMaximo] [int] NULL,
 CONSTRAINT [PK_Cubiculos] PRIMARY KEY CLUSTERED 
(
	[idCubiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoEstudiante]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoEstudiante](
	[id] [int] NOT NULL,
	[Descripcion] [varchar](128) NOT NULL,
 CONSTRAINT [PK_EstadoEstudiante] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoReserva]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoReserva](
	[id] [int] NOT NULL,
	[Descripcion] [varchar](128) NOT NULL,
 CONSTRAINT [PK_estadoReserva] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadosCubiculos]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadosCubiculos](
	[idEstadoCub] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EstadosCub] PRIMARY KEY CLUSTERED 
(
	[idEstadoCub] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiantes]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiantes](
	[idEstudiante] [int] IDENTITY(1,1) NOT NULL,
	[idEstadoEstudiantes] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[correoITCR] [varchar](128) NOT NULL,
	[apellido1] [varchar](128) NOT NULL,
	[apellido2] [varchar](128) NOT NULL,
	[nombre] [varchar](128) NOT NULL,
	[carnet] [int] NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[contrasena] [varchar](128) NOT NULL,
	[cedula] [int] NOT NULL,
 CONSTRAINT [PK_Estudiantes_1] PRIMARY KEY CLUSTERED 
(
	[idEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservaciones]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservaciones](
	[idReserva] [int] IDENTITY(1,1) NOT NULL,
	[idCubiculo] [int] NOT NULL,
	[numCarnet] [int] NOT NULL,
	[fechaReserv] [date] NOT NULL,
	[horaInicio] [time](7) NOT NULL,
	[horaFinal] [time](7) NOT NULL,
	[capacidad] [int] NOT NULL,
	[servEsp] [int] NOT NULL,
	[estadoReserva] [int] NOT NULL,
 CONSTRAINT [PK_Reservaciones] PRIMARY KEY CLUSTERED 
(
	[idReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposUsuarios]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposUsuarios](
	[id] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TiposUsuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[contrasena] [varchar](128) NOT NULL,
	[idTipoUsuario] [int] NOT NULL,
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[correoITCR] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administradores] ON 

INSERT [dbo].[Administradores] ([idAdministrador], [identUsuario], [correoITCR]) VALUES (1, 2, N'admin@gmail.com')
SET IDENTITY_INSERT [dbo].[Administradores] OFF
GO
SET IDENTITY_INSERT [dbo].[Cubiculos] ON 

INSERT [dbo].[Cubiculos] ([idCubiculo], [idEstado], [capacidad], [servEsp], [Nombre], [tiempoDeUsoMaximo]) VALUES (1, 2, 3, 1, N'C-01', 4)
SET IDENTITY_INSERT [dbo].[Cubiculos] OFF
GO
INSERT [dbo].[EstadoEstudiante] ([id], [Descripcion]) VALUES (1, N'Activo')
INSERT [dbo].[EstadoEstudiante] ([id], [Descripcion]) VALUES (2, N'Inactivo')
GO
INSERT [dbo].[EstadoReserva] ([id], [Descripcion]) VALUES (1, N'Confirmado')
INSERT [dbo].[EstadoReserva] ([id], [Descripcion]) VALUES (2, N'Cancelado')
INSERT [dbo].[EstadoReserva] ([id], [Descripcion]) VALUES (3, N'En espera')
GO
SET IDENTITY_INSERT [dbo].[EstadosCubiculos] ON 

INSERT [dbo].[EstadosCubiculos] ([idEstadoCub], [descripcion]) VALUES (1, N'Libre')
INSERT [dbo].[EstadosCubiculos] ([idEstadoCub], [descripcion]) VALUES (2, N'Ocupado')
INSERT [dbo].[EstadosCubiculos] ([idEstadoCub], [descripcion]) VALUES (3, N'Mantenimiento')
INSERT [dbo].[EstadosCubiculos] ([idEstadoCub], [descripcion]) VALUES (4, N'Bloqueado')
SET IDENTITY_INSERT [dbo].[EstadosCubiculos] OFF
GO
SET IDENTITY_INSERT [dbo].[Estudiantes] ON 

INSERT [dbo].[Estudiantes] ([idEstudiante], [idEstadoEstudiantes], [idUsuario], [correoITCR], [apellido1], [apellido2], [nombre], [carnet], [fechaNacimiento], [contrasena], [cedula]) VALUES (2, 2, 1, N'example@itcr.ac.cr', N'Doe', N'Smith', N'John', 2022000000, CAST(N'2003-01-01' AS Date), N'new_password', 12345)
SET IDENTITY_INSERT [dbo].[Estudiantes] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservaciones] ON 

INSERT [dbo].[Reservaciones] ([idReserva], [idCubiculo], [numCarnet], [fechaReserv], [horaInicio], [horaFinal], [capacidad], [servEsp], [estadoReserva]) VALUES (3, 1, 123456789, CAST(N'2023-05-01' AS Date), CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 20, 1, 1)
SET IDENTITY_INSERT [dbo].[Reservaciones] OFF
GO
INSERT [dbo].[TiposUsuarios] ([id], [Descripcion]) VALUES (1, N'Estudiante')
INSERT [dbo].[TiposUsuarios] ([id], [Descripcion]) VALUES (2, N'Administrador')
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([contrasena], [idTipoUsuario], [idUsuario], [correoITCR]) VALUES (N'1234', 1, 1, N'estudiante@gmail.com')
INSERT [dbo].[Usuarios] ([contrasena], [idTipoUsuario], [idUsuario], [correoITCR]) VALUES (N'1234', 2, 2, N'admin@gmail.com')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Administradores]  WITH CHECK ADD  CONSTRAINT [FK_Administradores_Usuarios] FOREIGN KEY([identUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Administradores] CHECK CONSTRAINT [FK_Administradores_Usuarios]
GO
ALTER TABLE [dbo].[Cubiculos]  WITH CHECK ADD  CONSTRAINT [FK_Cubiculos_EstadosCub] FOREIGN KEY([idEstado])
REFERENCES [dbo].[EstadosCubiculos] ([idEstadoCub])
GO
ALTER TABLE [dbo].[Cubiculos] CHECK CONSTRAINT [FK_Cubiculos_EstadosCub]
GO
ALTER TABLE [dbo].[Estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_Estudiantes_EstadoEstudiante] FOREIGN KEY([idEstadoEstudiantes])
REFERENCES [dbo].[EstadoEstudiante] ([id])
GO
ALTER TABLE [dbo].[Estudiantes] CHECK CONSTRAINT [FK_Estudiantes_EstadoEstudiante]
GO
ALTER TABLE [dbo].[Estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_Estudiantes_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Estudiantes] CHECK CONSTRAINT [FK_Estudiantes_Usuarios]
GO
ALTER TABLE [dbo].[Reservaciones]  WITH CHECK ADD  CONSTRAINT [FK_Reservaciones_Cubiculos] FOREIGN KEY([idCubiculo])
REFERENCES [dbo].[Cubiculos] ([idCubiculo])
GO
ALTER TABLE [dbo].[Reservaciones] CHECK CONSTRAINT [FK_Reservaciones_Cubiculos]
GO
ALTER TABLE [dbo].[Reservaciones]  WITH CHECK ADD  CONSTRAINT [FK_Reservaciones_estadoReserva] FOREIGN KEY([estadoReserva])
REFERENCES [dbo].[EstadoReserva] ([id])
GO
ALTER TABLE [dbo].[Reservaciones] CHECK CONSTRAINT [FK_Reservaciones_estadoReserva]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_TiposUsuarios] FOREIGN KEY([idTipoUsuario])
REFERENCES [dbo].[TiposUsuarios] ([id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_TiposUsuarios]
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarCubiculos]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConsultarCubiculos]
AS
BEGIN
    SELECT [idCubiculo],[Nombre],[idEstado],[capacidad],[servEsp],[tiempoDeUsoMaximo] FROM Cubiculos;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarCubiculo]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarCubiculo]
    @idCubiculo INT,
    @Result INT OUTPUT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Cubiculos WHERE idCubiculo = @idCubiculo)
    BEGIN
        SET @Result = 2; -- Cubicle does not exist
    END
    ELSE
    BEGIN
        DELETE FROM Cubiculos
        WHERE idCubiculo = @idCubiculo;
        
        SET @Result = 1; -- Success
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarEstudiante]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarEstudiante]
    @idEstudiante INT,
    @Result INT OUTPUT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Estudiantes WHERE idEstudiante = @idEstudiante)
    BEGIN
        SET @Result = 2; -- Student does not exist
    END
    ELSE
    BEGIN
        DELETE FROM Estudiantes
        WHERE idEstudiante = @idEstudiante;
        
        SET @Result = 1; -- Success
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarReserva]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarReserva]
    @idReserva INT,
    @existeReserva INT OUTPUT
AS
BEGIN
    IF EXISTS (SELECT * FROM reservaciones WHERE idReserva = @idReserva)
    BEGIN
        DELETE FROM reservaciones WHERE idReserva = @idReserva
        SET @existeReserva = 1
    END
    ELSE
    BEGIN
        SET @existeReserva = 2
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarCubiculo]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarCubiculo]
    @idCubiculo INT,
    @idEstado INT,
    @capacidad INT,
    @servEsp INT,
    @Nombre VARCHAR(50),
    @Result INT OUTPUT
AS
BEGIN
    IF EXISTS (SELECT * FROM Cubiculos WHERE idCubiculo = @idCubiculo)
    BEGIN
        SET @Result = 2; -- Cubicle already exists
    END
    ELSE
    BEGIN
        INSERT INTO Cubiculos (idCubiculo, idEstado, capacidad, servEsp, Nombre)
        VALUES (@idCubiculo, @idEstado, @capacidad, @servEsp, @Nombre);
        
        SET @Result = 1; -- Success
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarCubiculoPorID]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModificarCubiculoPorID]
    @idCubiculo INT,
    @Nombre VARCHAR(50),
    @idEstado INT,
    @capacidad INT,
    @servEsp INT,
    @Result INT OUTPUT
AS
BEGIN
    IF EXISTS (SELECT * FROM Cubiculos WHERE idCubiculo = @idCubiculo)
    BEGIN
        UPDATE Cubiculos
        SET Nombre = @Nombre,
            idEstado = @idEstado,
            capacidad = @capacidad,
            servEsp = @servEsp
        WHERE idCubiculo = @idCubiculo;

        SET @Result = 1; -- Success
    END
    ELSE
    BEGIN
        SET @Result = 2; -- Cubicle not found
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarEstadosCubiculosPorID]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModificarEstadosCubiculosPorID]
    @idCubiculo INT,
    @idEstado INT,
	@tiempoDeUsoMaximo INT,
    @Result INT OUTPUT
AS
BEGIN
    IF EXISTS (SELECT * FROM Cubiculos WHERE idCubiculo = @idCubiculo)
    BEGIN
        UPDATE Cubiculos
            SET idEstado = @idEstado,
			tiempoDeUsoMaximo = @tiempoDeUsoMaximo

        WHERE idCubiculo = @idCubiculo;

        SET @Result = 1; -- Success
    END
    ELSE
    BEGIN
        SET @Result = 2; -- Cubicle not found
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarEstudiantePorID]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModificarEstudiantePorID]
    @idEstudiante INT,
    @idEstadoEstudiantes INT,
    @correoITCR VARCHAR(128),
    @apellido1 VARCHAR(128),
    @apellido2 VARCHAR(128),
    @nombre VARCHAR(128),
    @carnet VARCHAR(128),
    @fechaNacimiento DATE,
    @contrasena VARCHAR(128),
    @Result INT OUTPUT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Estudiantes WHERE idEstudiante = @idEstudiante)
    BEGIN
        SET @Result = 2; -- Student does not exist
    END
    ELSE
    BEGIN
        UPDATE Estudiantes
        SET idEstadoEstudiantes = @idEstadoEstudiantes,
            correoITCR = @correoITCR,
            apellido1 = @apellido1,
            apellido2 = @apellido2,
            nombre = @nombre,
            carnet = @carnet,
            fechaNacimiento = @fechaNacimiento,
            contrasena = @contrasena
        WHERE idEstudiante = @idEstudiante;

        SET @Result = 1; -- Success
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarReserva]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModificarReserva]
    @idReserva INT,
    @carnet INT,
    @fechaReserv DATE,
    @horaInicio TIME,
    @horaFinal TIME,
    @capacidad INT,
    @servEsp INT,
    @estadoReserva INT,
    @Result INT OUTPUT
AS
BEGIN
    -- Verificar si la reserva existe
    IF EXISTS (SELECT * FROM reservaciones WHERE idReserva = @idReserva)
    BEGIN
        -- Modificar los atributos de la reserva
        UPDATE reservaciones SET
            numCarnet = @carnet,
            fechaReserv = @fechaReserv,
            horaInicio = @horaInicio,
            horaFinal = @horaFinal,
            capacidad = @capacidad,
            servEsp = @servEsp,
            estadoReserva = @estadoReserva
        WHERE idReserva = @idReserva
        -- Indicar que la reserva fue modificada correctamente
        SET @Result = 1
    END
    ELSE
    BEGIN
        -- Indicar que la reserva no existe
        SET @Result = 2
    END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerReservaciones]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerReservaciones]
AS
BEGIN
   SELECT * FROM Reservaciones;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerReservacionesCubiculo]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerReservacionesCubiculo]
  @idCubiculo INT,
  @existeCubiculo INT OUTPUT
AS
BEGIN
  IF EXISTS (SELECT * FROM Cubiculos WHERE idCubiculo = @idCubiculo)
  BEGIN
    SET @existeCubiculo = 1;
    SELECT * FROM Reservaciones WHERE idCubiculo = @idCubiculo;
  END
  ELSE
  BEGIN
    SET @existeCubiculo = 2;
    SELECT 'El cubículo no existe' AS Mensaje;
  END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_VerReservacionesPorEstudiante]    Script Date: 13/04/2023 10:43:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_VerReservacionesPorEstudiante]
    @numCarnet VARCHAR(20)
AS
BEGIN
    SELECT * FROM Reservaciones WHERE numCarnet = @numCarnet;
END
GO
USE [master]
GO
ALTER DATABASE [BiblioTEC] SET  READ_WRITE 
GO
