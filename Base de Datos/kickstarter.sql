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
Restricciones  provando actu
===================================================*/

/*Samuel el papi chulo*/ 
