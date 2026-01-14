create database kickstarter
use kickstarter;


select * from Usuario
/*==================================================
TABLAS
===================================================*/

create table Usuario(
ID_User int, 
nombre char(10), 
email char(50), 
contrasena char(50), 
imagen varchar(200), 
descripcion char(250)
);

create table Proyectos(
ID_Proyecto int,
ID_User int,
ID_Categoria int,
titulo char(50),
descripcion char(250),
imagenes varchar (200),
estatus varchar(100),
cantidad_donaciones int,
monto_total decimal(10,2),
cantidad_comentarios int
);

create table Donaciones (
ID_Donaciones int,
ID_User int,
ID_Proyecto int,
Fecha_Donaciones datetime,
estatus varchar(40),
Monto decimal(10,2)
);

create table categorias (
ID_Categorias int,
nombre char(10),
descriopcion char (250)
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
MODIFY contrasena VARCHAR(255) NOT NULL;

ALTER TABLE categorias
MODIFY nombre VARCHAR(50) NOT NULL;

ALTER TABLE proyectos
MODIFY titulo VARCHAR(100) NOT NULL,
MODIFY descripcion TEXT NOT NULL;
ALTER TABLE donaciones
MODIFY Fecha_Donaciones DATETIME NOT NULL,
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
ADD CONSTRAINT chk_usuario_pass CHECK (CHAR_LENGTH(contrasena) >= 3);

ALTER TABLE categorias
ADD CONSTRAINT chk_categoria_nombre CHECK (CHAR_LENGTH(nombre) >= 3);

ALTER TABLE proyectos
ADD CONSTRAINT chk_proyecto_titulo CHECK (CHAR_LENGTH(titulo) >= 3);

-- default
alter table proyectos
alter column monto_total set default 0;

alter table proyectos
alter column cantidad_donaciones set default 0;

alter table proyectos
alter column cantidad_comentarios set default 0;

/*==================================================
PROCEDIMIENTOS ALMACENADOS
===================================================*/
/*------- 
Usuarios
--------*/
DELIMITER $$ 
-- insertar usuario
create procedure insertar_usuario(
in p_nombre char(10),
in p_email char(50),
in p_contrasena char(50),
in p_imagen varchar(200), 
in p_descripcion char(250)
) 
begin 
	insert into Usuario(nombre,email,contrasena,imagen,descripcion)
	values (p_nombre,p_email,p_contrasena,p_imagen,p_descripcion);
end $$
DELIMITER $$ 

DELIMITER $$ 
-- modificar usuario
create procedure modificar_usuario(
in p_id_user int,
in p_nombre char(10),
in p_email char,
in p_contraseña char, 
in p_imagen varchar(200), 
in p_descriopcion char
)
begin 
	update Usuario 
    set  
    nombre = p_nombre,
	email  = p_email,
	contraseña = p_contraseña,
    imagen = p_imagen,
	descriopcion = p_descriopcion
    
    where ID_User = p_id_user;
end $$
DELIMITER $$ 

-- eliminar usuario
DELIMITER $$ 
create procedure eliminar_usuario(
	in p_id_user int
)
begin 
	delete from Usuario where ID_User = p_id_user;
end $$
DELIMITER $$ 

-- consultar usuario
DELIMITER $$ 
create procedure obtener_usuario (
	in p_id_user int
) 
begin 
 select * from Usuario where ID_User = p_id_user;
end $$
DELIMITER $$ 

/*------- 
Proyectos
--------*/ 
-- insertar proyectos
DELIMITER $$ 
create procedure insertar_proyecto (
in p_id_user int,
in p_id_Categoria int,
in p_titulo char(50),
in p_descripcion char(250),
in p_imagenes varchar (200),
in p_estatus char(100),
in p_cantidad_donaciones int,
in p_monto_total decimal(10,2),
in p_cantidad_comentarios int
)
begin 
	insert into Proyectos(ID_User,ID_Categoria,titulo,descripcion,imagenes,estatus,cantidad_donaciones,monto_total,cantidad_comentarios)
	values(p_id_user,p_id_Categoria,p_titulo,p_descripcion,p_imagenes,p_estatus,p_cantidad_donaciones,p_monto_total,p_cantidad_comentarios);
end $$
DELIMITER $$ 

-- modificar proyectos
DELIMITER $$ 
create procedure modificar_proyecto (
in p_id_proyecto int,
in p_id_user int,
in p_id_Categoria int,
in p_titulo char(50),
in p_descripcion char(250),
in p_imagenes varchar (200),
in p_estatus char(100),
in p_cantidad_donaciones int,
in p_monto_total decimal(10,2),
in p_cantidad_comentarios int
)
begin 
	update Proyectos set 
   p_id_user = ID_User,
   p_id_Categoria = ID_Categoria,
   p_titulo = titulo,
   p_descripcion= descripcion,
   p_imagenes= imagenes,
   p_estatus= estatus,
   p_cantidad_donaciones = cantidad_donaciones ,
   p_monto_total = monto_total ,
   p_cantidad_comentarios= cantidad_comentarios 
   
   where ID_Proyecto = p_id_proyecto;
    
end $$
DELIMITER $$ 

-- eliminar proyectos
DELIMITER $$ 
create procedure eliminar_proyecto (
in p_id_proyecto int
)
begin 
	delete from Proyectos where ID_Proyecto = p_id_proyecto;
end $$
DELIMITER $$ 

-- obtener proyectos
DELIMITER $$ 
create procedure obtener_proyectos (
in p_id_proyecto int
)
begin 
	select * from  Proyectos where ID_Proyecto = p_id_proyecto;
end $$
DELIMITER $$ 

/*------- 
Donaciones
--------*/ 
-- insertar donaciones
DELIMITER $$ 
create procedure insertar_donaciones(
in p_id_user int,
in p_id_proyecto int,
in p_fecha_donaciones datetime,
in p_estatus char(40),
in p_monto decimal(10,2)
)
begin 
	insert into Proyectos(ID_User,ID_Proyecto,Fecha_Donaciones,estatus,Monto)
	values(p_id_user,p_id_proyecto,p_fecha_donaciones,p_estatus,p_monto);
end $$
DELIMITER $$ 

-- modificar donaciones
DELIMITER $$ 
create procedure modificar_donaciones (
in p_id_donaciones int,
in p_id_user int,
in p_id_proyecto int,
in p_fecha_donaciones datetime,
in p_estatus char(40),
in p_monto decimal(10,2)
)
begin 
	update Donaciones set 
	p_id_user = ID_User,
	p_id_proyecto = ID_Proyecto,
	p_fecha_donaciones = Fecha_Donaciones,
	p_estatus = estatus,
	p_monto = Monto
   
   where ID_Donaciones = p_id_donaciones;
    
end $$
DELIMITER $$ 

-- eliminar donaciones
DELIMITER $$ 
create procedure eliminar_donaciones (
in p_id_donaciones int
)
begin 
	delete from Donaciones where ID_Donaciones = p_id_donaciones;
end $$
DELIMITER $$ 

-- obtener donaciones
DELIMITER $$ 
create procedure obtener_donaciones (
in p_id_donaciones int
)
begin 
	select * from  Donaciones where ID_Donaciones = p_id_donaciones;
end $$
DELIMITER $$ 

/*------- 
Categorias 
--------*/ 
-- insertar categorias
DELIMITER $$ 
create procedure insertar_categorias(
in p_nombre char(10),
in p_descriopcion char (250)
)
begin 
	insert into categorias(nombre,descriopcion)
	values(p_nombre,p_descriopcion);
end $$
DELIMITER $$ 

-- modificar categorias
DELIMITER $$ 
create procedure modificar_categorias (
in p_id_categorias int,
in p_nombre char(10),
in p_descriopcion char (250)
)
begin 
	update categorias set 
	p_nombre = nombre,
   p_descriopcion = descriopcion
   where ID_Categorias = p_id_categorias ;
    
end $$
DELIMITER $$ 

-- eliminar categorias
DELIMITER $$ 
create procedure eliminar_categorias (
in p_id_categorias int
)
begin 
	delete from categorias where ID_Categorias = p_id_categorias;
end $$
DELIMITER $$ 

-- obtener categorias 
DELIMITER $$ 
create procedure obtener_categorias (
in p_id_categorias int
)
begin 
	select * from categorias where ID_Categorias = p_id_categorias;
end $$
DELIMITER $$ 

/*------- 
Comentarios
--------*/ 
-- insertar comentarios
DELIMITER $$ 
create procedure insertar_comentario(
in p_id_User int,	
in p_id_Proyecto int,
in p_comentario varchar(200),
in p_fecha_comentario datetime
)
begin 
	insert into comentarios(ID_User,ID_Proyecto,comentario,fecha_comentario)
	values(p_id_User,p_id_Proyecto,p_comentario,p_fecha_comentario);
end $$
DELIMITER $$ 

-- modificar comentarios
DELIMITER $$ 
create procedure modificar_comentarios (
in p_id_comentarios int,
in p_id_User int,	
in p_id_Proyecto int,
in p_comentario varchar(200),
in p_fecha_comentario datetime
)
begin 
	update comentarios set 
	p_id_User = ID_User,
	p_id_Proyecto = ID_Proyecto,
    p_comentario = comentario,
    p_fecha_comentario = fecha_comentario
    
   where ID_Comentarios = p_id_comentarios;
end $$
DELIMITER $$ 

-- eliminar comentarios 
DELIMITER $$ 
create procedure eliminar_comentarios (
in p_id_comentarios int
)
begin 
	delete from comentarios where ID_Comentarios = p_id_comentarios;
end $$
DELIMITER $$ 

-- obtener comentarios
DELIMITER $$ 
create procedure obtener_comentarios (
in p_id_comentarios int
)
begin 
	select * from comentarios where ID_Comentarios = p_id_comentarios;
end $$
DELIMITER $$ 

/*==================================================
Triggers
===================================================*/
-- Proyectos

/*ingresa monto y cantidad despues de insercion*/
DELIMITER $$

CREATE TRIGGER trg_after_insert_donaciones
AFTER INSERT ON Donaciones
FOR EACH ROW
BEGIN
    
    UPDATE Proyectos
    SET 
        monto_total = monto_total + NEW.Monto,
        cantidad_donaciones = cantidad_donaciones + 1
    WHERE ID_Proyecto = NEW.ID_Proyecto;

END$$

DELIMITER ;

/*elimina monto y cantidad despues de eliminacion*/
DELIMITER $$

CREATE TRIGGER trg_donaciones_delete
AFTER DELETE ON Donaciones
FOR EACH ROW
BEGIN
    
    UPDATE Proyectos
    SET 
        monto_total = monto_total - OLD.Monto,
        cantidad_donaciones = cantidad_donaciones - 1
    WHERE ID_Proyecto = OLD.ID_Proyecto;

END$$

DELIMITER ;

/*aumenta comentarios despues de insercion*/
DELIMITER $$

CREATE TRIGGER trg_after_insert_comentarios
AFTER INSERT ON Comentarios
FOR EACH ROW
BEGIN
    
    UPDATE Proyectos
    SET 
        cantidad_comentarios = cantidad_comentarios + 1
    WHERE ID_Proyecto = NEW.ID_Proyecto;

END$$

DELIMITER ;

/*elimina comentario despues de eliminacion*/
DELIMITER $$

CREATE TRIGGER trg_proyecto_delete_comentario
AFTER DELETE ON comentarios
FOR EACH ROW
BEGIN
    
    UPDATE Proyectos
    SET 
        cantidad_comentarios = cantidad_comentarios - 1
    WHERE ID_Proyecto = OLD.ID_Proyecto;

END$$
DELIMITER ;

/*actualiza monto y cantidad despues de actualizar donacion*/
DELIMITER $$

CREATE TRIGGER trg_donaciones_update
AFTER UPDATE ON Donaciones
FOR EACH ROW
BEGIN

    IF OLD.ID_Proyecto = NEW.ID_Proyecto THEN

        UPDATE Proyectos
        SET monto_total = monto_total + (NEW.Monto - OLD.Monto)
        WHERE ID_Proyecto = NEW.ID_Proyecto;

    ELSE

        UPDATE Proyectos
        SET 
            monto_total = monto_total - OLD.Monto,
            cantidad_donaciones = cantidad_donaciones - 1
        WHERE ID_Proyecto = OLD.ID_Proyecto;

        UPDATE Proyectos
        SET
            monto_total = monto_total + NEW.Monto,
            cantidad_donaciones = cantidad_donaciones + 1
        WHERE ID_Proyecto = NEW.ID_Proyecto;

    END IF;

END$$

DELIMITER ;

-- soft delete de estatus en proyectos
DELIMITER $$

CREATE TRIGGER soft_delete_proyectos
BEFORE DELETE ON proyectos
FOR EACH ROW
BEGIN
    
    UPDATE proyectos
    SET estatus = 'Eliminado'
    WHERE ID_Proyecto = OLD.ID_Proyecto;

    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Soft delete: registro marcado como eliminado';

END$$

DELIMITER ;


-- soft delete de estatus en donaciones
DELIMITER $$

CREATE TRIGGER soft_delete_donaciones
BEFORE DELETE ON donaciones
FOR EACH ROW
BEGIN
    
    UPDATE donaciones
    SET estatus = 'Eliminado'
    WHERE ID_Donaciones = OLD.ID_Donaciones;

    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Soft delete: registro marcado como eliminado';

END$$

DELIMITER ;
