-- Insertar médicos en PersonalSanitario
INSERT INTO PersonalSanitario (Nombre, Apellidos, CorreoElectronico, Telefono, Contrasena)
VALUES
('Carlos', 'Gómez López', 'carlos.gomez1@hospital.com', '300000000', 'medico123'),
('Ana', 'Martínez Sánchez', 'ana.martinez2@hospital.com', '300000001', 'medico124'),
('Luis', 'Hernández Pérez', 'luis.hernandez3@hospital.com', '300000002', 'medico125'),
('María', 'García Ruiz', 'maria.garcia4@hospital.com', '300000003', 'medico126'),
('José', 'Fernández Jiménez', 'jose.fernandez5@hospital.com', '300000004', 'medico127'),
('Sofía', 'López Gómez', 'sofia.lopez6@hospital.com', '300000005', 'medico128'),
('Miguel', 'Rodríguez Sánchez', 'miguel.rodriguez7@hospital.com', '300000006', 'medico129'),
('Pablo', 'Álvarez Pérez', 'pablo.alvarez8@hospital.com', '300000007', 'medico130'),
('Elena', 'Moreno Díaz', 'elena.moreno9@hospital.com', '300000008', 'medico131'),
('Raúl', 'González Gómez', 'raul.gonzalez10@hospital.com', '300000009', 'medico132'),
('Lucía', 'Ruiz González', 'lucia.ruiz11@hospital.com', '300000010', 'medico133'),
('David', 'Sánchez Fernández', 'david.sanchez12@hospital.com', '300000011', 'medico134'),
('Isabel', 'Jiménez López', 'isabel.jimenez13@hospital.com', '300000012', 'medico135'),
('Javier', 'Díaz Rodríguez', 'javier.diaz14@hospital.com', '300000013', 'medico136'),
('Pedro', 'Torres Martínez', 'pedro.torres15@hospital.com', '300000014', 'medico137'),
('Cristina', 'Ruiz Pérez', 'cristina.ruiz16@hospital.com', '300000015', 'medico138'),
('Antonio', 'Mendoza Gómez', 'antonio.mendoza17@hospital.com', '300000016', 'medico139'),
('Raquel', 'Jiménez González', 'raquel.jimenez18@hospital.com', '300000017', 'medico140'),
('José María', 'Gómez Álvarez', 'jose.gomez19@hospital.com', '300000018', 'medico141'),
('Marta', 'Hernández Sánchez', 'marta.hernandez20@hospital.com', '300000019', 'medico142'),
('Ricardo', 'Castro Ruiz', 'ricardo.castro21@hospital.com', '300000020', 'medico143'),
('Patricia', 'Vázquez Rodríguez', 'patricia.vazquez22@hospital.com', '300000021', 'medico144'),
('Adrián', 'Fernández López', 'adrian.fernandez23@hospital.com', '300000022', 'medico145'),
('Eva', 'Torres García', 'eva.torres24@hospital.com', '300000023', 'medico146'),
('Fernando', 'Morales Fernández', 'fernando.morales25@hospital.com', '300000024', 'medico147'),
('Sara', 'Martínez López', 'sara.martinez26@hospital.com', '300000025', 'medico148'),
('Carlos', 'López García', 'carlos.lopez27@hospital.com', '300000026', 'medico149'),
('Alejandra', 'González Sánchez', 'alejandra.gonzalez28@hospital.com', '300000027', 'medico150');

-- Insertar especialidades de médicos en la tabla Medico
INSERT INTO Medico (PersonalID, Especialidad)
SELECT PersonalID, 'Medicina General' FROM PersonalSanitario WHERE CorreoElectronico = 'carlos.gomez1@hospital.com'
UNION ALL
SELECT PersonalID, 'Pediatría' FROM PersonalSanitario WHERE CorreoElectronico = 'ana.martinez2@hospital.com'
UNION ALL
SELECT PersonalID, 'Cardiología' FROM PersonalSanitario WHERE CorreoElectronico = 'luis.hernandez3@hospital.com'
UNION ALL
SELECT PersonalID, 'Neurología' FROM PersonalSanitario WHERE CorreoElectronico = 'maria.garcia4@hospital.com'
UNION ALL
SELECT PersonalID, 'Ginecología' FROM PersonalSanitario WHERE CorreoElectronico = 'jose.fernandez5@hospital.com'
UNION ALL
SELECT PersonalID, 'Oftalmología' FROM PersonalSanitario WHERE CorreoElectronico = 'sofia.lopez6@hospital.com'
UNION ALL
SELECT PersonalID, 'Dermatología' FROM PersonalSanitario WHERE CorreoElectronico = 'miguel.rodriguez7@hospital.com'
UNION ALL
SELECT PersonalID, 'Urología' FROM PersonalSanitario WHERE CorreoElectronico = 'pablo.alvarez8@hospital.com'
UNION ALL
SELECT PersonalID, 'Traumatología' FROM PersonalSanitario WHERE CorreoElectronico = 'elena.moreno9@hospital.com'
UNION ALL
SELECT PersonalID, 'Otolaringología' FROM PersonalSanitario WHERE CorreoElectronico = 'raul.gonzalez10@hospital.com'
UNION ALL
SELECT PersonalID, 'Oncología' FROM PersonalSanitario WHERE CorreoElectronico = 'lucia.ruiz11@hospital.com'
UNION ALL
SELECT PersonalID, 'Psiquiatría' FROM PersonalSanitario WHERE CorreoElectronico = 'david.sanchez12@hospital.com'
UNION ALL
SELECT PersonalID, 'Endocrinología' FROM PersonalSanitario WHERE CorreoElectronico = 'isabel.jimenez13@hospital.com'
UNION ALL
SELECT PersonalID, 'Inmunología' FROM PersonalSanitario WHERE CorreoElectronico = 'javier.diaz14@hospital.com'
UNION ALL
SELECT PersonalID, 'Geriatría' FROM PersonalSanitario WHERE CorreoElectronico = 'pedro.torres15@hospital.com'
UNION ALL
SELECT PersonalID, 'Nefrología' FROM PersonalSanitario WHERE CorreoElectronico = 'cristina.ruiz16@hospital.com'
UNION ALL
SELECT PersonalID, 'Neumología' FROM PersonalSanitario WHERE CorreoElectronico = 'antonio.mendoza17@hospital.com'
UNION ALL
SELECT PersonalID, 'Cirugía General' FROM PersonalSanitario WHERE CorreoElectronico = 'raquel.jimenez18@hospital.com'
UNION ALL
SELECT PersonalID, 'Gastroenterología' FROM PersonalSanitario WHERE CorreoElectronico = 'jose.gomez19@hospital.com'
UNION ALL
SELECT PersonalID, 'Hematología' FROM PersonalSanitario WHERE CorreoElectronico = 'marta.hernandez20@hospital.com'
UNION ALL
SELECT PersonalID, 'Pneumología' FROM PersonalSanitario WHERE CorreoElectronico = 'ricardo.castro21@hospital.com'
UNION ALL
SELECT PersonalID, 'Medicina Interna' FROM PersonalSanitario WHERE CorreoElectronico = 'patricia.vazquez22@hospital.com'
UNION ALL
SELECT PersonalID, 'Reumatología' FROM PersonalSanitario WHERE CorreoElectronico = 'adrian.fernandez23@hospital.com'
UNION ALL
SELECT PersonalID, 'Radiología' FROM PersonalSanitario WHERE CorreoElectronico = 'eva.torres24@hospital.com'
UNION ALL
SELECT PersonalID, 'Cirugía Plástica' FROM PersonalSanitario WHERE CorreoElectronico = 'fernando.morales25@hospital.com'
UNION ALL
SELECT PersonalID, 'Pediatría' FROM PersonalSanitario WHERE CorreoElectronico = 'sara.martinez26@hospital.com'
UNION ALL
SELECT PersonalID, 'Ortopedia' FROM PersonalSanitario WHERE CorreoElectronico = 'carlos.lopez27@hospital.com'
UNION ALL
SELECT PersonalID, 'Anestesiología' FROM PersonalSanitario WHERE CorreoElectronico = 'alejandra.gonzalez28@hospital.com';

-- Insertar Personal de Triaje en PersonalSanitario
INSERT INTO PersonalSanitario (Nombre, Apellidos, CorreoElectronico, Telefono, Contrasena)
VALUES
('Juan', 'Pérez Díaz', 'juan.perez1@hospital.com', '300000101', 'triaje123'),
('Claudia', 'Moreno Sánchez', 'claudia.moreno2@hospital.com', '300000102', 'triaje124'),
('Antonio', 'Soto García', 'antonio.soto3@hospital.com', '300000103', 'triaje125'),
('Verónica', 'López Martínez', 'veronica.lopez4@hospital.com', '300000104', 'triaje126'),
('Martín', 'González Pérez', 'martin.gonzalez5@hospital.com', '300000105', 'triaje127'),
('Patricia', 'Ríos García', 'patricia.rios6@hospital.com', '300000106', 'triaje128'),
('Diego', 'Jiménez Rodríguez', 'diego.jimenez7@hospital.com', '300000107', 'triaje129'),
('Natalia', 'Fernández López', 'natalia.fernandez8@hospital.com', '300000108', 'triaje130'),
('Raquel', 'Moreno Pérez', 'raquel.moreno9@hospital.com', '300000109', 'triaje131'),
('David', 'Sánchez Díaz', 'david.sanchez10@hospital.com', '300000110', 'triaje132'),
('Elena', 'Torres García', 'elena.torres11@hospital.com', '300000111', 'triaje133'),
('Sergio', 'Hernández Sánchez', 'sergio.hernandez12@hospital.com', '300000112', 'triaje134'),
('Laura', 'Álvarez Rodríguez', 'laura.alvarez13@hospital.com', '300000113', 'triaje135'),
('Carlos', 'Pérez Jiménez', 'carlos.perez14@hospital.com', '300000114', 'triaje136'),
('Antonio', 'Soto Gómez', 'antonio.soto15@hospital.com', '300000115', 'triaje137'),
('Cristina', 'Gómez Sánchez', 'cristina.gomez16@hospital.com', '300000116', 'triaje138'),
('José Luis', 'Sánchez Torres', 'jose.sanchez17@hospital.com', '300000117', 'triaje139'),
('Mercedes', 'López Fernández', 'mercedes.lopez18@hospital.com', '300000118', 'triaje140'),
('Ángel', 'Martín Gómez', 'angel.martin19@hospital.com', '300000119', 'triaje141'),
('Raúl', 'Díaz Jiménez', 'raul.diaz20@hospital.com', '300000120', 'triaje142');




-- Insertar pacientes
INSERT INTO Paciente (NumeroTarjeta, Nombre, Apellidos, FechaNacimiento, HistorialClinico)
VALUES
(1001, 'Juan', 'Pérez Gómez', '1990-05-15', 'Paciente con historial de hipertensión'),
(1002, 'Ana', 'López Ruiz', '1985-07-22', 'Historial clínico limpio'),
(1003, 'Carlos', 'Martínez Rodríguez', '2000-11-30', 'Paciente con alergias respiratorias'),
(1004, 'María', 'González Sánchez', '1975-03-10', 'Historial de diabetes tipo 2'),
(1005, 'Pedro', 'Hernández Fernández', '1992-06-25', 'Historial quirúrgico, operación de apendicitis'),
(1006, 'Lucía', 'Díaz Álvarez', '1993-12-10', 'Sin historial clínico relevante'),
(1007, 'David', 'Pérez García', '1998-02-05', 'Paciente con asma'),
(1008, 'Raquel', 'Martínez Pérez', '1988-08-19', 'Historial de migrañas frecuentes'),
(1009, 'José', 'Rodríguez López', '2001-01-14', 'Sin antecedentes médicos'),
(1010, 'Carmen', 'González Martín', '1983-09-25', 'Paciente con historia de hipertensión'),
(1011, 'Alberto', 'Serrano García', '1987-04-02', 'Sin enfermedades crónicas'),
(1012, 'Marta', 'Hernández López', '1995-10-28', 'Historial de anemia'),
(1013, 'Luis', 'Álvarez Fernández', '1990-01-09', 'Historial de cirugías menores'),
(1014, 'Eva', 'Torres Díaz', '1986-07-16', 'Sin enfermedades graves'),
(1015, 'Ricardo', 'Jiménez Ruiz', '1992-03-04', 'Paciente con problemas gastrointestinales'),
(1016, 'Patricia', 'Gómez Pérez', '1996-11-11', 'Sin antecedentes médicos importantes'),
(1017, 'Fernando', 'Martínez Álvarez', '2003-04-29', 'Sin historial clínico relevante'),
(1018, 'Beatriz', 'López Rodríguez', '2000-06-19', 'Historial de alergias estacionales'),
(1019, 'Isabel', 'Sánchez García', '1987-12-02', 'Historial de problemas cardíacos'),
(1020, 'Cristina', 'Rodríguez Pérez', '1991-10-14', 'Sin enfermedades graves'),
(1021, 'Miguel', 'Torres Fernández', '1982-07-30', 'Historial de trastornos de ansiedad'),
(1022, 'Juan Carlos', 'Pérez Sánchez', '1984-09-18', 'Paciente con antecedentes de artritis'),
(1023, 'Mónica', 'Álvarez Martín', '1997-01-07', 'Historial de infecciones respiratorias'),
(1024, 'Ángel', 'González Ruiz', '2002-11-27', 'Sin antecedentes médicos'),
(1025, 'Raúl', 'Serrano López', '1990-03-20', 'Paciente con historial de enfermedades respiratorias'),
(1026, 'Teresa', 'Hernández Rodríguez', '1994-04-09', 'Sin enfermedades graves'),
(1027, 'Laura', 'Jiménez Fernández', '1989-02-18', 'Historial de trastornos digestivos'),
(1028, 'Antonio', 'Rodríguez Álvarez', '1980-11-04', 'Historial de problemas renales'),
(1029, 'José Luis', 'Torres López', '1993-05-17', 'Sin enfermedades relevantes'),
(1030, 'María José', 'Sánchez Martínez', '1996-08-21', 'Historial de hipertensión leve');


-- Insertar administrativos
INSERT INTO Administrativo (Nombre, Apellidos, CorreoElectronico, Contrasena)
VALUES
('Andrés', 'Gómez Pérez', 'andres.gomez@hospital.com', 'admin123'),
('Sofía', 'Martínez López', 'sofia.martinez@hospital.com', 'admin124'),
('Raúl', 'Hernández García', 'raul.hernandez@hospital.com', 'admin125'),
('Carmen', 'Díaz Rodríguez', 'carmen.diaz@hospital.com', 'admin126'),
('Laura', 'Serrano González', 'laura.serrano@hospital.com', 'admin127'),
('José', 'López Martínez', 'jose.lopez@hospital.com', 'admin128'),
('Patricia', 'González Fernández', 'patricia.gonzalez@hospital.com', 'admin129'),
('Luis', 'Álvarez Pérez', 'luis.alvarez@hospital.com', 'admin130'),
('Elena', 'Jiménez Sánchez', 'elena.jimenez@hospital.com', 'admin131'),
('Alberto', 'Torres González', 'alberto.torres@hospital.com', 'admin132');

