-- Crear una base de datos con nombre “Posts”
CREATE DATABASE post
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;
---------------------------------------------------------------------------------------------------------------------


-- Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación, contenido y descripción.
CREATE TABLE public.post
(
    id integer,
    nombre_de_usuario character varying(25),
    fecha_de_creacion character varying(25),
    contenido character varying(25),
    descripcion character varying(25),
    PRIMARY KEY (id)
);
ALTER TABLE IF EXISTS public.post
    OWNER to postgres;
---------------------------------------------------------------------------------------------------------------------


-- Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".
INSERT INTO public.post(
	id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion)
	VALUES (1, 'Pamela', '30/11/2021', 'foto', 'Aqui con la familia');
	
INSERT INTO public.post(
	id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion)
	VALUES (2, 'Pamela', '29/11/2021', 'video', 'Amo el Karaoke');
	
INSERT INTO public.post(
	id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion)
	VALUES (3, 'Carlos', '25/11/2021', 'Audio', 'Una cancion nueva');
---------------------------------------------------------------------------------------------------------------------


-- Modificar la tabla post, agregando la columna título
ALTER TABLE post
    ADD titulo VARCHAR(25);
---------------------------------------------------------------------------------------------------------------------


-- Agregar título a las publicaciones ya ingresadas.
UPDATE POST SET titulo='familia'
WHERE id=1;

UPDATE POST SET titulo='karaoke'
WHERE id=2;

UPDATE POST SET titulo='cancion'
WHERE id=3;
---------------------------------------------------------------------------------------------------------------------


-- Insertar 2 post para el usuario "Pedro". 
INSERT INTO public.post(
	id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo)
	VALUES (4, 'Pedro', '20/11/2021', 'foto', 'Nuevo integrante!', 'mascota');
	
INSERT INTO public.post(
	id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo)
	VALUES (5, 'Pedro', '19/11/2021', 'video', 'Encontre trabajo!', 'trabajo');
---------------------------------------------------------------------------------------------------------------------


-- Eliminar el post de Carlos.
DELETE FROM post WHERE nombre_de_usuario='Carlos';
---------------------------------------------------------------------------------------------------------------------


-- Ingresar un nuevo post para el usuario "Carlos". 
INSERT INTO public.post(
	id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo)
	VALUES (6, 'Carlos', '15/11/2021', 'audio', 'Sonido de lluvia', 'lluvia');
---------------------------------------------------------------------------------------------------------------------


-- Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de creación y contenido, que se relacione con la tabla posts. 
CREATE TABLE public.comentarios
(
    id integer,
    fecha character varying(25),
    hora_de_creacion character varying(25),
    contenido character varying(25),
    CONSTRAINT id FOREIGN KEY (id)
        REFERENCES public.post (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
ALTER TABLE IF EXISTS public.comentarios
    OWNER to postgres;
---------------------------------------------------------------------------------------------------------------------


--Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos".
INSERT INTO public.comentarios(
	id, fecha, hora_de_creacion, contenido)
	VALUES (1, '30/11/2021', '15:30', 'Que lindooo');
	
INSERT INTO public.comentarios(
	id, fecha, hora_de_creacion, contenido)
	VALUES (2, '29/11/2021', '18:40', 'Me encanta!');
	
INSERT INTO public.comentarios(
	id, fecha, hora_de_creacion, contenido)
	VALUES (6, '15/11/2021', '12:30', 'Me relaja');
	
INSERT INTO public.comentarios(
	id, fecha, hora_de_creacion, contenido)
	VALUES (6, '15/11/2021', '13:20', 'Amo ese sonido');
	
INSERT INTO public.comentarios(
	id, fecha, hora_de_creacion, contenido)
	VALUES (6, '15/11/2021', '15:10', 'Quiero lluvia');
	
INSERT INTO public.comentarios(
	id, fecha, hora_de_creacion, contenido)
	VALUES (6, '15/11/2021', '18:50', 'Yo tambien la grabe hoy');
---------------------------------------------------------------------------------------------------------------------


-- Crear un nuevo post para "Margarita"
INSERT INTO public.post(
	id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo)
	VALUES (7, 'Margarita', '10/11/2021', 'foto', 'Estudiando con todo', 'estudio');
---------------------------------------------------------------------------------------------------------------------


-- Ingresar 5 comentarios para el post de Margarita.
INSERT INTO public.comentarios(
	id, fecha, hora_de_creacion, contenido)
	VALUES (7, '10/11/2021', '15:30', 'Animooo');
	
INSERT INTO public.comentarios(
	id, fecha, hora_de_creacion, contenido)
	VALUES (7, '10/11/2021', '16:00', 'Tu puedes');
	
INSERT INTO public.comentarios(
	id, fecha, hora_de_creacion, contenido)
	VALUES (7, '10/11/2021', '16:30', 'Que estudias?');
	
INSERT INTO public.comentarios(
	id, fecha, hora_de_creacion, contenido)
	VALUES (7, '10/11/2021', '18:30', 'Como te fuee');
	
INSERT INTO public.comentarios(
	id, fecha, hora_de_creacion, contenido)
	VALUES (7, '10/11/2021', '20:10', 'Mucho exitooo');
---------------------------------------------------------------------------------------------------------------------