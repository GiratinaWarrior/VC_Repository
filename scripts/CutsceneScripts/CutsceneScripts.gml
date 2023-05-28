// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CutsceneText(_text = [""]){
	
	with(instance_create_depth(x, y, -99, obj_Text))
	{
		TextBox_Text = _text;
	}
	
}