USE [base_consorcio];
-------------------------------------
-- CREAR VIEW administrador_view
-------------------------------------
ALTER VIEW [dbo].[administrador_view] AS
(
	SELECT 
		apeynom, 
		sexo,
		fechnac,
		tel --ESTE ES EL NUEVO CAMPO
	FROM  [dbo].[administrador]
)
GO
------------------------------------
-- Ver los cambios en la view
------------------------------------
SELECT * FROM administrador_view


