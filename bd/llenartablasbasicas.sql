-- Insertar m�dicos en PersonalSanitario
INSERT INTO PersonalSanitario (Nombre, Apellidos, CorreoElectronico, Telefono, Contrasena)
VALUES
('Carlos', 'G�mez L�pez', 'carlos.gomez1@hospital.com', '300000000', 'medico123'),
('Ana', 'Mart�nez S�nchez', 'ana.martinez2@hospital.com', '300000001', 'medico124'),
('Luis', 'Hern�ndez P�rez', 'luis.hernandez3@hospital.com', '300000002', 'medico125'),
('Mar�a', 'Garc�a Ruiz', 'maria.garcia4@hospital.com', '300000003', 'medico126'),
('Jos�', 'Fern�ndez Jim�nez', 'jose.fernandez5@hospital.com', '300000004', 'medico127'),
('Sof�a', 'L�pez G�mez', 'sofia.lopez6@hospital.com', '300000005', 'medico128'),
('Miguel', 'Rodr�guez S�nchez', 'miguel.rodriguez7@hospital.com', '300000006', 'medico129'),
('Pablo', '�lvarez P�rez', 'pablo.alvarez8@hospital.com', '300000007', 'medico130'),
('Elena', 'Moreno D�az', 'elena.moreno9@hospital.com', '300000008', 'medico131'),
('Ra�l', 'Gonz�lez G�mez', 'raul.gonzalez10@hospital.com', '300000009', 'medico132'),
('Luc�a', 'Ruiz Gonz�lez', 'lucia.ruiz11@hospital.com', '300000010', 'medico133'),
('David', 'S�nchez Fern�ndez', 'david.sanchez12@hospital.com', '300000011', 'medico134'),
('Isabel', 'Jim�nez L�pez', 'isabel.jimenez13@hospital.com', '300000012', 'medico135'),
('Javier', 'D�az Rodr�guez', 'javier.diaz14@hospital.com', '300000013', 'medico136'),
('Pedro', 'Torres Mart�nez', 'pedro.torres15@hospital.com', '300000014', 'medico137'),
('Cristina', 'Ruiz P�rez', 'cristina.ruiz16@hospital.com', '300000015', 'medico138'),
('Antonio', 'Mendoza G�mez', 'antonio.mendoza17@hospital.com', '300000016', 'medico139'),
('Raquel', 'Jim�nez Gonz�lez', 'raquel.jimenez18@hospital.com', '300000017', 'medico140'),
('Jos� Mar�a', 'G�mez �lvarez', 'jose.gomez19@hospital.com', '300000018', 'medico141'),
('Marta', 'Hern�ndez S�nchez', 'marta.hernandez20@hospital.com', '300000019', 'medico142'),
('Ricardo', 'Castro Ruiz', 'ricardo.castro21@hospital.com', '300000020', 'medico143'),
('Patricia', 'V�zquez Rodr�guez', 'patricia.vazquez22@hospital.com', '300000021', 'medico144'),
('Adri�n', 'Fern�ndez L�pez', 'adrian.fernandez23@hospital.com', '300000022', 'medico145'),
('Eva', 'Torres Garc�a', 'eva.torres24@hospital.com', '300000023', 'medico146'),
('Fernando', 'Morales Fern�ndez', 'fernando.morales25@hospital.com', '300000024', 'medico147'),
('Sara', 'Mart�nez L�pez', 'sara.martinez26@hospital.com', '300000025', 'medico148'),
('Carlos', 'L�pez Garc�a', 'carlos.lopez27@hospital.com', '300000026', 'medico149'),
('Alejandra', 'Gonz�lez S�nchez', 'alejandra.gonzalez28@hospital.com', '300000027', 'medico150');

-- Insertar especialidades de m�dicos en la tabla Medico
INSERT INTO Medico (PersonalID, Especialidad)
SELECT PersonalID, 'Medicina General' FROM PersonalSanitario WHERE CorreoElectronico = 'carlos.gomez1@hospital.com'
UNION ALL
SELECT PersonalID, 'Pediatr�a' FROM PersonalSanitario WHERE CorreoElectronico = 'ana.martinez2@hospital.com'
UNION ALL
SELECT PersonalID, 'Cardiolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'luis.hernandez3@hospital.com'
UNION ALL
SELECT PersonalID, 'Neurolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'maria.garcia4@hospital.com'
UNION ALL
SELECT PersonalID, 'Ginecolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'jose.fernandez5@hospital.com'
UNION ALL
SELECT PersonalID, 'Oftalmolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'sofia.lopez6@hospital.com'
UNION ALL
SELECT PersonalID, 'Dermatolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'miguel.rodriguez7@hospital.com'
UNION ALL
SELECT PersonalID, 'Urolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'pablo.alvarez8@hospital.com'
UNION ALL
SELECT PersonalID, 'Traumatolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'elena.moreno9@hospital.com'
UNION ALL
SELECT PersonalID, 'Otolaringolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'raul.gonzalez10@hospital.com'
UNION ALL
SELECT PersonalID, 'Oncolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'lucia.ruiz11@hospital.com'
UNION ALL
SELECT PersonalID, 'Psiquiatr�a' FROM PersonalSanitario WHERE CorreoElectronico = 'david.sanchez12@hospital.com'
UNION ALL
SELECT PersonalID, 'Endocrinolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'isabel.jimenez13@hospital.com'
UNION ALL
SELECT PersonalID, 'Inmunolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'javier.diaz14@hospital.com'
UNION ALL
SELECT PersonalID, 'Geriatr�a' FROM PersonalSanitario WHERE CorreoElectronico = 'pedro.torres15@hospital.com'
UNION ALL
SELECT PersonalID, 'Nefrolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'cristina.ruiz16@hospital.com'
UNION ALL
SELECT PersonalID, 'Neumolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'antonio.mendoza17@hospital.com'
UNION ALL
SELECT PersonalID, 'Cirug�a General' FROM PersonalSanitario WHERE CorreoElectronico = 'raquel.jimenez18@hospital.com'
UNION ALL
SELECT PersonalID, 'Gastroenterolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'jose.gomez19@hospital.com'
UNION ALL
SELECT PersonalID, 'Hematolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'marta.hernandez20@hospital.com'
UNION ALL
SELECT PersonalID, 'Pneumolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'ricardo.castro21@hospital.com'
UNION ALL
SELECT PersonalID, 'Medicina Interna' FROM PersonalSanitario WHERE CorreoElectronico = 'patricia.vazquez22@hospital.com'
UNION ALL
SELECT PersonalID, 'Reumatolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'adrian.fernandez23@hospital.com'
UNION ALL
SELECT PersonalID, 'Radiolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'eva.torres24@hospital.com'
UNION ALL
SELECT PersonalID, 'Cirug�a Pl�stica' FROM PersonalSanitario WHERE CorreoElectronico = 'fernando.morales25@hospital.com'
UNION ALL
SELECT PersonalID, 'Pediatr�a' FROM PersonalSanitario WHERE CorreoElectronico = 'sara.martinez26@hospital.com'
UNION ALL
SELECT PersonalID, 'Ortopedia' FROM PersonalSanitario WHERE CorreoElectronico = 'carlos.lopez27@hospital.com'
UNION ALL
SELECT PersonalID, 'Anestesiolog�a' FROM PersonalSanitario WHERE CorreoElectronico = 'alejandra.gonzalez28@hospital.com';

-- Insertar Personal de Triaje en PersonalSanitario
INSERT INTO PersonalSanitario (Nombre, Apellidos, CorreoElectronico, Telefono, Contrasena)
VALUES
('Juan', 'P�rez D�az', 'juan.perez1@hospital.com', '300000101', 'triaje123'),
('Claudia', 'Moreno S�nchez', 'claudia.moreno2@hospital.com', '300000102', 'triaje124'),
('Antonio', 'Soto Garc�a', 'antonio.soto3@hospital.com', '300000103', 'triaje125'),
('Ver�nica', 'L�pez Mart�nez', 'veronica.lopez4@hospital.com', '300000104', 'triaje126'),
('Mart�n', 'Gonz�lez P�rez', 'martin.gonzalez5@hospital.com', '300000105', 'triaje127'),
('Patricia', 'R�os Garc�a', 'patricia.rios6@hospital.com', '300000106', 'triaje128'),
('Diego', 'Jim�nez Rodr�guez', 'diego.jimenez7@hospital.com', '300000107', 'triaje129'),
('Natalia', 'Fern�ndez L�pez', 'natalia.fernandez8@hospital.com', '300000108', 'triaje130'),
('Raquel', 'Moreno P�rez', 'raquel.moreno9@hospital.com', '300000109', 'triaje131'),
('David', 'S�nchez D�az', 'david.sanchez10@hospital.com', '300000110', 'triaje132'),
('Elena', 'Torres Garc�a', 'elena.torres11@hospital.com', '300000111', 'triaje133'),
('Sergio', 'Hern�ndez S�nchez', 'sergio.hernandez12@hospital.com', '300000112', 'triaje134'),
('Laura', '�lvarez Rodr�guez', 'laura.alvarez13@hospital.com', '300000113', 'triaje135'),
('Carlos', 'P�rez Jim�nez', 'carlos.perez14@hospital.com', '300000114', 'triaje136'),
('Antonio', 'Soto G�mez', 'antonio.soto15@hospital.com', '300000115', 'triaje137'),
('Cristina', 'G�mez S�nchez', 'cristina.gomez16@hospital.com', '300000116', 'triaje138'),
('Jos� Luis', 'S�nchez Torres', 'jose.sanchez17@hospital.com', '300000117', 'triaje139'),
('Mercedes', 'L�pez Fern�ndez', 'mercedes.lopez18@hospital.com', '300000118', 'triaje140'),
('�ngel', 'Mart�n G�mez', 'angel.martin19@hospital.com', '300000119', 'triaje141'),
('Ra�l', 'D�az Jim�nez', 'raul.diaz20@hospital.com', '300000120', 'triaje142');




-- Insertar pacientes
INSERT INTO Paciente (NumeroTarjeta, Nombre, Apellidos, FechaNacimiento, HistorialClinico)
VALUES
(1001, 'Juan', 'P�rez G�mez', '1990-05-15', 'Paciente con historial de hipertensi�n'),
(1002, 'Ana', 'L�pez Ruiz', '1985-07-22', 'Historial cl�nico limpio'),
(1003, 'Carlos', 'Mart�nez Rodr�guez', '2000-11-30', 'Paciente con alergias respiratorias'),
(1004, 'Mar�a', 'Gonz�lez S�nchez', '1975-03-10', 'Historial de diabetes tipo 2'),
(1005, 'Pedro', 'Hern�ndez Fern�ndez', '1992-06-25', 'Historial quir�rgico, operaci�n de apendicitis'),
(1006, 'Luc�a', 'D�az �lvarez', '1993-12-10', 'Sin historial cl�nico relevante'),
(1007, 'David', 'P�rez Garc�a', '1998-02-05', 'Paciente con asma'),
(1008, 'Raquel', 'Mart�nez P�rez', '1988-08-19', 'Historial de migra�as frecuentes'),
(1009, 'Jos�', 'Rodr�guez L�pez', '2001-01-14', 'Sin antecedentes m�dicos'),
(1010, 'Carmen', 'Gonz�lez Mart�n', '1983-09-25', 'Paciente con historia de hipertensi�n'),
(1011, 'Alberto', 'Serrano Garc�a', '1987-04-02', 'Sin enfermedades cr�nicas'),
(1012, 'Marta', 'Hern�ndez L�pez', '1995-10-28', 'Historial de anemia'),
(1013, 'Luis', '�lvarez Fern�ndez', '1990-01-09', 'Historial de cirug�as menores'),
(1014, 'Eva', 'Torres D�az', '1986-07-16', 'Sin enfermedades graves'),
(1015, 'Ricardo', 'Jim�nez Ruiz', '1992-03-04', 'Paciente con problemas gastrointestinales'),
(1016, 'Patricia', 'G�mez P�rez', '1996-11-11', 'Sin antecedentes m�dicos importantes'),
(1017, 'Fernando', 'Mart�nez �lvarez', '2003-04-29', 'Sin historial cl�nico relevante'),
(1018, 'Beatriz', 'L�pez Rodr�guez', '2000-06-19', 'Historial de alergias estacionales'),
(1019, 'Isabel', 'S�nchez Garc�a', '1987-12-02', 'Historial de problemas card�acos'),
(1020, 'Cristina', 'Rodr�guez P�rez', '1991-10-14', 'Sin enfermedades graves'),
(1021, 'Miguel', 'Torres Fern�ndez', '1982-07-30', 'Historial de trastornos de ansiedad'),
(1022, 'Juan Carlos', 'P�rez S�nchez', '1984-09-18', 'Paciente con antecedentes de artritis'),
(1023, 'M�nica', '�lvarez Mart�n', '1997-01-07', 'Historial de infecciones respiratorias'),
(1024, '�ngel', 'Gonz�lez Ruiz', '2002-11-27', 'Sin antecedentes m�dicos'),
(1025, 'Ra�l', 'Serrano L�pez', '1990-03-20', 'Paciente con historial de enfermedades respiratorias'),
(1026, 'Teresa', 'Hern�ndez Rodr�guez', '1994-04-09', 'Sin enfermedades graves'),
(1027, 'Laura', 'Jim�nez Fern�ndez', '1989-02-18', 'Historial de trastornos digestivos'),
(1028, 'Antonio', 'Rodr�guez �lvarez', '1980-11-04', 'Historial de problemas renales'),
(1029, 'Jos� Luis', 'Torres L�pez', '1993-05-17', 'Sin enfermedades relevantes'),
(1030, 'Mar�a Jos�', 'S�nchez Mart�nez', '1996-08-21', 'Historial de hipertensi�n leve');


-- Insertar administrativos
INSERT INTO Administrativo (Nombre, Apellidos, CorreoElectronico, Contrasena)
VALUES
('Andr�s', 'G�mez P�rez', 'andres.gomez@hospital.com', 'admin123'),
('Sof�a', 'Mart�nez L�pez', 'sofia.martinez@hospital.com', 'admin124'),
('Ra�l', 'Hern�ndez Garc�a', 'raul.hernandez@hospital.com', 'admin125'),
('Carmen', 'D�az Rodr�guez', 'carmen.diaz@hospital.com', 'admin126'),
('Laura', 'Serrano Gonz�lez', 'laura.serrano@hospital.com', 'admin127'),
('Jos�', 'L�pez Mart�nez', 'jose.lopez@hospital.com', 'admin128'),
('Patricia', 'Gonz�lez Fern�ndez', 'patricia.gonzalez@hospital.com', 'admin129'),
('Luis', '�lvarez P�rez', 'luis.alvarez@hospital.com', 'admin130'),
('Elena', 'Jim�nez S�nchez', 'elena.jimenez@hospital.com', 'admin131'),
('Alberto', 'Torres Gonz�lez', 'alberto.torres@hospital.com', 'admin132');

