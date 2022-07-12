/* Data Manipulation Language.
   Se insertan los valores necesarios para el examen
*/


/* Tipo Examen */	
INSERT INTO TiposExamen(nombreTipo) VALUES ('Personalidad');

/* Examen */
INSERT INTO Examen(nombreExamen, tipoExamenID) VALUES ('Contratacion_con_Juego', 1);

/* Criterios de Preguntas */
INSERT INTO CriteriosPreguntas(nombreCriterio) VALUES ('Comunicación');
INSERT INTO CriteriosPreguntas(nombreCriterio) VALUES ('Toma de decisiones');
INSERT INTO CriteriosPreguntas(nombreCriterio) VALUES ('Gestión de cambios');
INSERT INTO CriteriosPreguntas(nombreCriterio) VALUES ('Gestión de conflictos');

/* Preguntas */
INSERT INTO Pregunta(pregunta, opcionA, opcionB, opcionC, opcionD, valorOpcionA, valorOpcionB, valorOpcionC, valorOpcionD, criterio)
	VALUES ('Sin considerar los gastos económicos posibles como transporte, etc. ¿Cuál sería tu espacio ideal para trabajar? (Máx extrovertido a más introvertido).',
			'Un espacio comunicativo, donde exista múltiples interacciones presenciales, convivencia en donde pueda exponer, hablar en público, entre otra cosas.',
			'Un trabajo híbrido donde pueda interactuar en ambos tipos de ambientes, disfrutar de la adaptación y convivir.',
			'Un oficina presencial, ya que disfruto de ver gente, pero no me interesa la convivencia recurrente con muchas personas, preferiría un espacio individual y un puesto de poca interacción.',
			'Un trabajo donde pueda ser analítico, pero también individual, preferentemente home office.',
			75,
			45,
			30,
			15,
			1
	);

INSERT INTO Pregunta(pregunta, opcionA, opcionB, opcionC, opcionD, valorOpcionA, valorOpcionB, valorOpcionC, valorOpcionD, criterio)
	VALUES ('Al momento de tomar una decisión en tu día a día, selecciona la opción que te brinda mayor comodidad.',
			'Soy una persona más analítica que emocional, por lo que únicamente investigaría y usaría datos para tomar la decisión.',
			'En ocasiones utilizaria datos informativos, en otros utilizaría mi experiencia dependiendo del contexto de la situación.',
			'Usaría tanto datos como base informativa pero también lo que implican mis convicciones.',
			'La mayor parte del tiempo baso mis decisiones en mi experiencia pasada y lo aplico de  acuerdo a lo que cree que es correcto.',
			25,
			15,
			10,
			5,
			2
	);

INSERT INTO Pregunta(pregunta, opcionA, opcionB, opcionC, opcionD, valorOpcionA, valorOpcionB, valorOpcionC, valorOpcionD, criterio)
	VALUES ('Selecciona qué tan de acuerdo te sientes con el siguiente estatuto. Responde honestamente (aun si no te gusta la respuesta).

“Para ti es más importante ser organizado que ser capaz de adaptarte a las circunstancias.”',
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
	VALUES ('Tomando múltiples aspectos de tu vida diaria, selecciona qué tan de acuerdo te sientes con el siguiente estatuto. Responde honestamente (aun si no te gusta la respuesta).

“Te consideras una persona más práctica que creativa.”',
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
	VALUES ('Situación hipotética: “Cuando hay un debate, te resulta más importante ganarlo que asegurarte de que nadie se sienta molesto o susceptible a lo que digas.” , selecciona qué tan de acuerdo te sientes con el siguiente estatuto. Responde honestamente (aun si no te gusta la respuesta).',
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
	VALUES ('Tomando múltiples aspectos de tu vida diaria, selecciona qué tan de acuerdo te sientes con el siguiente estatuto. Responde honestamente (aun si no te gusta la respuesta).

“Con frecuencia no sientes que tienes que justificarte ante otras personas sobre tus acciones.”',
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
	VALUES ('Situación hipotética: “Un trabajo en equipo laboral por mayoría han decidido realizar la ejecución de un proyecto seleccionado, entre las opciones de proyecto, había uno que había sido implementado por ti el cuál consideras que tendría un mayor rendimiento para el financiamiento de procesos de DENSO, no obstante, no fue el elegido por la mayoría”. ¿Cuáles serían las acciones que tomarías en ese caso?',
			'Debatir y cuestionar con el equipo hasta que decidan cambiar el proyecto, si el mío es la mejor opción independientemente de la mayoría, es importante hacerles ver que el otro proyecto no dará los beneficios que mi proceso de implementación dará.',
			'Comentarle a  múltiples compañeros sobre las ventajas del otro proyecto de manera individual para ver las posibilidades de un cambio en las decisiones.',
			'A pesar de que mi trabajo no fue el seleccionado, puedo comentar durante la sesión aspectos positivos del mío que pueden ser aplicados en el proyecto seleccionado si hay alguna área de oportunidad, pero también colaborar de manera activa con todo lo necesario para que el trabajo en equipo salga a flote.',
			'Aunque mi proyecto no haya sido mayoría es importante ser solidario y apoyar a que el trabajo salga lo mejor posible con las convicciones de la mayoría pues al final todos tenemos el mismo objetivo que es el que nos solicitaron como medios de trabajo.',
			25,
			15,
			10,
			5,
			3
	);

INSERT INTO Pregunta(pregunta, opcionA, opcionB, opcionC, opcionD, valorOpcionA, valorOpcionB, valorOpcionC, valorOpcionD, criterio)
	VALUES ('Tomando múltiples aspectos de tu vida diaria, selecciona qué tan de acuerdo te sientes con el siguiente estatuto. Responde honestamente (aun si no te gusta la respuesta).
	
“Tu estilo de trabajo se parece más a un enfoque metódico y organizado que a rachas aleatorias de mucha energía."',
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
	VALUES ('Tomando múltiples aspectos de tu vida diaria, selecciona qué tan de acuerdo te sientes con el siguiente estatuto. Responde honestamente (aun si no te gusta la respuesta).
	
“Ser capaz de desarrollar un plan y adherirse a él es la parte más importante de todo proyecto.”',
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
	VALUES ('Tomando múltiples aspectos de tu vida diaria, selecciona qué tan de acuerdo te sientes con el siguiente estatuto. Responde honestamente (aun si no te gusta la respuesta).
	
“Prefieres dedicar tiempo a desarrollar un plan detallado a improvisar sobre un tema que ya sabes.”',
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


/* Si hacemos select *, estarán solo los valores necesarios
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