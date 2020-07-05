CREATE KEYSPACE verano2020 WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };
CREATE TABLE verano2020.perfil_estudiante (
	nombre TEXT,
	apellido TEXT,
	matricula TEXT,
	programa TEXT,
	materiasactivas SET<TEXT>,
	materiasterminadas SET<TEXT>,
	otros LIST<TEXT>,
	calificacionmateria MAP<TEXT, FLOAT>,
	PRIMARY KEY (matricula, programa, apellido, nombre)
);

INSERT INTO verano2020.perfil_estudiante (matricula, programa, apellido, nombre) VALUES ('A00354xxx', 'MCC09', 'coraspe', 'ramses');

SELECT * FROM verano2020.perfil_estudiante;

UPDATE  verano2020.perfil_estudiante
SET materiasactivas = materiasactivas + {'data analytic', 'data mining'}  WHERE matricula = 'A00354xxx' and programa = 'MCC09' and apellido = 'coraspe' and nombre = 'ramses';

SELECT * FROM verano2020.perfil_estudiante;

UPDATE  verano2020.perfil_estudiante
SET materiasactivas = materiasactivas + {'extra subject'}  WHERE matricula = 'A00354xxx' and programa = 'MCC09' and apellido = 'coraspe' and nombre = 'ramses';
SELECT * FROM verano2020.perfil_estudiante;

UPDATE  verano2020.perfil_estudiante
SET materiasactivas = materiasactivas + {'extra subject 2'}  WHERE matricula = 'A00354xxx' and programa = 'MCC09' and apellido = 'coraspe' and nombre = 'ramses';
SELECT * FROM verano2020.perfil_estudiante;

UPDATE  verano2020.perfil_estudiante
SET materiasactivas = materiasactivas - {'extra subject'}  WHERE matricula = 'A00354xxx' and programa = 'MCC09' and apellido = 'coraspe' and nombre = 'ramses';
SELECT * FROM verano2020.perfil_estudiante;

UPDATE verano2020.perfil_estudiante
SET materiasactivas = materiasactivas - {'extra subject','extra subject 2'} WHERE matricula = 'A00354xxx' AND programa = 'MCC09' AND apellido = 'coraspe' AND nombre = 'ramses';
SELECT * FROM verano2020.perfil_estudiante;

UPDATE verano2020.perfil_estudiante
SET materiasactivas = materiasactivas + {'Math 2'}, materiasterminadas = materiasterminadas + {'Math 1'} WHERE matricula = 'A00354xxx' AND programa = 'MCC09' AND apellido = 'coraspe' AND nombre = 'ramses';  
SELECT * FROM verano2020.perfil_estudiante;

UPDATE verano2020.perfil_estudiante
SET materiasactivas = materiasactivas + { 'Math 3', 'Math 4'} , calificacionmateria = calificacionmateria + {'data analytic':10, 'data mining':10}
WHERE matricula = 'A00354xxx' AND programa = 'MCC09' AND apellido = 'coraspe' AND nombre = 'ramses';
SELECT * FROM verano2020.perfil_estudiante;

COPY  verano2020.perfil_estudiante(matricula,programa,apellido,nombre,calificacionmateria,materiasactivas,materiasterminadas,otros) TO 'C:\Users\ramse\Desktop\Data_analytic\Cassandra\datos.csv' WITH HEADER = TRUE and DELIMITER = ',';

CREATE KEYSPACE verano2020_version2 WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

CREATE TABLE verano2020_version2.perfil_estudiante (
	nombre TEXT,
	apellido TEXT,
	matricula TEXT,
	programa TEXT,
	materiasactivas SET<TEXT>,
	materiasterminadas SET<TEXT>,
	otros LIST<TEXT>,
	calificacionmateria MAP<TEXT, FLOAT>,
	PRIMARY KEY (matricula, programa, apellido, nombre)
);

COPY verano2020_version2.perfil_estudiante(matricula,programa,apellido,nombre,calificacionmateria,materiasactivas,materiasterminadas,otros) FROM 'C:\Users\ramse\Desktop\Data_analytic\Cassandra\datos.csv' WITH HEADER = TRUE and DELIMITER = ',';

select * from verano2020_version2.perfil_estudiante
