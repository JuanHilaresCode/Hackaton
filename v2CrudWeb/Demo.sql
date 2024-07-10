-- Table: user_role
CREATE TABLE dbo.user_role
(
    role_id INT PRIMARY KEY IDENTITY (1,1),
    -- Identificador único del rol
    role_name VARCHAR(50) CHECK (role_name IN ('Administrador', 'Conductor', 'Cliente')),
    -- Nombre del rol
    role_state CHAR(1) DEFAULT 'A' CHECK (role_state IN ('A', 'I'))
    -- Estado del rol ('A' = Activo, 'I' = Inactivo)
);

-- Table: client
CREATE TABLE dbo.client
(
    client_id INT PRIMARY KEY IDENTITY (1,1),
    -- Identificador único del cliente
    first_name VARCHAR(50) NOT NULL,
    -- Nombre del cliente
    last_name VARCHAR(50) NOT NULL,
    -- Apellido del cliente
    document_type CHAR(3) NOT NULL CHECK (document_type IN ('DNI', 'CNE')),
    -- Tipo de documento ('DNI', 'CNE')
    document_number VARCHAR(15) NOT NULL CHECK (LEN(document_number) BETWEEN 8 AND 15),
    -- Número de documento
    birth_date DATE NOT NULL CHECK (DATEDIFF(YEAR, birth_date, GETDATE()) >= 18),
    -- Fecha de nacimiento (mayor de 18 años)
    email VARCHAR(50) NOT NULL CHECK (email LIKE '%_@__%.__%'),
    -- Email del cliente
    phone VARCHAR(15) NOT NULL,
    -- Teléfono del cliente
    address VARCHAR(100) NOT NULL,
    -- Dirección del cliente
    gender CHAR(1) NOT NULL CHECK (gender IN ('M', 'F')),
    -- Género del cliente ('M' = Masculino, 'F' = Femenino)
    client_state CHAR(1) DEFAULT 'A' NOT NULL CHECK (client_state IN ('A', 'I')),
    -- Estado del cliente ('A' = Activo, 'I' = Inactivo)
    photo VARBINARY(MAX),
    -- Foto del cliente
    role_id INT DEFAULT 3 CHECK (role_id = 3),
    -- Identificador del rol (por defecto 3 = Cliente)
    FOREIGN KEY (role_id) REFERENCES dbo.user_role (role_id)
    -- Llave foránea a user_role
);

-- Table: admin
CREATE TABLE dbo.admin
(
    admin_id INT PRIMARY KEY IDENTITY (1,1),
    -- Identificador único del administrador
    first_name VARCHAR(70) NOT NULL,
    -- Nombre del administrador
    last_name VARCHAR(80) NOT NULL,
    -- Apellido del administrador
    document_type CHAR(3) NOT NULL CHECK (document_type IN ('DNI', 'CNE')),
    -- Tipo de documento ('DNI', 'CNE')
    document_number VARCHAR(15) NOT NULL CHECK (LEN(document_number) BETWEEN 8 AND 15),
    -- Número de documento
    birth_date DATE NOT NULL CHECK (DATEDIFF(YEAR, birth_date, GETDATE()) >= 18),
    -- Fecha de nacimiento (mayor de 18 años)
    email VARCHAR(50) NOT NULL CHECK (email LIKE '%_@__%.__%'),
    -- Email del administrador
    phone CHAR(9) NOT NULL CHECK (LEN(phone) = 9),
    -- Teléfono del administrador
    gender CHAR(1) NOT NULL CHECK (gender IN ('M', 'F')),
    -- Género del administrador ('M' = Masculino, 'F' = Femenino)
    admin_state CHAR(1) DEFAULT 'A' NOT NULL CHECK (admin_state IN ('A', 'I')),
    -- Estado del administrador ('A' = Activo, 'I' = Inactivo)
    photo VARBINARY(MAX),
    -- Foto del administrador
    role_id INT DEFAULT 1 CHECK (role_id = 1),
    -- Identificador del rol (por defecto 1 = Administrador)
    FOREIGN KEY (role_id) REFERENCES dbo.user_role (role_id)
    -- Llave foránea a user_role
);


-- Table: user
CREATE TABLE dbo.[user]
(
    user_id INT PRIMARY KEY IDENTITY (1,1),
    -- Identificador único del usuario
    username VARCHAR(50) NOT NULL,
    -- Nombre de usuario
    password VARCHAR(50) NOT NULL,
    -- Contraseña del usuario
    user_state CHAR(1) DEFAULT 'A' CHECK (user_state IN ('A', 'I')),
    -- Estado del usuario ('A' = Activo, 'I' = Inactivo)
    role_id INT NOT NULL,
    -- Identificador del rol
    FOREIGN KEY (role_id) REFERENCES dbo.user_role (role_id)
    -- Llave foránea a user_role
    );

-- Table: driver
CREATE TABLE dbo.driver
(
    driver_id INT IDENTITY (1,1) PRIMARY KEY,
    -- Identificador único del conductor
    first_name VARCHAR(70) NOT NULL,
    -- Nombre del conductor
    last_name VARCHAR(80) NOT NULL,
    -- Apellido del conductor
    document_type CHAR(3) NOT NULL CHECK (document_type IN ('DNI', 'CNE')),
    -- Tipo de documento ('DNI', 'CNE')
    document_number VARCHAR(15) UNIQUE NOT NULL CHECK (LEN(document_number) BETWEEN 8 AND 15),
    -- Número de documento
    email VARCHAR(50) NOT NULL CHECK (email LIKE '%_@__%.__%'),
    -- Email del conductor
    phone CHAR(9) NOT NULL CHECK (LEN(phone) = 9),
    -- Teléfono del conductor
    birth_date DATE NOT NULL CHECK (DATEDIFF(YEAR, birth_date, GETDATE()) >= 18),
    -- Fecha de nacimiento (mayor de 18 años)
    type_license VARCHAR(6) NOT NULL CHECK (type_license IN ('A-I', 'A-IIa', 'A-IIb', 'A-IIIa', 'A-IIIb', 'A-IIIc', 'B-I', 'B-IIa', 'B-IIb', 'B-IIc')),
    -- Tipo de licencia
    license_number VARCHAR(20) NOT NULL,
    -- Número de licencia
    license_status CHAR(1) DEFAULT 'A' CHECK (license_status IN ('A', 'I')),
    -- Estado de la licencia ('A' = Activo, 'I' = Inactivo)
    license_expiry_date DATE NOT NULL,
    -- Fecha de vencimiento de la licencia
    hire_date DATE NOT NULL,
    -- Fecha de contratación
    gender CHAR(1) NOT NULL CHECK (gender IN ('M', 'F')),
    -- Género del conductor ('M' = Masculino, 'F' = Femenino)
    address VARCHAR(100) NOT NULL,
    -- Dirección del conductor
    photo VARBINARY(MAX),
    -- Foto del conductor
    driver_status CHAR(1) DEFAULT 'A' CHECK (driver_status IN ('A', 'I')),
    -- Estado del conductor ('A' = Activo, 'I' = Inactivo)
    notes TEXT,
    -- Notas adicionales
    role_id INT DEFAULT 2 CHECK (role_id = 2),
    -- Identificador del rol (por defecto 2 = Conductor)
    FOREIGN KEY (role_id) REFERENCES dbo.user_role (role_id)
    -- Llave foránea a user_role
);


-- Table: vehicle
CREATE TABLE dbo.vehicle
(
    vehicle_id INT IDENTITY (1,1) PRIMARY KEY,
    -- Identificador único del vehículo
    driver_id INT NOT NULL,
    -- Identificador del conductor
    make VARCHAR(50) NOT NULL,
    -- Marca del vehículo
    model VARCHAR(50) NOT NULL,
    -- Modelo del vehículo
    acquisition_date DATE NOT NULL,
    -- Fecha de adquisición del vehículo
    license_plate VARCHAR(10) UNIQUE NOT NULL,
    -- Placa del vehículo
    color VARCHAR(20) NOT NULL,
    -- Color del vehículo
    seat_count INT NOT NULL CHECK (seat_count IN (4, 7)),
    -- Cantidad de asientos (4 o 7)
    status CHAR(1) DEFAULT 'A' CHECK (status IN ('A', 'I')),
    -- Estado del vehículo ('A' = Activo, 'I' = Inactivo)
    vehicle_image VARBINARY(MAX)
        FOREIGN KEY (driver_id) REFERENCES dbo.driver (driver_id)
    -- Llave foránea a driver
);


-- Table: routes
CREATE TABLE dbo.routes
(
    route_id INT IDENTITY (1,1) PRIMARY KEY,
    -- Identificador único de la ruta
    origin VARCHAR(50) NOT NULL,
    -- Origen de la ruta
    destination VARCHAR(50) NOT NULL,
    -- Destino de la ruta
    distance DECIMAL(10, 2) NOT NULL,
    -- Distancia de la ruta en kilómetros
    duration_in_minutes INT NOT NULL,
    -- Duración de la ruta en minutos
    description VARCHAR(255),
    -- Descripción de la ruta
    status CHAR(1) DEFAULT '1' CHECK (status IN ('0', '1'))
    -- Estado de la ruta ('0' = Inactiva, '1' = Activa)
);

-- Actualización de registros en tabla maestra
UPDATE dbo.user_role
SET role_name = 'Conductor'
WHERE role_id = 2;

-- Eliminación lógica de registros en tabla maestra
UPDATE dbo.user_role
SET role_state = 'I'
WHERE role_id = 3;

-- Listado de registros en tabla maestra
SELECT *
FROM dbo.user_role;

-- Actualización de registros en tabla transaccional
UPDATE dbo.driver
SET phone = '987654321'
WHERE driver_id = 1;

-- Eliminación lógica de registros en tabla transaccional
UPDATE dbo.driver
SET driver_status = 'I'
WHERE driver_id = 2;

-- Listado de registros en tabla transaccional
SELECT *
FROM dbo.driver;

-- Consulta con predicados, cláusula WHERE, operadores lógicos, BETWEEN, LIKE e IN
-- Ejemplo 1: Predicados y cláusula WHERE con operadores lógicos y BETWEEN
SELECT *
FROM dbo.client
WHERE gender = 'F' AND birth_date BETWEEN '1980-01-01' AND '2000-12-31';

-- Ejemplo 2: Predicado LIKE y cláusula IN
SELECT *
FROM dbo.driver
WHERE document_number LIKE '123%' OR document_number IN ('456789', '987654');

-- Ejemplo 3: Uso de operadores lógicos y BETWEEN
SELECT *
FROM dbo.vehicle
WHERE seat_count = 7 AND status = 'A' AND acquisition_date BETWEEN '2020-01-01' AND '2022-12-31';

-- Procedimiento almacenado con IF
-- Este procedimiento actualiza el estado de un conductor (Activo o Inactivo)
CREATE PROCEDURE sp_UpdateDriverStatus
    @driver_id INT,
    @new_status CHAR(1)
AS
BEGIN
    IF @new_status IN ('A', 'I')
BEGIN
UPDATE dbo.driver
SET driver_status = @new_status
WHERE driver_id = @driver_id;
END
ELSE
BEGIN
        PRINT 'Error: El estado debe ser "A" (Activo) o "I" (Inactivo).';
END
END;

-- Procedimiento almacenado con CASE
-- Este procedimiento devuelve información del conductor con una clasificación según la edad
CREATE PROCEDURE sp_GetDriverInfo
    @driver_id INT
AS
BEGIN
SELECT
    driver_id,
    first_name,
    last_name,
    CASE
        WHEN DATEDIFF(YEAR, birth_date, GETDATE()) >= 25 THEN 'Senior'
        WHEN DATEDIFF(YEAR, birth_date, GETDATE()) >= 18 THEN 'Adulto'
        ELSE 'Joven'
        END AS age_group,
    gender,
    address
FROM dbo.driver
WHERE driver_id = @driver_id;
END;

-- Procedimiento almacenado con WHILE
-- Este procedimiento lista todos los conductores activos en una tabla temporal
CREATE PROCEDURE sp_GetActiveDrivers
    AS
BEGIN
    DECLARE @driver_id INT;
    DECLARE @driver_count INT = 0;

    -- Tabla temporal para almacenar los conductores activos
CREATE TABLE #ActiveDrivers (
                                driver_id INT,
                                first_name VARCHAR(70),
                                last_name VARCHAR(80),
                                gender CHAR(1),
                                address VARCHAR(100)
);

-- Cursor para recorrer los conductores activos
DECLARE driver_cursor CURSOR FOR
SELECT driver_id
FROM dbo.driver
WHERE driver_status = 'A';

OPEN driver_cursor;
FETCH NEXT FROM driver_cursor INTO @driver_id;

-- Iterar a través de los conductores activos
WHILE @@FETCH_STATUS = 0
BEGIN
        -- Insertar datos del conductor activo en la tabla temporal
INSERT INTO #ActiveDrivers (driver_id, first_name, last_name, gender, address)
SELECT driver_id, first_name, last_name, gender, address
FROM dbo.driver
WHERE driver_id = @driver_id;

-- Contar el número de conductores activos
SET @driver_count = @driver_count + 1;
FETCH NEXT FROM driver_cursor INTO @driver_id;
END;

    -- Cerrar y liberar el cursor
CLOSE driver_cursor;
DEALLOCATE driver_cursor;

    -- Seleccionar todos los conductores activos de la tabla temporal
SELECT * FROM #ActiveDrivers;

-- Eliminar la tabla temporal después de su uso
DROP TABLE #ActiveDrivers;
END;
