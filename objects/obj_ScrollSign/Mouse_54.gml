/// @description Insert description here
// You can write your code in this editor

//If the player is within 64 pixels of the Scroll Sign and there is not text
if (point_in_circle(obj_NewPlayer.x, obj_NewPlayer.y, x, y, 64)) && (!instance_exists(TextObject))
{
	with (instance_create_layer(x, y - 64, layer, TextObject)) 
	{
		text = other.text;
		length = string_length(text);
	}
	
	with (obj_Camera)
	{
		follow = other.id;
	}
	
}