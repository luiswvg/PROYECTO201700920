CREATE TABLE usuario (
	usuarioid INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	usuario VARCHAR (50) NOT NULL,
	tipousuario VARCHAR (50) NOT NULL, -- administrador o cliente
	nacimiento DATE NOT NULL,
	contraseña VARCHAR(50) NOT NULL
);

CREATE TABLE bitacora (
	bitacoraid INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
	fecha DATETIME,
	usuario VARCHAR(50) NOT NULL,
	direccionip VARCHAR(50) NOT NULL,
	accion VARCHAR(254)
);

CREATE TABLE editorial (
editorialid INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
direccion VARCHAR(50) NOT NULL,
telefono INTEGER NOT NULL
);

CREATE TABLE genero(
generoid INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

CREATE TABLE libro(
libroid INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
editorialid2 INTEGER   NOT NULL,
idgenero INTEGER NOT NULL,
titulo VARCHAR (50) NOT NULL,
cantidad INT NOT NULL,
CONSTRAINT editorialfk FOREIGN KEY (editorialid2) REFERENCES editorial(editorialid),
CONSTRAINT generofk FOREIGN KEY (idgenero) REFERENCES GENERO(generoid)
);

CREATE TABLE prestamo(
idprestamo INTEGER IDENTITY(1,1) NOT  NULL PRIMARY KEY,
estatus BIT NOT NULL,
idusuario INTEGER NOT NULL,
idlibro INTEGER NOT NULL,
CONSTRAINT usuariofk FOREIGN KEY (idusuario) REFERENCES USUARIO(usuarioid),
CONSTRAINT librofk FOREIGN KEY (idlibro) REFERENCES LIBRO(libroid)
);

select *from usuario

SELECT editorial.nombre,genero.nombre,libro.titulo  FROM editorial 
JOIN libro  ON editorial.editorialid = libro.editorialid2
JOIN genero ON genero.generoid = LIBRO.editorialid2

SELECT editorial.nombre, editorial.direccion,libro.cantidad FROM editorial
JOIN libro ON editorial.editorialid = libro.editorialid2


SELECT prestamo.estatus, libro.titulo ,libro.cantidad FROM prestamo
JOIN libro ON prestamo.idprestamo = LIBRO.libroid

SELECT  libro.titulo ,libro.cantidad FROM prestamo
JOIN libro ON prestamo.idprestamo = libro.libroid

INSERT INTO genero VALUES ('Terror');
INSERT INTO genero VALUES ('Aventura');
INSERT INTO genero VALUES ('Drama');
INSERT INTO genero VALUES ('Tragedia');

INSERT INTO editorial VALUES ('Norma Editorial','España',546549875);
INSERT INTO editorial VALUES ('IVREA','Argentina',2135468765);
INSERT INTO editorial VALUES ('Viz Media','Estados Unidos de America',12345);
INSERT INTO editorial VALUES ('Square enix editorial','Estados Unidos de America',35465);

INSERT INTO libro VALUES (1,1,'La casa de papel',1);
INSERT INTO libro VALUES (2,2,'Fairy tail',1);
INSERT INTO libro VALUES (1,3,'The fault in our stars',1);
INSERT INTO libro VALUES (2,3,'Me before you',1);
INSERT INTO libro VALUES (1,2,'Edens Zero',2);

select *from libro
select *from genero
select *from editorial
select *from usuario