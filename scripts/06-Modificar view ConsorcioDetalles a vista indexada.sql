USE [base_consorcio]
GO
-------------------------------------
-- CREAR VIEW ConsorcioDetalles_view
-------------------------------------
CREATE OR ALTER VIEW [dbo].[ConsorcioDetalles_view] 
WITH SCHEMABINDING
AS
(

	SELECT 
		IdGasto			= G.idgasto,
		Administrador	= ADM.apeynom, 
	    ConsorcioNombre = CON.nombre,
		Periodo			= G.periodo,
		fechapago		= G.fechapago,
		TipoGasto	    = TG.descripcion
	FROM [dbo].[gasto] G 
	INNER JOIN [dbo].[tipogasto] TG
		ON G.idtipogasto = TG.idtipogasto
	INNER JOIN  [dbo].[consorcio] CON
		ON G.idconsorcio = CON.idconsorcio
		AND G.idprovincia = CON.idprovincia
		AND G.idlocalidad = CON.idlocalidad
	INNER JOIN [dbo].[administrador] ADM
		ON CON.idadmin = ADM.idadmin
)
GO

SELECT * FROM [dbo].[ConsorcioDetalles_view] 



-- Crear el indice 
CREATE UNIQUE CLUSTERED INDEX [ix_idGasto] ON [dbo].[ConsorcioDetalles_view] 
(
	[IdGasto]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF)
