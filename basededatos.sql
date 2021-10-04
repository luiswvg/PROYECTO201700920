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

CREATE TABLE libro (
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