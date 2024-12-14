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
('Raúl', 'Navarro López', 'raul.navarro7@hospital.com', '300000107', 'triaje129'),
('María', 'Torres Díaz', 'maria.torres8@hospital.com', '300000108', 'triaje130'),
('Luis', 'Jiménez Fernández', 'luis.jimenez9@hospital.com', '300000109', 'triaje131'),
('Ana', 'González Ruiz', 'ana.gonzalez10@hospital.com', '300000110', 'triaje132');
