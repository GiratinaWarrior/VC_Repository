/// @description Insert description here
// You can write your code in this editor

var _func = function()
{
	//If the Carvaline Orb Cutscene hasn't been seen
	if (!global.CarvalineOrb_Cutscene_Seen && !instance_exists(obj_CarvalineOrbIntroCutscene))
	{
		instance_create_layer(1440, 270, -99999, obj_CarvalineOrbIntroCutscene);
	}
	
	//If the Carvaline Orb Cutscene has been scene
	else
	{
		
	}
}

EntityTextBox(_func);