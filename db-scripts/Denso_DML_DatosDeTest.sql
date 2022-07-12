/* Data Manipulation Language.
   Se insertan los valores necesarios para el examen
*/


/* Tipo Examen */	
INSERT INTO TiposExamen(nombreTipo) VALUES ('Personalidad');

/* Examen */
INSERT INTO Examen(nombreExamen, tipoExamenID) VALUES ('Contratacion_con_Juego', 1);

/* Criterios de Preguntas */
INSERT INTO CriteriosPreguntas(nombreCriterio) VALUES ('Comunicaci�n');
INSERT INTO CriteriosPreguntas(nombreCriterio) VALUES ('Toma de decisiones');
INSERT INTO CriteriosPreguntas(nombreCriterio) VALUES ('Gesti�n de cambios');
INSERT INTO CriteriosPreguntas(nombreCriterio) VALUES ('Gesti�n de conflictos');

/* Preguntas */
INSERT INTO Pregunta(pregunta, opcionA, opcionB, opcionC, opcionD, valorOpcionA, valorOpcionB, valorOpcionC, valorOpcionD, criterio)
	VALUES ('Sin considerar los gastos econ�micos posibles como transporte, etc. �Cu�l ser�a tu espacio ideal para trabajar? (M�x extrovertido a m�s introvertido).',
			'Un espacio comunicativo, donde exista m�ltiples interacciones presenciales, convivencia en donde pueda exponer, hablar en p�blico, entre otra cosas.',
			'Un trabajo h�brido donde pueda interactuar en ambos tipos de ambientes, disfrutar de la adaptaci�n y convivir.',
			'Un oficina presencial, ya que disfruto de ver gente, pero no me interesa la convivencia recurrente con muchas personas, preferir�a un espacio individual y un puesto de poca interacci�n.',
			'Un trabajo donde pueda ser anal�tico, pero tambi�n individual, preferentemente home office.',
			75,
			45,
			30,
			15,
			1
	);

INSERT INTO Pregunta(pregunta, opcionA, opcionB, opcionC, opcionD, valorOpcionA, valorOpcionB, valorOpcionC, valorOpcionD, criterio)
	VALUES ('Al momento de tomar una decisi�n en tu d�a a d�a, selecciona la opci�n que te brinda mayor comodidad.',
			'Soy una persona m�s anal�tica que emocional, por lo que �nicamente investigar�a y usar�a datos para tomar la decisi�n.',
			'En ocasiones utilizaria datos informativos, en otros utilizar�a mi experiencia dependiendo del contexto de la situaci�n.',
			'Usar�a tanto datos como base informativa pero tambi�n lo que implican mis convicciones.',
			'La mayor parte del tiempo baso mis decisiones en mi experiencia pasada y lo aplico de  acuerdo a lo que cree que es correcto.',
			25,
			15,
			10,
			5,
			2
	);

INSERT INTO Pregunta(pregunta, opcionA, opcionB, opcionC, opcionD, valorOpcionA, valorOpcionB, valorOpcionC, valorOpcionD, criterio)
	VALUES ('Selecciona qu� tan de acuerdo te sientes con el siguiente estatuto. Responde honestamente (aun si no te gusta la respuesta).

�Para ti es m�s importante ser organizado que ser capaz de adaptarte a las circunstancias.�',
			'Totalmente de acuerdo.',
			'Parcialmente de acuerdo.',
			'Ni en acuerdo ni en desacuerdo.',
			'Totalmente en desacuerdo.',
			25,
			15,
			10,
			5,
			2
	);

INSERT INTO Pregunta(pregunta, opcionA, opcionB, opcionC, opcionD, valorOpcionA, valorOpcionB, valorOpcionC, valorOpcionD, criterio)
	VALUES ('Tomando m�ltiples aspectos de tu vida diaria, selecciona qu� tan de acuerdo te sientes con el siguiente estatuto. Responde honestamente (aun si no te gusta la respuesta).

�Te consideras una persona m�s pr�ctica que creativa.�',
			'Totalmente de acuerdo.',
			'Parcialmente de acuerdo.',
			'Ni en acuerdo ni en desacuerdo.',
			'Totalmente en desacuerdo.',
			25,
			15,
			10,
			5,
			2
	);

INSERT INTO Pregunta(pregunta, opcionA, opcionB, opcionC, opcionD, valorOpcionA, valorOpcionB, valorOpcionC, valorOpcionD, criterio)
	VALUES ('Situaci�n hipot�tica: �Cuando hay un debate, te resulta m�s importante ganarlo que asegurarte de que nadie se sienta molesto o susceptible a lo que digas.� , selecciona qu� tan de acuerdo te sientes con el siguiente estatuto. Responde honestamente (aun si no te gusta la respuesta).',
			'Totalmente de acuerdo.',
			'Parcialmente de acuerdo.',
			'Ni en acuerdo ni en desacuerdo.',
			'Totalmente en desacuerdo.',
			25,
			15,
			10,
			5,
			3
	);

INSERT INTO Pregunta(pregunta, opcionA, opcionB, opcionC, opcionD, valorOpcionA, valorOpcionB, valorOpcionC, valorOpcionD, criterio)
	VALUES ('Tomando m�ltiples aspectos de tu vida diaria, selecciona qu� tan de acuerdo te sientes con el siguiente estatuto. Responde honestamente (aun si no te gusta la respuesta).

�Con frecuencia no sientes que tienes que justificarte ante otras personas sobre tus acciones.�',
			'Totalmente de acuerdo.',
			'Parcialmente de acuerdo.',
			'Ni en acuerdo ni en desacuerdo.',
			'Totalmente en desacuerdo.',
			25,
			15,
			10,
			5,
			3
	);

INSERT INTO Pregunta(pregunta, opcionA, opcionB, opcionC, opcionD, valorOpcionA, valorOpcionB, valorOpcionC, valorOpcionD, criterio)
	VALUES ('Situaci�n hipot�tica: �Un trabajo en equipo laboral por mayor�a han decidido realizar la ejecuci�n de un proyecto seleccionado, entre las opciones de proyecto, hab�a uno que hab�a sido implementado por ti el cu�l consideras que tendr�a un mayor rendimiento para el financiamiento de procesos de DENSO, no obstante, no fue el elegido por la mayor�a�. �Cu�les ser�an las acciones que tomar�as en ese caso?',
			'Debatir y cuestionar con el equipo hasta que decidan cambiar el proyecto, si el m�o es la mejor opci�n independientemente de la mayor�a, es importante hacerles ver que el otro proyecto no dar� los beneficios que mi proceso de implementaci�n dar�.',
			'Comentarle a  m�ltiples compa�eros sobre las ventajas del otro proyecto de manera individual para ver las posibilidades de un cambio en las decisiones.',
			'A pesar de que mi trabajo no fue el seleccionado, puedo comentar durante la sesi�n aspectos positivos del m�o que pueden ser aplicados en el proyecto seleccionado si hay alguna �rea de oportunidad, pero tambi�n colaborar de manera activa con todo lo necesario para que el trabajo en equipo salga a flote.',
			'Aunque mi proyecto no haya sido mayor�a es importante ser solidario y apoyar a que el trabajo salga lo mejor posible con las convicciones de la mayor�a pues al final todos tenemos el mismo objetivo que es el que nos solicitaron como medios de trabajo.',
			25,
			15,
			10,
			5,
			3
	);

INSERT INTO Pregunta(pregunta, opcionA, opcionB, opcionC, opcionD, valorOpcionA, valorOpcionB, valorOpcionC, valorOpcionD, criterio)
	VALUES ('Tomando m�ltiples aspectos de tu vida diaria, selecciona qu� tan de acuerdo te sientes con el siguiente estatuto. Responde honestamente (aun si no te gusta la respuesta).
	
�Tu estilo de trabajo se parece m�s a un enfoque met�dico y organizado que a rachas aleatorias de mucha energ�a."',
			'Totalmente de acuerdo.',
			'Parcialmente de acuerdo.',
			'Ni en acuerdo ni en desacuerdo.',
			'Totalmente en desacuerdo.',
			25,
			15,
			10,
			5,
			4
	);

INSERT INTO Pregunta(pregunta, opcionA, opcionB, opcionC, opcionD, valorOpcionA, valorOpcionB, valorOpcionC, valorOpcionD, criterio)
	VALUES ('Tomando m�ltiples aspectos de tu vida diaria, selecciona qu� tan de acuerdo te sientes con el siguiente estatuto. Responde honestamente (aun si no te gusta la respuesta).
	
�Ser capaz de desarrollar un plan y adherirse a �l es la parte m�s importante de todo proyecto.�',
			'Totalmente de acuerdo.',
			'Parcialmente de acuerdo.',
			'Ni en acuerdo ni en desacuerdo.',
			'Totalmente en desacuerdo.',
			25,
			15,
			10,
			5,
			4
	);

INSERT INTO Pregunta(pregunta, opcionA, opcionB, opcionC, opcionD, valorOpcionA, valorOpcionB, valorOpcionC, valorOpcionD, criterio)
	VALUES ('Tomando m�ltiples aspectos de tu vida diaria, selecciona qu� tan de acuerdo te sientes con el siguiente estatuto. Responde honestamente (aun si no te gusta la respuesta).
	
�Prefieres dedicar tiempo a desarrollar un plan detallado a improvisar sobre un tema que ya sabes.�',
			'Totalmente de acuerdo.',
			'Parcialmente de acuerdo.',
			'Ni en acuerdo ni en desacuerdo.',
			'Totalmente en desacuerdo.',
			25,
			15,
			10,
			5,
			4
	);


/* Valores de PreguntasExamen */
INSERT INTO PreguntasExamen(ExamenID, PreguntaID) VALUES (1, 1);
INSERT INTO PreguntasExamen(ExamenID, PreguntaID) VALUES (1, 2);
INSERT INTO PreguntasExamen(ExamenID, PreguntaID) VALUES (1, 3);
INSERT INTO PreguntasExamen(ExamenID, PreguntaID) VALUES (1, 4);
INSERT INTO PreguntasExamen(ExamenID, PreguntaID) VALUES (1, 5);
INSERT INTO PreguntasExamen(ExamenID, PreguntaID) VALUES (1, 6);
INSERT INTO PreguntasExamen(ExamenID, PreguntaID) VALUES (1, 7);
INSERT INTO PreguntasExamen(ExamenID, PreguntaID) VALUES (1, 8);
INSERT INTO PreguntasExamen(ExamenID, PreguntaID) VALUES (1, 9);
INSERT INTO PreguntasExamen(ExamenID, PreguntaID) VALUES (1, 10);


/* Si hacemos select *, estar�n solo los valores necesarios
   para el examen. No hay datos de administradores y usuarios */

SELECT * FROM Administrador;
SELECT * FROM Usuario;
SELECT * FROM Examen;
SELECT * FROM TiposExamen;
SELECT * FROM Pregunta;
SELECT * FROM CriteriosPreguntas;
SELECT * FROM PreguntasExamen;
SELECT * FROM InstanciaExamen;
SELECT * FROM RespuestasUsuario ORDER BY InstanciaID;