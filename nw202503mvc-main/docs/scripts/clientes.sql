
CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    telefono VARCHAR(20),
    estado VARCHAR(20)
);


INSERT INTO clientes (nombre, correo, telefono, estado) VALUES
('Pedro Dominguez', 'PedrMinguez@gmail.com', '555-1234', 'Activo'),
('Maria Alvarez', 'marialvarez@gmail.com', '555-5678', 'Activo'),
('Carlos Santiago', 'carlosanti@gmail.com', '555-8765', 'Inactivo'),
('Ana Lopez', 'analopez@gmail.com', '555-4321', 'Activo'),
('Jose Martinez', 'josemarti@gmail.com', '555-1111', 'Inactivo'),
('Laura Fernandez', 'lauraFernandez@gmail.com', '555-2222', 'Activo'),
('Miguel Sanchez', 'miguelsanchez@gmail.com', '555-3333', 'Activo'),
('Sofia Velasco', 'sofiavelasco@gmail.com', '555-4444', 'Activo'),
('Richard Flores', 'richardflores@gmail.com', '555-5555', 'Inactivo'),
('Isabel Cruz', 'isabelcruz@gmail.com', '555-6666', 'Activo'),
('Fernando Gomez', 'fernandogomez@gmail.com', '555-7777', 'Activo'),
('Patricia Ortega', 'patriciaortega@gmail.com', '555-8888', 'Activo'),
('Alex Rojas', 'alexrojas@gmail.com', '555-9999', 'Inactivo'),
('Gabriela Mendoza', 'gabrielamendoza@gmail.com', '555-0001', 'Activo'),
('Luis Santos', 'luissantos@gmail.com', '555-1010', 'Activo'),
('Veronica Suarez', 'veronicasuarez@gmail.com', '555-2020', 'Activo'),
('Diego Castillo', 'diegocastillo@gmail.com', '555-3030', 'Inactivo'),
('Natalia Gimenez', 'nataliagimenez@gmail.com', '555-4040', 'Activo'),
('Oscar Flores', 'oscarflores@gmail.com', '555-5050', 'Activo'),
('Carmen Torres', 'carmentorres@gmail.com', '555-6060', 'Activo');