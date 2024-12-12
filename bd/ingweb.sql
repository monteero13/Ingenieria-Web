-- Creación de la tabla PersonalSanitario (superentidad) 
CREATE TABLE PersonalSanitario (
    PersonalID INT IDENTITY(1,1) PRIMARY KEY,  
    Nombre VARCHAR(255) NOT NULL,
    Apellidos VARCHAR(255) NOT NULL,
    CorreoElectronico VARCHAR(255) UNIQUE NOT NULL,
    Telefono VARCHAR(50),
    Contrasena VARCHAR(255) NOT NULL, -- Campo para login
    FechaRegistro DATETIME DEFAULT GETDATE()
);

-- Creación de la tabla PersonalTriaje (subentidad de PersonalSanitario)
CREATE TABLE PersonalTriaje (
    TriajeID INT IDENTITY(1,1) PRIMARY KEY,
    PersonalID INT NOT NULL,
    FOREIGN KEY (PersonalID) REFERENCES PersonalSanitario(PersonalID)
);

-- Creación de la tabla Médico (subentidad de PersonalSanitario)
CREATE TABLE Medico (
    MedicoID INT IDENTITY(1,1) PRIMARY KEY,
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
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(150) NOT NULL,
    CorreoElectronico VARCHAR(150) NOT NULL UNIQUE,
    Contrasena VARCHAR(100) NOT NULL
);

-- Tabla EstadoPaciente
CREATE TABLE EstadoPaciente (
    EstadoID INT PRIMARY KEY IDENTITY(1,1),
    Descripcion VARCHAR(100) NOT NULL -- Ejemplo: "En espera", "Atendido", "Dado de alta", "Fallecido"
);

-- Tabla Urgencias
CREATE TABLE Urgencias (
    UrgenciasID INT PRIMARY KEY IDENTITY(1,1),
    NumeroTarjeta INT NOT NULL,
    FechaIngreso DATETIME NOT NULL DEFAULT GETDATE(),
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
    NotificacionID INT PRIMARY KEY IDENTITY(1,1),
    UrgenciasID INT NOT NULL,
    Mensaje TEXT NOT NULL,
    Fecha DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (UrgenciasID) REFERENCES Urgencias(UrgenciasID)
);

-- Tabla Login
CREATE TABLE Login (
    LoginID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT NOT NULL, -- Puede ser Administrativo, PersonalTriaje o Médico
    TipoUsuario VARCHAR(50) NOT NULL, -- "Administrativo", "PersonalTriaje" o "Médico"
    FechaInicioSesion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaFinSesion DATETIME NULL
);


ALTER TABLE Login ADD AdministrativoID INT NULL;
ALTER TABLE Login ADD PersonalTriajeID INT NULL;
ALTER TABLE Login ADD MedicoID INT NULL;

-- Relaciones con los diferentes tipos de usuario
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
ALTER TABLE Urgencias
ADD MedicoAsignadoPor INT;
ALTER TABLE Paciente
ADD EnUrgencias BIT NOT NULL DEFAULT 0;
ALTER TABLE PersonalTriaje
ADD Disponible BIT NOT NULL DEFAULT 0;
ALTER TABLE Medico
ADD Disponible BIT NOT NULL DEFAULT 0;

CREATE TRIGGER ActualizarDisponibleLogin
ON Login
AFTER INSERT
AS
BEGIN
    -- Verifica si el usuario es un médico o personal de triaje
    IF EXISTS (SELECT 1 FROM inserted WHERE TipoUsuario IN ('Médico', 'PersonalTriaje','Paciente'))
    BEGIN
        -- Actualiza el campo Disponible en Medico o PersonalTriaje a 1 (disponible)
        UPDATE Medico
        SET Disponible = 1
        FROM Medico m
        INNER JOIN inserted i ON m.PersonalID = i.UsuarioID
        WHERE i.TipoUsuario = 'Médico';

        UPDATE PersonalTriaje
        SET Disponible = 1
        FROM PersonalTriaje p
        INNER JOIN inserted i ON p.PersonalID = i.UsuarioID
        WHERE i.TipoUsuario = 'PersonalTriaje';

    END
END;


CREATE TRIGGER ActualizarDisponibleLogout
ON Login
AFTER UPDATE
AS
BEGIN
    -- Verifica si se ha actualizado la columna FechaFinSesion
    IF UPDATE(FechaFinSesion)
    BEGIN
        -- Verifica si el usuario es un médico o personal de triaje y ha cerrado sesión
        IF EXISTS (SELECT 1 FROM inserted WHERE FechaFinSesion IS NOT NULL AND TipoUsuario IN ('Médico', 'PersonalTriaje'))
        BEGIN
            -- Actualiza el campo Disponible en Medico o PersonalTriaje a 0 (no disponible)
            UPDATE Medico
            SET Disponible = 0
            FROM Medico m
            INNER JOIN inserted i ON m.PersonalID = i.UsuarioID
            WHERE i.TipoUsuario = 'Médico';

            UPDATE PersonalTriaje
            SET Disponible = 0
            FROM PersonalTriaje p
            INNER JOIN inserted i ON p.PersonalID = i.UsuarioID
            WHERE i.TipoUsuario = 'PersonalTriaje';
        END
    END
END;

CREATE TRIGGER ActualizarPacienteEnUrgencias
ON Login
AFTER INSERT
AS
BEGIN
    -- Verifica si el tipo de usuario es Administrativo
    IF EXISTS (SELECT 1 FROM inserted WHERE TipoUsuario = 'Administrativo')
    BEGIN
        -- Actualiza el campo EnUrgencias en la tabla Paciente
        UPDATE Paciente
        SET EnUrgencias = 1
        FROM Paciente p
        INNER JOIN inserted i ON p.NumeroTarjeta = i.UsuarioID
        WHERE i.TipoUsuario = 'Administrativo';
    END
END;

CREATE TRIGGER LogoutPaciente
ON Urgencias
AFTER UPDATE
AS
BEGIN
    -- Verifica si se actualiza el estado del paciente a "Atendido" o "Fallecido"
    IF EXISTS (SELECT 1 FROM inserted i WHERE i.EstadoID IN (SELECT EstadoID FROM EstadoPaciente WHERE Descripcion IN ('Atendido', 'Fallecido')))
    BEGIN
        -- Actualiza el estado de urgencias a "Atendido" o "Fallecido"
        UPDATE Urgencias
        SET EstadoID = (SELECT EstadoID FROM EstadoPaciente WHERE Descripcion = 'Atendido') -- o 'Fallecido'
        WHERE UrgenciasID IN (SELECT UrgenciasID FROM inserted);

        -- Marca al paciente como no en urgencias (EnUrgencias = 0)
        UPDATE Paciente
        SET HistorialClinico = CONCAT(HistorialClinico, ' | Alta o fallecimiento registrado: ', GETDATE()) -- Añade un comentario al historial clínico
        WHERE NumeroTarjeta IN (SELECT NumeroTarjeta FROM inserted);

        -- Actualiza el campo EnUrgencias del paciente a 0
        UPDATE Urgencias
        SET EstadoID = (SELECT EstadoID FROM EstadoPaciente WHERE Descripcion = 'Atendido') -- o 'Fallecido'
        WHERE NumeroTarjeta IN (SELECT NumeroTarjeta FROM inserted);
    END
END;

CREATE TRIGGER VerificarFallecimiento
ON Urgencias
AFTER INSERT
AS
BEGIN
    -- Verifica si el paciente que está ingresando a urgencias tiene un estado "Fallecido" en su última visita
    DECLARE @NumeroTarjeta INT;
    DECLARE @UltimaVisitaEstado INT;

    -- Obtiene el número de tarjeta del paciente ingresado
    SELECT @NumeroTarjeta = NumeroTarjeta FROM inserted;

    -- Obtiene el estado de la última visita del paciente
    SELECT TOP 1 @UltimaVisitaEstado = EstadoID
    FROM Urgencias
    WHERE NumeroTarjeta = @NumeroTarjeta
    ORDER BY FechaIngreso DESC;

    -- Si la última visita fue de estado "Fallecido", no permitir ingresar al paciente en urgencias
    IF EXISTS (SELECT 1 FROM EstadoPaciente WHERE EstadoID = @UltimaVisitaEstado AND Descripcion = 'Fallecido')
    BEGIN
        -- Cancela la inserción en urgencias
        RAISERROR('El paciente fue declarado fallecido en su última visita. No puede ser ingresado en urgencias nuevamente.', 16, 1);
        ROLLBACK TRANSACTION;  -- Rechaza la inserción
    END
END;
