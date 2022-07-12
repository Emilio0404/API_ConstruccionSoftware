/* Procedimientos Almacenados */
/* NOTA: Se deben correr por separado para su creación, si no da error */

CREATE PROCEDURE PublicarInstanciaExamen @IdExamen INT, @IdUsuario INT, @puntaje FLOAT, @tiempoDeJuego TIME
AS
	INSERT INTO InstanciaExamen (ExamenID, UserID, fechaContestado, puntajeJuego, tiempoJuego)
		VALUES (@IdExamen, @IdUsuario, GETDATE(), @puntaje, @tiempoDeJuego);
	UPDATE Usuario SET hasPendingExam = 0 WHERE UserID = @IdUsuario;
GO

CREATE PROCEDURE PublicarRespuestaExamen @IdInstancia INT, @IdPregunta INT, @Respuesta VARCHAR(1)
AS
	INSERT INTO RespuestasUsuario(InstanciaID, PreguntaID, letraRespuesta)
		VALUES(@IdInstancia, @IdPregunta, @Respuesta);
GO

CREATE PROCEDURE ObtenerPreguntasRespuestadDeUltimoExamenPresentadoPorUsuario @IdUsuario INT
AS
	SELECT Pregunta.PreguntaID, Pregunta.pregunta, Pregunta.OpcionA, Pregunta.OpcionB, Pregunta.OpcionC, Pregunta.OpcionD,
		   Pregunta.valorOpcionA, Pregunta.valorOpcionB, Pregunta.valorOpcionC, Pregunta.valorOpcionD, RespuestasUsuario.letraRespuesta,
		   CriteriosPreguntas.nombreCriterio
		FROM Pregunta
		JOIN PreguntasExamen ON Pregunta.PreguntaID = PreguntasExamen.PreguntaID
		JOIN RespuestasUsuario ON Pregunta.PreguntaID = RespuestasUsuario.PreguntaID
		JOIN CriteriosPreguntas ON Pregunta.criterio = CriteriosPreguntas.CriterioID
		JOIN InstanciaExamen ON InstanciaExamen.InstanciaID = RespuestasUsuario.InstanciaID
		WHERE InstanciaExamen.UserID =  @IdUsuario AND InstanciaExamen.fechaContestado = 
			(SELECT TOP 1 fechaContestado FROM InstanciaExamen WHERE UserID =  @IdUsuario ORDER BY fechaContestado DESC)
GO

CREATE PROCEDURE ObtenerInformacionUsuarioYResultadosDeUltimoExamenPresentadoPorUsuario @IdUsuario INT
AS
	SELECT TOP 1 Usuario.email, Usuario.telefono, Usuario.primerNombre, Usuario.segundoNombre, Usuario.apellidoPaterno,
		   Usuario.apellidoMaterno, Usuario.Linkedin, Usuario.fechaNacimiento, InstanciaExamen.fechaContestado,
		   InstanciaExamen.puntajeJuego, InstanciaExamen.tiempoJuego
		FROM Usuario
		JOIN InstanciaExamen ON InstanciaExamen.UserID = Usuario.UserID
		WHERE InstanciaExamen.UserID = @IdUsuario
		ORDER BY InstanciaExamen.fechaContestado DESC
GO

CREATE PROCEDURE ProcedureEliminarUsuario @IdUsuario INT
AS 
BEGIN
	BEGIN TRANSACTION

		BEGIN TRY
			DELETE FROM RespuestasUsuario WHERE InstanciaID = 
				(SELECT InstanciaID FROM InstanciaExamen WHERE UserID = @IdUsuario);
			DELETE FROM InstanciaExamen WHERE UserID = @IdUsuario;
			DELETE FROM Usuario WHERE UserID = @IdUsuario;
			COMMIT TRANSACTION EliminarUsuario
		END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION EliminarUsuario
		END CATCH

	END;
GO
