drop database if exists bd_libreria;
create database bd_libreria;
use bd_libreria;
create table autores(
Idautor int not null auto_increment,
Nombre varchar(12) not null,
Apellidos varchar(30) not null,
Nacionalidad varchar(15) not null,
primary key (Idautor)
);
create table libros(
ISBN varchar(25) not null,
Titulo varchar(20),
Numpaginas int not null,
Idcategoria int not null,
Ideditorial int not null,
primary key(ISBN)
);
create table formato (
ISBN varchar(25) not null,
tipoFormato varchar(30) not null,
primary key(ISBN)
);
create table escriben(
ISBN varchar(25) not null,
Idautor int not null,
primary key(ISBN,Idautor)
);
create table categoria(
Idcategoria int not null auto_increment,
Descripcion varchar(50) not null,
Nombre varchar(12) not null,
primary key (Idcategoria)
);
create table tipo (
Idcategoria int not null,
tipoCategoria varchar(40) not null,
primary key (Idcategoria)
);
create table editoriales(
Ideditorial int not null auto_increment,
Direccion varchar(50) not null,
Nombre varchar(12) not null,
Telefono int not null,
primary key (Ideditorial)
);
create table ejemplares(
Idejemplar int not null auto_increment,
Numejemplar int not null,
Estado boolean not null,
Localizacion varchar(30) not null,
primary key(Idejemplar)
);
create table tienen(
ISBN varchar(25) not null,
Idejemplar int not null,
primary key(ISBN,Idejemplar)
);
create table usuarios(
Idusuario int not null auto_increment,
Nombre varchar(12) not null,
Apellidos varchar(30) not null,
Telefono int not null,
primary key (Idusuario)
);
create table solicitan(
Idusuario int not null,
Idejemplar int not null,
primary key(Idejemplar,Idusuario)
);
create table bibliotecario(
Idbibliotecario int not null auto_increment,
Nombre varchar(12) not null,
Apellidos varchar(30) not null,
Telefono int not null,
primary key (Idbibliotecario)
);
create table registran(
Idusuario int not null,
Idbibliotecario int not null,
primary key(Idbibliotecario,Idusuario)
);
alter table registran
add constraint fk_usuarios foreign key(Idusuario) references usuarios(Idusuario),
add constraint fk_bibliotecario foreign key(Idbibliotecario) references bibliotecario(Idbibliotecario);
alter table solicitan
add constraint fk_ejemplares foreign key(Idejemplar) references ejemplares(Idejemplar),
add constraint fk_usuarios1 foreign key(Idusuario) references usuarios(Idusuario);
alter table tienen
add constraint fk_libros foreign key(ISBN) references libros(ISBN),
add constraint fk_ejemplares1 foreign key(Idejemplar) references ejemplares(Idejemplar);
alter table tipo
add constraint fk_categoria foreign key(Idcategoria) references categoria(Idcategoria);
alter table formato
add constraint fk_libros1 foreign key(ISBN) references libros(ISBN);
alter table escriben
add constraint fk_libros2 foreign key(ISBN) references libros(ISBN),
add constraint fk_autores foreign key(Idautor) references autores(Idautor);
alter table libros
add constraint fk_categoria1 foreign key(Idcategoria) references categoria(Idcategoria),
add constraint fk_editorial foreign key(Ideditorial) references editoriales(Ideditorial);
#DATOS AUTORES
INSERT INTO autores VALUES ('1', 'Amanda', 'Santana Santana', 'Española');
INSERT INTO autores VALUES ('2', 'Paco', 'Sanchez Mendez ', 'Española');
INSERT INTO autores VALUES ('3', 'Jenn', 'Patison Pat', 'Sueca');
INSERT INTO autores VALUES ('4', 'Marc', 'Praga Sanz', 'Francesa');
INSERT INTO autores VALUES ('5', 'Marta', 'Arad Becker', 'Turca');
#DATOS BIBLIOTECARIO
INSERT INTO bibliotecario VALUES ('1', 'Miguel', 'Montes Mu', '655111111');
INSERT INTO bibliotecario VALUES ('2', 'Carmen', 'Tortosa Rai', '622333333');
INSERT INTO bibliotecario VALUES ('3', 'Duncan', 'Diaz Zamora', '644332221');
INSERT INTO bibliotecario VALUES ('4', 'Mar', 'Benito Camo', '688513542');
INSERT INTO bibliotecario VALUES ('5', 'Susi', 'Chun Chan', '699313215');
#DATOS CATEGORIA
INSERT INTO categoria VALUES ('1', 'En busca de la pescadilla perdida', 'Comedia');
INSERT INTO categoria VALUES ('2', 'El bosque con complejo de humano', 'Ciencia ');
INSERT INTO categoria VALUES ('3', 'Trata de un unicornio que es timido', 'Drama');
INSERT INTO categoria VALUES ('4', 'Un perro que nunca ladro', 'Suspense');
INSERT INTO categoria VALUES ('5', 'Un hacker muy que roba a los ricos', 'Accion');
#DATOS EDITORIALES
INSERT INTO editoriales VALUES ('1', 'C Artenara 31', 'Planeta', '928111111');
INSERT INTO editoriales VALUES ('2', 'C Mesa y Lopez 42', 'Santillana', '928222222');
INSERT INTO editoriales VALUES ('3', 'C Anonima 12', 'Anaya', '928333333');
INSERT INTO editoriales VALUES ('4', 'C Tiburon 25', 'Granica', '928444444');
INSERT INTO editoriales VALUES ('5', 'C Bendimia 5', 'Oceano', '928555555');
#DATOS EJEMPLARES
INSERT INTO ejemplares VALUES ('1', '100', '1', 'Tiendas Las Palmas');
INSERT INTO ejemplares VALUES ('2', '200', '1', 'Tiendas Maspalomas');
INSERT INTO ejemplares VALUES ('3', '300', '1', 'Tiendas Vecindario');
INSERT INTO ejemplares VALUES ('4', '400', '0', 'Tiendas Las Palmas');
INSERT INTO ejemplares VALUES ('5', '500', '1', 'Tiendas Telde');
#DATOS LIBROS
INSERT INTO libros VALUES ('978-10-1111-1-1', 'La pescadilla ', '150', '1', '1');
INSERT INTO libros VALUES ('978-20-2222-2-2', 'El bosque habla', '200', '2', '2');
INSERT INTO libros VALUES ('978-30-3333-3-3', 'El escondite', '120', '3', '3');
INSERT INTO libros VALUES ('978-40-4444-4-4', 'El perro ', '140', '4', '4');
INSERT INTO libros VALUES ('978-50-5555-5-5', 'A la caza', '190', '5', '5');
#DATOS ESCRIBEN
INSERT INTO escriben VALUES ('978-10-1111-1-1', '1');
INSERT INTO escriben VALUES ('978-20-2222-2-2', '2');
INSERT INTO escriben VALUES ('978-30-3333-3-3', '3');
INSERT INTO escriben VALUES ('978-40-4444-4-4', '4');
INSERT INTO escriben VALUES ('978-50-5555-5-5', '5');
#DATOS FORMATO
INSERT INTO formato VALUES ('978-10-1111-1-1', 'Duro');
INSERT INTO formato VALUES ('978-20-2222-2-2', 'Blanco');
INSERT INTO formato VALUES ('978-30-3333-3-3', 'Blando');
INSERT INTO formato VALUES ('978-40-4444-4-4', 'Duro');
INSERT INTO formato VALUES ('978-50-5555-5-5', 'Semi');
#DATOS USUARIOS
INSERT INTO usuarios VALUES ('1', 'Raquel', 'Ramirez Martel', '671111111');
INSERT INTO usuarios VALUES ('2', 'Pepe', 'Benz Small', '672222222');
INSERT INTO usuarios VALUES ('3', 'Maria', 'Amad Prinz', '673333333');
INSERT INTO usuarios VALUES ('4', 'Susana', 'Bosh Vasani', '674444444');
INSERT INTO usuarios VALUES ('5', 'Carlos', 'Sanz Alegre', '675555555');
#DATOS REGISTRAN
INSERT INTO registran VALUES ('1', '1');
INSERT INTO registran VALUES ('2', '2');
INSERT INTO registran VALUES ('3', '3');
INSERT INTO registran VALUES ('4', '4');
INSERT INTO registran VALUES ('5', '5');
#DATOS SOLICITAN
INSERT INTO solicitan VALUES ('1', '1');
INSERT INTO solicitan VALUES ('2', '2');
INSERT INTO solicitan VALUES ('3', '3');
INSERT INTO solicitan VALUES ('4', '4');
INSERT INTO solicitan VALUES ('5', '5');
#DATOS TIENEN
INSERT INTO tienen VALUES ('978-10-1111-1-1', '1');
INSERT INTO tienen VALUES ('978-20-2222-2-2', '2');
INSERT INTO tienen VALUES ('978-30-3333-3-3', '3');
INSERT INTO tienen VALUES ('978-40-4444-4-4', '4');
INSERT INTO tienen VALUES ('978-50-5555-5-5', '5');
#DATOS TIPO
INSERT INTO tipo VALUES ('1', 'Risa');
INSERT INTO tipo VALUES ('2', 'Cualquiera');
INSERT INTO tipo VALUES ('3', 'Lloro');
INSERT INTO tipo VALUES ('4', 'Cualquiera');
INSERT INTO tipo VALUES ('5', 'Ladron');





