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