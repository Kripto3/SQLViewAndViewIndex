USE base_consorcio
-------------------------------------
-- CREAR VIEW ConsorcioDetalles_view
-------------------------------------
CREATE VIEW ConsorcioDetalles_view AS
(
	SELECT 
		AdministradorApeyNom = ADM.apeynom, 
		ConsorcioNombre		 = CON.nombre,
		Periodo				 = G.periodo,
		FechaPago			 = G.fechapago
	FROM  [dbo].[consorcio] CON
	INNER JOIN [dbo].[administrador] ADM
		ON CON.idadmin = ADM.idadmin
	INNER JOIN [dbo].[gasto] G
		ON CON.idconsorcio = G.idconsorcio
	INNER JOIN [dbo].[tipogasto] TG
		ON G.idtipogasto = TG.idtipogasto
)
GO
-------------------------------------
-- Ver los datos en la view
-------------------------------------
SELECT * FROM [dbo].[ConsorcioDetalles_view]

