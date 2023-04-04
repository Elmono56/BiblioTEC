CREATE PROCEDURE sp_RegistrarUsuario
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


CREATE FUNCTION fn_AutenticarUsuario
    (@correoElec VARCHAR(50), @contraseña VARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @numCarnet INT

    SELECT @numCarnet = numCarnet
    FROM Estudiantes
    WHERE correoElec = @correoElec AND contraseña = @contraseña;

    IF @numCarnet IS NULL
        RETURN -1
    ELSE
        RETURN @numCarnet
	RETURN 0
END



CREATE FUNCTION fn_EnviarConfirmacionCorreo
(
    @idReserva INT
)
RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @correoElec VARCHAR(50)
    DECLARE @numCubiculo INT
    DECLARE @fechaReserv DATE
    DECLARE @horaInicio TIME
    DECLARE @horaFinal TIME
    DECLARE @mensaje VARCHAR(MAX)

    SELECT @correoElec = E.correoElec,
           @numCubiculo = R.numCubiculo,
           @fechaReserv = R.fechaReserv,
           @horaInicio = R.horaInicio,
           @horaFinal = R.horaFinal
    FROM Reservaciones R
	INNER JOIN Estudiantes E ON R.numCarnet = E.numCarnet and E.idEstadoE = 1
    WHERE R.idReserva = @idReserva;

    IF @correoElec IS NOT NULL
    BEGIN
        SET @mensaje = 'Su reserva para el cubículo ' + CAST(@numCubiculo AS VARCHAR(10)) + ' el día ' + CONVERT(VARCHAR(10), @fechaReserv, 103) + ' de ' + CONVERT(VARCHAR(10), @horaInicio, 108) + ' a ' + CONVERT(VARCHAR(10), @horaFinal, 108) + ' ha sido confirmada.'
        
        EXEC msdb.dbo.sp_send_dbmail
            @profile_name = 'Biblioteca',
            @recipients = @correoElec,
            @subject = 'Confirmación de reserva',
            @body = @mensaje;

        RETURN 'Correo enviado correctamente.'
    END
    ELSE
    BEGIN
        RETURN 'No se encontró el correo electrónico del usuario.'
    END
	RETURN ''
END


CREATE PROCEDURE sp_BuscarCubiculosDisponibles
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
