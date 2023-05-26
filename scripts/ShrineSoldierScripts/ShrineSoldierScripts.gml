// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ShrineSoldierState_Attack(){


	if (sprite_index != spr_ShrineSoldierAttack)
	{
		sprite_index = spr_ShrineSoldierAttack;
		image_index = 0;
		image_speed = 1;
		
		var _newHitbox = instance_create_depth(x, y, depth - 1, parent_EnemyMeleeHitbox);
		
		_newHitbox.sprite_index = sprite_index;
		
	}
	

}