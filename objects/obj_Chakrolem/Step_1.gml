/// @description Insert description here
// You can write your code in this editor

if (Health <= 0)
{
	var _dead = instance_create_layer(x, y, layer, parent_EnemyDead);
	_dead.sprite_index = spr_Chakrolem_Death;
	instance_destroy();
}




