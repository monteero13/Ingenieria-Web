-- Creación de la tabla PersonalSanitario (superentidad) 
CREATE TABLE PersonalSanitario (
    PersonalID INT AUTO_INCREMENT PRIMARY KEY,  
    Nombre VARCHAR(255) NOT NULL,
    Apellidos VARCHAR(255) NOT NULL,
    CorreoElectronico VARCHAR(255) UNIQUE NOT NULL,
    Telefono VARCHAR(50),
    Contrasena VARCHAR(255) NOT NULL, -- Campo para login
    FechaRegistro DATETIME DEFAULT NOW()
);

-- Creación de la tabla PersonalTriaje (subentidad de PersonalSanitario)
CREATE TABLE PersonalTriaje (
    TriajeID INT AUTO_INCREMENT PRIMARY KEY,
    PersonalID INT NOT NULL,
    FOREIGN KEY (PersonalID) REFERENCES PersonalSanitario(PersonalID)
);

-- Creación de la tabla Médico (subentidad de PersonalSanitario)
CREATE TABLE Medico (
    MedicoID INT AUTO_INCREMENT PRIMARY KEY,
    PersonalID INT NOT NULL,
    Especialidad VARCHAR(255),
    FOREIGN KEY (PersonalID) REFERENCES PersonalSanitario(PersonalID)
);

-- Tabla Paciente
CREATE TABLE Paciente (
    NumeroTarjeta INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(150) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    HistorialClinico TEXT
);

-- Tabla Administrativo
CREATE TABLE Administrativo (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(150) NOT NULL,
    CorreoElectronico VARCHAR(150) NOT NULL UNIQUE,
    Contrasena VARCHAR(100) NOT NULL
);

-- Tabla EstadoPaciente
CREATE TABLE EstadoPaciente (
    EstadoID INT AUTO_INCREMENT PRIMARY KEY,
    Descripcion VARCHAR(100) NOT NULL -- Ejemplo: "En espera", "Atendido", "Dado de alta", "Fallecido"
);

-- Tabla Urgencias
CREATE TABLE Urgencias (
    UrgenciasID INT AUTO_INCREMENT PRIMARY KEY,
    NumeroTarjeta INT NOT NULL,
    FechaIngreso DATETIME NOT NULL DEFAULT NOW(),
    EstadoID INT NOT NULL,
    Prioridad INT NOT NULL, -- 1: Emergencia, 2: Urgente, 3: Semiurgente, 4: No urgente
    TriajeID INT NULL, -- ID del personal de triaje asignado
    MedicoID INT NULL, -- ID del médico asignado
    FOREIGN KEY (NumeroTarjeta) REFERENCES Paciente(NumeroTarjeta),
    FOREIGN KEY (EstadoID) REFERENCES EstadoPaciente(EstadoID),
    FOREIGN KEY (TriajeID) REFERENCES PersonalTriaje(TriajeID),
    FOREIGN KEY (MedicoID) REFERENCES Medico(MedicoID)
);

-- Tabla Notificaciones
CREATE TABLE Notificaciones (
    NotificacionID INT AUTO_INCREMENT PRIMARY KEY,
    UrgenciasID INT NOT NULL,
    Mensaje TEXT NOT NULL,
    Fecha DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (UrgenciasID) REFERENCES Urgencias(UrgenciasID)
);

-- Tabla Login
CREATE TABLE Login (
    LoginID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT NOT NULL, -- Puede ser Administrativo, PersonalTriaje o Médico
    TipoUsuario VARCHAR(50) NOT NULL, -- "Administrativo", "PersonalTriaje" o "Médico"
    FechaInicioSesion DATETIME NOT NULL DEFAULT NOW(),
    FechaFinSesion DATETIME NULL
);

-- Relaciones con los diferentes tipos de usuario
ALTER TABLE Login ADD COLUMN AdministrativoID INT NULL;
ALTER TABLE Login ADD COLUMN PersonalTriajeID INT NULL;
ALTER TABLE Login ADD COLUMN MedicoID INT NULL;

ALTER TABLE Login ADD FOREIGN KEY (AdministrativoID) REFERENCES Administrativo(ID);
ALTER TABLE Login ADD FOREIGN KEY (PersonalTriajeID) REFERENCES PersonalTriaje(TriajeID);
ALTER TABLE Login ADD FOREIGN KEY (MedicoID) REFERENCES Medico(MedicoID);

-- Asegurarse de que el CorreoElectronico y Telefono sean únicos
ALTER TABLE PersonalSanitario ADD CONSTRAINT UC_CorreoElectronico UNIQUE (CorreoElectronico);
ALTER TABLE PersonalSanitario ADD CONSTRAINT UC_Telefono UNIQUE (Telefono);
-- Asegurarse de que la Contraseña sea única
ALTER TABLE PersonalSanitario ADD CONSTRAINT UC_Contrasena UNIQUE (Contrasena);
-- Asegurarse de que la Contraseña de los Administrativos sea única
ALTER TABLE Administrativo ADD CONSTRAINT UC_ContrasenaAdministrativo UNIQUE (Contrasena);

ALTER TABLE Urgencias ADD COLUMN MedicoAsignadoPor INT;
ALTER TABLE Paciente ADD COLUMN EnUrgencias BOOLEAN NOT NULL DEFAULT 0;
ALTER TABLE PersonalTriaje ADD COLUMN Disponible BOOLEAN NOT NULL DEFAULT 0;
ALTER TABLE Medico ADD COLUMN Disponible BOOLEAN NOT NULL DEFAULT 0;

-- Trigger para actualizar la disponibilidad del personal después de login
DELIMITER //
CREATE TRIGGER ActualizarDisponibleLogin
AFTER INSERT ON Login
FOR EACH ROW
BEGIN
    -- Verifica si el usuario es un médico o personal de triaje
    IF NEW.TipoUsuario IN ('Médico', 'PersonalTriaje') THEN
        -- Actualiza el campo Disponible en Medico o PersonalTriaje a 1 (disponible)
        UPDATE Medico SET Disponible = 1 WHERE PersonalID = NEW.UsuarioID AND NEW.TipoUsuario = 'Médico';
        UPDATE PersonalTriaje SET Disponible = 1 WHERE PersonalID = NEW.UsuarioID AND NEW.TipoUsuario = 'PersonalTriaje';
    END IF;
END;
//
DELIMITER ;

-- Trigger para actualizar la disponibilidad del personal después de logout
DELIMITER //
CREATE TRIGGER ActualizarDisponibleLogout
AFTER UPDATE ON Login
FOR EACH ROW
BEGIN
    -- Verifica si se ha actualizado la columna FechaFinSesion
    IF NEW.FechaFinSesion IS NOT NULL THEN
        -- Actualiza el campo Disponible en Medico o PersonalTriaje a 0 (no disponible)
        UPDATE Medico SET Disponible = 0 WHERE PersonalID = NEW.UsuarioID AND NEW.TipoUsuario = 'Médico';
        UPDATE PersonalTriaje SET Disponible = 0 WHERE PersonalID = NEW.UsuarioID AND NEW.TipoUsuario = 'PersonalTriaje';
    END IF;
END;
//
DELIMITER ;

-- Trigger para verificar si el paciente está fallecido
DELIMITER //
CREATE TRIGGER VerificarFallecimiento
AFTER INSERT ON Urgencias
FOR EACH ROW
BEGIN
    DECLARE UltimaVisitaEstado INT;
    -- Obtiene el estado de la última visita del paciente
    SELECT EstadoID INTO UltimaVisitaEstado
    FROM Urgencias
    WHERE NumeroTarjeta = NEW.NumeroTarjeta
    ORDER BY FechaIngreso DESC LIMIT 1;

    -- Si la última visita fue de estado "Fallecido", no permitir ingresar al paciente en urgencias
    IF EXISTS (SELECT 1 FROM EstadoPaciente WHERE EstadoID = UltimaVisitaEstado AND Descripcion = 'Fallecido') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El paciente fue declarado fallecido en su última visita. No puede ser ingresado en urgencias nuevamente.';
    END IF;
END;
//
DELIMITER ;

-- Añadir columnas en la tabla Urgencias para los nuevos parámetros
ALTER TABLE Urgencias
ADD
    FrecuenciaCardiaca INT,             -- Frecuencia cardiaca en latidos por minuto
    FrecuenciaRespiratoria INT,         -- Frecuencia respiratoria en respiraciones por minuto
    PresionArterial VARCHAR(50),        -- Presión arterial (por ejemplo, '120/80')
    Temperatura DECIMAL(4,1),           -- Temperatura en grados Celsius
    SaturacionOxigeno DECIMAL(5,2),    -- Saturación de oxígeno en porcentaje
    NivelConsciencia INT,               -- Nivel de consciencia (escala de Glasgow, por ejemplo)
    Edad INT,                           -- Edad del paciente en años
    TiempoSintomas DECIMAL(5,2);        -- Tiempo desde la aparición de los síntomas en horas o días

-- Crear un campo para almacenar la prioridad calculada (1=Rojo, 5=Azul)
ALTER TABLE Urgencias
ADD Prioridad INT;

-- Crear procedimiento almacenado para calcular la prioridad
DELIMITER $$

CREATE PROCEDURE CalcularPrioridadPaciente (IN urgencias_id INT)
BEGIN
    DECLARE fc INT;
    DECLARE fr INT;
    DECLARE pa VARCHAR(50);
    DECLARE temp DECIMAL(4,1);
    DECLARE so DECIMAL(5,2);
    DECLARE nc INT;
    DECLARE edad INT;
    DECLARE tiempo DECIMAL(5,2);
    DECLARE prioridad INT;

    -- Obtener los valores de los parámetros de la urgencia
    SELECT 
        FrecuenciaCardiaca, 
        FrecuenciaRespiratoria, 
        PresionArterial, 
        Temperatura, 
        SaturacionOxigeno, 
        NivelConsciencia, 
        Edad, 
        TiempoSintomas
    INTO 
        fc, fr, pa, temp, so, nc, edad, tiempo
    FROM Urgencias
    WHERE UrgenciasID = urgencias_id;

    -- Cálculo de la prioridad basado en los parámetros
    SET prioridad = 5; -- Prioridad inicial (menor prioridad: Azul)

    -- Lógica de prioridad (simplificada; ajusta según los criterios médicos)
    IF fc > 120 OR fr > 30 OR so < 90 OR nc < 8 THEN
        SET prioridad = 1; -- Rojo (emergencia grave)
    ELSEIF fc BETWEEN 100 AND 120 OR fr BETWEEN 20 AND 30 OR temp > 39 THEN
        SET prioridad = 2; -- Naranja (alta prioridad)
    ELSEIF tiempo < 2 AND (temp > 38 OR edad > 75) THEN
        SET prioridad = 3; -- Amarillo (urgente)
    ELSEIF tiempo BETWEEN 2 AND 6 AND (fc BETWEEN 60 AND 100) THEN
        SET prioridad = 4; -- Verde (semiurgente)
    END IF;

    -- Actualizar la prioridad en la tabla Urgencias
    UPDATE Urgencias
    SET Prioridad = prioridad
    WHERE UrgenciasID = urgencias_id;

END$$

DELIMITER ;
