-----------------------------------------------------------------CUBICULOS--------------------------------------------
DELIMITER //
CREATE PROCEDURE CRUD_Cubiculos
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
			SET numCubiculo = ISNULL(@pNumCub, numCubiculo), capacidad = ISNULL(@pCantPers, capacidad), servEsp = ISNULL(@pServEsp, servEsp), ubicacion = ISNULL(@pUbicacion, ubicacion), idEstado = ISNULL(@pIdEstado, idEstado)
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
//



-----------------------------------------------------------------SERVICIOS ESPECIALES--------------------------------------------



DELIMITER //
CREATE PROCEDURE CRUD_TipServEsp
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
//



-----------------------------------------------------------------ESTADOS ESTUDIANTE--------------------------------------------



DELIMITER //
CREATE PROCEDURE CRUD_EstadoEst
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
//



-----------------------------------------------------------------ESTADOS CUBICULO--------------------------------------------



DELIMITER //
CREATE PROCEDURE CRUD_EstadoCub
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
//



-----------------------------------------------------------------PERSONAS--------------------------------------------



DELIMITER //
CREATE PROCEDURE CRUD_Personas
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
//



-----------------------------------------------------------------ADMINISTRADORES--------------------------------------------



DELIMITER//
CREATE PROCEDURE CRUD_Administradores
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
//



-----------------------------------------------------------------ESTUDIANTES--------------------------------------------



DELIMITER //
CREATE PROCEDURE CRUD_Estudiantes
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
//



-----------------------------------------------------------------ESTUDIANTES ELIMINADOS--------------------------------------------



DELIMTER //
CREATE PROCEDURE CRUD_EstudEli
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
//



-----------------------------------------------------------------RESERVACIONS--------------------------------------------



DELIMITER //
CREATE PROCEDURE CRUD_Reservaciones
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
//



-----------------------------------------------------------------CANCELACIONES--------------------------------------------



DELIMITER //
CREATE PROCEDURE CRUD_Cancelaciones
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
//



-----------------------------------------------------------------CONFIRMACIONES--------------------------------------------



DELIMITER //
CREATE PROCEDURE CRUD_Confirmaciones
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
//