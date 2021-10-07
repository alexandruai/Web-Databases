CREATE PROCEDURE [dbo].[DiferentaPretListaPretMinim]
(	
	@pretlista float,
	@pretmin float,
	@diferenta float output
	)
AS
	SELECT (pretlista - pretminim) as profit from produse;
	select @diferenta = (@pretlista - @pretmin) from produse;
RETURN 0