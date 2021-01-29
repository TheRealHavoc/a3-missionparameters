/*
	https://community.bistudio.com/wiki/Arma_3:_Mission_Parameters#Config

	MUST READ BEFORE CHANGING: values[] must have the same number of elements as texts[].
*/

class Params
{
	class StartingPosition
	{
		title = "Starting position";
		texts[] = { 
			"Factory",
			"Nidek",
			"Military Base",
			"Livonia Airport"
		};
		values[] = {0,1,2,3};
		default = 0;
	}
}