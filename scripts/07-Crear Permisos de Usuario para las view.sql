
--Usuario administrador
--Ejecutar solo para la creacion a nivel de servidor.
USE master;
CREATE LOGIN UsuarioAdmin WITH PASSWORD = 'admin123';
--Usuario de Solo Lectura
CREATE LOGIN UsuarioObservador WITH PASSWORD = 'observador123';

-- Se asigna el permiso de Admin para UsuarioAdmin
USE [base_consorcio];
CREATE USER UsuarioAdmin FOR LOGIN UsuarioAdmin;
ALTER ROLE db_owner ADD MEMBER UsuarioAdmin

-- Con la palabra 'GRANT' asignamos el permiso SELECT sobre la view [administrador_view]
CREATE USER UsuarioObservador FOR LOGIN UsuarioObservador;
GRANT SELECT ON [dbo].[administrador_view] TO UsuarioObservador;

--Consulta SELECT con el usuario administrador
EXECUTE AS LOGIN = 'UsuarioAdmin'
SELECT * FROM [dbo].[administrador_view]
REVERT --REVERT en SQL Server se utiliza para volver al contexto original

--Consulta SELECT con el usuario observador
EXECUTE AS LOGIN = 'UsuarioObservador'
SELECT * FROM [dbo].[administrador_view]
REVERT

--Al intentar realizar un UPDATE con el 'UsuarioObservador' es rechazado.
USE [base_consorcio];
EXECUTE AS LOGIN = 'UsuarioObservador';
UPDATE [dbo].[administrador_view]
   SET [sexo] = 'F'
 WHERE apeynom LIKE 'ESPINOZA JULIO'
GO
SELECT * FROM [dbo].[administrador_view] 
REVERT;