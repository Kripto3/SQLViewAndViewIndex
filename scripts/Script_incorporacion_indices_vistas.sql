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



-- Crear el indice, en este caso el indice es de tipo agrupado, ya que ordena los datos en base a la clave que toma el indice

CREATE UNIQUE CLUSTERED INDEX [ix_idGasto] ON [dbo].[ConsorcioDetalles_view] 
(
	[IdGasto]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF);


--Crear indice no agrupado, o monton; cada fila contiene un valor de clave no agrupada y un localizador de fila, este localizador apunta a la fila de datos del indice cluster o el monton que contiene el valor de clave

CREATE NONCLUSTERED INDEX [IX_NonClustered] ON [dbo].[ConsorcioDetalles_view] ([IdGasto]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF);

--Crear indice Unico, se usa para que la clave de indice no contenga valores duplicados y para que cada fila o vista sea unica, y aplica tanto para indices cluster como los no cluster

CREATE UNIQUE INDEX [IX_Unique] ON [dbo].[ConsorcioDetalles_view] ([IdGasto]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF);

--Crear indice filtrado, es uno que no se encuentra optimizado, se usa para realizar consultas en un conjunto reducido de datos y se usa junto con una clausula WHERE en su definicion para filtrar que filas de la tabla deben incluirse en el indice, dependiendo del diseño del indice tambien vendra el rendimiento de las consultas y la reduccion de almacenamiento

CREATE NONCLUSTERED INDEX [IX_Filtered] ON [dbo].[ConsorcioDetalle_view] ([IdGasto]) WHERE [IdGasto] > 15;