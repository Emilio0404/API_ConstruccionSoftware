/* Data Definition Language para la base de datos del
   examen de personalidad. Se debe ejecutar primero. */


CREATE TABLE Administrador(
	AdminID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	email VARCHAR(255) NOT NULL,
	hashPassword VARCHAR(255) NOT NULL,
	telefono VARCHAR(40),
	primerNombre VARCHAR(255),
	segundoNombre VARCHAR(255),
	apellidoPaterno VARCHAR(255),
	apellidoMaterno VARCHAR(255),
	UNIQUE(email)
);


CREATE TABLE Usuario (
	UserID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	email VARCHAR(255) NOT NULL,
	telefono VARCHAR(40),
	hashPassword VARCHAR(255) NOT NULL,
	primerNombre VARCHAR(255),
	segundoNombre VARCHAR(255),
	apellidoPaterno VARCHAR(255),
	apellidoMaterno VARCHAR(255),
	Linkedin VARCHAR(255),
	fechaNacimiento DATE,
	hasPendingExam BIT DEFAULT 1,
	managedBy INT FOREIGN KEY REFERENCES Administrador(AdminID) NOT NULL,
	UNIQUE(email)
);
/* Para un proyecto con más tiempo y en la que la base de datos contenga más de un examen,
se deberá agregar una manera de identificar no solo que tiene un examen pendiente, sino qué
examenes son los pendientes*/


CREATE TABLE TiposExamen (
	TipoExamenID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombreTipo VARCHAR(255) NOT NULL,
	UNIQUE(nombreTipo)
);


CREATE TABLE CriteriosPreguntas(
	CriterioID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombreCriterio VARCHAR(255) NOT NULL,
	UNIQUE(nombreCriterio)
);


CREATE TABLE Examen (
	ExamenID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombreExamen VARCHAR(255),
	tipoExamenID INT FOREIGN KEY REFERENCES TiposExamen(TipoExamenID),
);


CREATE TABLE Pregunta (
	PreguntaID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	pregunta VARCHAR(500) NOT NULL,
	opcionA VARCHAR(500),
	opcionB VARCHAR(500),
	opcionC VARCHAR(500),
	opcionD VARCHAR(500),
	valorOpcionA FLOAT,
	valorOpcionB FLOAT,
	valorOpcionC FLOAT,
	valorOpcionD FLOAT,
	criterio INT FOREIGN KEY REFERENCES CriteriosPreguntas(CriterioID),
	UNIQUE(Pregunta)
);


CREATE TABLE PreguntasExamen (
	ExamenID INT FOREIGN KEY REFERENCES Examen(ExamenID) NOT NULL,
	PreguntaID INT FOREIGN KEY REFERENCES Pregunta(PreguntaID) NOT NULL,
	CONSTRAINT PK_PreguntasExamen PRIMARY KEY (ExamenID, PreguntaID),
);


CREATE TABLE InstanciaExamen (
	InstanciaID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	ExamenID INT FOREIGN KEY REFERENCES Examen(ExamenID),
	UserID INT FOREIGN KEY REFERENCES Usuario(UserID),
	fechaContestado DATETIME,
	puntajeJuego FLOAT,
	tiempoJuego TIME
);


CREATE TABLE RespuestasUsuario (
	InstanciaID INT FOREIGN KEY REFERENCES InstanciaExamen(InstanciaID) NOT NULL,
	PreguntaID INT FOREIGN KEY REFERENCES Pregunta(PreguntaID) NOT NULL,
	letraRespuesta VARCHAR(1),
	CONSTRAINT PK_RespuestasUsuario PRIMARY KEY (PreguntaID, InstanciaID),
);