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