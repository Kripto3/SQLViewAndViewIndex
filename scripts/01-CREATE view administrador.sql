-------------------------------------
-- CREAR VIEW administrador_view
-------------------------------------
CREATE VIEW administrador_view AS
(
	SELECT 
		apeynom, 
		sexo,
		fechnac
	FROM  [dbo].[administrador]
)
GO
-------------------------------------
-- Ver los datos en la view
-------------------------------------
SELECT * FROM administrador_view

