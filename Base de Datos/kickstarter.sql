use kickstarter;
 
/*==================================================
TABLAS
===================================================*/

create table Usuario(
ID_User int, 
nombre char(10), 
email char, 
contraseña char, 
imagen varchar(200), 
descriopcion char
);

create table Proyectos(
ID_Proyecto int,
ID_User int,
ID_Categoria int,
titulo char,
descripcion char,
imagenes varchar (200),
estatus char
);

create table Donaciones (
ID_Donaciones int,
ID_User int,
ID_Proyecto int,
Fecha_Donaciones datetime,
estatus char,
Monto decimal(10,2)
);

create table categorias (
ID_Categorias int,
nombre char(10),
descriopcion char
);

create table comentarios (
ID_Comentarios int,
ID_User int,	
ID_Proyecto int,
comentario varchar(200),
fecha_comentario datetime
);

/*==================================================
PRIMARY KEYS
===================================================*/
alter table Usuario add constraint pk_usuario primary key (ID_User);
alter table Proyectos add constraint pk_proyectos primary key (ID_Proyecto);
alter table Donaciones add constraint pk_donaciones primary key (ID_Donaciones);
alter table categorias add constraint pk_categorias primary key (ID_Categorias);
alter table comentarios add constraint pk_comentarios primary key (ID_Comentarios);
/*==================================================
AUTO_INCREMENT
===================================================*/
alter table Usuario modify ID_User int not null auto_increment;
alter table Proyectos modify ID_Proyecto int not null auto_increment;
alter table Donaciones modify ID_Donaciones int not null auto_increment;
alter table categorias modify ID_Categorias int not null auto_increment;
alter table comentarios modify ID_Comentarios int not null auto_increment;

/*==================================================
RELACIONES 
===================================================*/
-- Proyectos
alter table Proyectos add constraint fk_proyecto_usuario foreign key (ID_User) references Usuario(ID_User);
alter table Proyectos add constraint fk_proyecto_categorias foreign key (ID_Categoria) references categorias(ID_Categorias);

-- Donaciones
alter table Donaciones add constraint fk_donaciones_usuario foreign key (ID_User) references Usuario(ID_User);
alter table Donaciones add constraint fk_donaciones_proyecto foreign key (ID_Proyecto) references Proyectos(ID_Proyecto);

-- Comentarios
alter table comentarios add constraint fk_comentario_usuario foreign key (ID_User) references Usuario(ID_User);
alter table comentarios add constraint fk_comentario_proyecto foreign key (ID_Proyecto) references Proyectos(ID_Proyecto);

/*==================================================
Restricciones
===================================================*/

-- not null
ALTER TABLE usuario
MODIFY nombre VARCHAR(50) NOT NULL,
MODIFY email VARCHAR(100) NOT NULL,
MODIFY contraseña VARCHAR(255) NOT NULL;

ALTER TABLE categorias
MODIFY nombre VARCHAR(50) NOT NULL;

ALTER TABLE proyectos
MODIFY titulo VARCHAR(100) NOT NULL,
MODIFY descripcion TEXT NOT NULL,
MODIFY estatus char NOT NULL;

ALTER TABLE donaciones
MODIFY Fecha_Donaciones DATETIME NOT NULL,
MODIFY estatus char NOT NULL,
MODIFY Monto DECIMAL(10,2) NOT NULL;

ALTER TABLE comentarios
MODIFY comentario VARCHAR(200) NOT NULL,
MODIFY fecha_comentario DATETIME NOT NULL;

-- unique
ALTER TABLE usuario
ADD CONSTRAINT uq_usuario_email UNIQUE (email);

-- check
ALTER TABLE usuario
ADD CONSTRAINT chk_usuario_nombre CHECK (CHAR_LENGTH(nombre) >= 3),
ADD CONSTRAINT chk_usuario_pass CHECK (CHAR_LENGTH(contraseña) >= 3);

ALTER TABLE categorias
ADD CONSTRAINT chk_categoria_nombre CHECK (CHAR_LENGTH(nombre) >= 3);

ALTER TABLE proyectos
ADD CONSTRAINT chk_proyecto_titulo CHECK (CHAR_LENGTH(titulo) >= 3);




