/* Relación tipo 1:1 */
-- PASO 1
ALTER TABLE usuarios ADD COLUMN id_rol INT;

-- PASO 2
ALTER TABLE usuarios ADD FOREIGN KEY (id_rol) REFERENCES roles(id_rol);


-- PASO 3
UPDATE usuarios.usuarios SET id_rol = 1 WHERE id_usuario = 1
UPDATE usuarios.usuarios SET id_rol = 2 WHERE id_usuario = 2
UPDATE usuarios.usuarios SET id_rol = 3 WHERE id_usuario = 3
UPDATE usuarios.usuarios SET id_rol = 4 WHERE id_usuario = 4
UPDATE usuarios.usuarios SET id_rol = 1 WHERE id_usuario = 5
UPDATE usuarios.usuarios SET id_rol = 2 WHERE id_usuario = 6
UPDATE usuarios.usuarios SET id_rol = 3 WHERE id_usuario = 7
UPDATE usuarios.usuarios SET id_rol = 4 WHERE id_usuario = 8
UPDATE usuarios.usuarios SET id_rol = 1 WHERE id_usuario = 9
UPDATE usuarios.usuarios SET id_rol = 2 WHERE id_usuario = 10
UPDATE usuarios.usuarios SET id_rol = 3 WHERE id_usuario = 11
UPDATE usuarios.usuarios SET id_rol = 4 WHERE id_usuario = 12
UPDATE usuarios.usuarios SET id_rol = 1 WHERE id_usuario = 13
UPDATE usuarios.usuarios SET id_rol = 2 WHERE id_usuario = 14
UPDATE usuarios.usuarios SET id_rol = 3 WHERE id_usuario = 15
UPDATE usuarios.usuarios SET id_rol = 4 WHERE id_usuario = 16
UPDATE usuarios.usuarios SET id_rol = 1 WHERE id_usuario = 17
UPDATE usuarios.usuarios SET id_rol = 2 WHERE id_usuario = 18
UPDATE usuarios.usuarios SET id_rol = 3 WHERE id_usuario = 19
UPDATE usuarios.usuarios SET id_rol = 4 WHERE id_usuario = 20

-- PASO 4
SELECT
    usuarios.id_usuario,
    usuarios.nombre,
    usuarios.apellido,
    usuarios.email,
    usuarios.edad,
    roles.nombre_rol
FROM
    usuarios
JOIN
roles ON usuarios.id_rol = roles.id_rol;

/* Relación tipo 1:N */
-- PASO 1
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(100) NOT NULL
);

INSERT INTO categorias (nombre_categoria) VALUES
('Electrónicos'),
('Ropa y Accesorios'),
('Libros'),
('Hogar y Cocina'),
('Deportes y aire libre'),
('Salud y cuidado personal'),
('Herramientas y mejoras para el hogar'),
('Juguetes y juegos'),
('Automotriz'),
('Música y Películas');


-- PASO 2
ALTER TABLE usuarios ADD COLUMN id_categoria INT;


-- PASO 3
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (1, 5, 9, 13, 17);



-- PASO 4
SELECT
    usuarios.id_usuario,
    usuarios.nombre,
    usuarios.apellido,
    usuarios.email,
    usuarios.edad,
    roles.nombre_rol,
    categorias.nombre_categoria
FROM
    usuarios
JOIN
    roles ON usuarios.id_rol = roles.id_rol
JOIN
    categorias ON usuarios.id_categoria = categorias.id_categoria;

/* Relación tipo N:M */
-- PASO 1
CREATE TABLE usuarios_categorias (
    id_usuario_categoria INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_categoria INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);


-- PASO 2
INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9), (4, 10);


-- PASO 3
SELECT
    usuarios.id_usuario,
    usuarios.nombre,
    usuarios.apellido,
    usuarios.email,
    usuarios.edad,
    roles.nombre_rol,
    categorias.nombre_categoria
FROM
    usuarios
JOIN
    roles ON usuarios.id_rol = roles.id_rol
JOIN
    usuarios_categorias ON usuarios.id_usuario = usuarios_categorias.id_usuario
JOIN
    categorias ON usuarios_categorias.id_categoria = categorias.id_categoria;
