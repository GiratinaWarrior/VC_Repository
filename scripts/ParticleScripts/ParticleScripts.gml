// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateParticleSystem(_ps, _layer, _x, _y, _persist){

	var _NewPart = part_system_create_layer(_layer, _persist, _ps);
	part_system_position(_NewPart, _x, _y);
	
	return _NewPart;

}