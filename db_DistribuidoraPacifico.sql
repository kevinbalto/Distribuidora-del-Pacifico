use [master]
go 

-- creación de base de datos
if(exists(select name from dbo.sysdatabases where name = 'DistribuidoraPacifico' ))
drop database [DistribuidoraPacifico] 
go

create database DistribuidoraPacifico
go

use DistribuidoraPacifico
go

-- creación de tabla usuario
if (exists(select name from dbo.sysobjects where name = 'TblUsuarios'))
drop table [TblUsuarios] 
go

create table TblUsuarios (
cedula varchar(50) not null, tipoIdentificacion varchar(50) not null,
nombreCompleto varchar(50) not null, direccion varchar(50) not null,
email varchar(50) not null, contrasenna varchar(50) not null, 
telefono varchar(50) not null,
idRol varchar(50) not null);

alter table TblUsuarios add
constraint Pk_Usuario primary key(cedula)
go

-- creación de tabla rol
if (exists(select name from dbo.sysobjects where name = 'TblRoles'))
drop table [TblRoles] 
go

create table TblRoles (
idRol varchar(50) not null,
nombreRol varchar(50) not null);

alter table TblRoles add
constraint Pk_Rol primary key(idRol)
go

-- creacion de tabla de productos
if(exists(select name from dbo.sysobjects where name ='TblProducto'))
drop table [TblProducto] --borrado de tablas
go

create table TblProducto(
codBarras varchar(50) not null,
clasificacion varchar(50)  not null,
descripcion varchar(50) not null,
precioCompra decimal(12,2) not null,
porcentajeIV decimal(12,2) not null,
porcentajeIVA decimal(12,2) not null,
exento bit not null,
unidadMedida varchar(50) not null,
estado bit not null,
foto varchar(100) not null,
precioImpuestoIncluido decimal(12,2) not null,
cantidad int not null);

alter table TblProducto add
constraint Pk_Producto primary key(codBarras)
go

-- creacion de tabla proveedores
if(exists(select name from dbo.sysobjects where name ='TblProveedores'))
drop table [TblProveedores] --borrado de tablas
go

create table TblProveedores(
cedLegal varchar(50)  not null,
nombreComercial varchar(50) not null,
telefono varchar(50) not null,
direccionExacta varchar(50) not null,
contacto varchar(50) not null,
email varchar(50) not null);

alter table TblProveedores add
constraint Pk_Proveedor primary key(cedLegal)
go

-- creacion de tabla productos-proveedores
if(exists(select name from dbo.sysobjects where name ='TblProductosProveedor'))
drop table [TblProductosProveedor] --borrado de tablas
go

create table TblProductosProveedor(
codBarras varchar(50)  not null,
cedLegal varchar(50) not null);

--Llave compuesta
alter table TblProductosProveedor add
constraint Pk_ProductosProveedor primary key (codBarras,cedLegal);

--tbl factura
if(exists(select name from dbo.sysobjects where name ='TblFactura'))
drop table [TblFactura] --borrado de tablas
go

create table [TblFactura](
codigoFactura int identity(1,1) not null,
cedulaCliente varchar(50)not null,
TotalPagar decimal not null,
formaPago varchar(50) not null,
informacionPago decimal, 
descuento decimal not null
);

alter table TblFactura add
constraint PK_Factura primary key(codigoFactura)
go

--tbl Detalle factura
if(exists(select name from dbo.sysobjects where name ='TblDetalleFactura'))
drop table [TblDetalleFactura] --borrado de tablas
go

create table [TblDetalleFactura](
codigoDetalle int identity(1,1)  not null,
codigoFactura int not null,
codigoProducto varchar(50) not null,
cantidad int,
precio decimal not null,
subTotal decimal not null);

alter table TblDetalleFactura add
constraint PK_DetalleFactura primary key(codigoDetalle)
go

--tblContacto
if(exists(select name from dbo.sysobjects where name ='TblContactos'))
drop table [TblContactos] --borrado de tablas
go

create table [TblContactos](
cedula varchar(50) not null,
nombreCompleto varchar(50) not null,
Email varchar(50) not null,
Asunto varchar(300) not null
);

alter table TblContactos add
constraint PK_Contacto primary key(cedula)
go

-- creacion de llaves foraneas
alter table TblDetalleFactura add foreign key(codigoProducto) references TblProducto(codBarras);
alter table TblFactura add foreign key(cedulaCliente)references TblUsuarios(cedula);
alter table TblDetalleFactura add foreign key(codigoFactura) references TblFactura(codigoFactura);
alter table TblProductosProveedor add foreign key(codBarras) references TblProducto(codBarras);
alter table TblProductosProveedor add foreign key(cedLegal) references TblProveedores(cedLegal);
alter table TblUsuarios add foreign key (idRol) references TblRoles(idRol);

insert into TblRoles values (1, 'Administrador');
insert into TblRoles values (2, 'Clientes');
insert into TblRoles values (3, 'Soporte');

insert into TblUsuarios values('6450783','Nacional','Nikoole Rodríguez',
'Cocal, Puntarenas','nikoole1998.24@gmail.com','vTLK6RlzAL0=','86635666',1);
go






