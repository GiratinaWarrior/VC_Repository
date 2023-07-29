/// @description Insert description here
// You can write your code in this editor

TextBox_UIPosition = TEXTBOX_POS.TOP;

var _func = function()
{
	//If the Carvaline Orb Cutscene hasn't been seen
	if !global.CarvalineOrb_Cutscene_Seen
		&& !instance_exists(obj_CarvalineOrbIntroCutscene)
		&& abs(x - obj_Player.x) < 100
		&& global.Key_Talk
	{
		instance_create_layer(1440, 270, layer_get_id("ShrinePedestal"), obj_CarvalineOrbIntroCutscene);
		obj_Player.hascontrol = false;	
	}
	
}

EntityTextBox(_func);