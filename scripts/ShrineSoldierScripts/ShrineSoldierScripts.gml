// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ShrineSoldierState_Attack(){
	
	if (sprite_index != spr_ShrineSoldierAttack)
	{
		image_speed = 1;
		image_index = 0;
		image_xscale = sign(obj_Player.x - x);
		sprite_index = spr_ShrineSoldierAttack;
		xSpeed = 0;
		
		ShrineSoldierAttackHitbox = instance_create_depth(x, y, depth + 1, parent_EnemyMeleeHitbox);
		
	}
	
	with(ShrineSoldierAttackHitbox)
	{
		sprite_index = spr_ShrineSoldierAttackHitbox;
		image_index = other.image_index;
		image_xscale = other.image_xscale;
		image_blend = c_black;
	}
	
	if (SoldierState == SHRINESOLDIER_STATE.HURT || Attacked)
	{
		//show_debug_message("Detected Attack")
		instance_destroy(ShrineSoldierAttackHitbox);
	}
	else
	{
		//show_debug_message("No Attack")
	}
	
	if (animation_end(spr_ShrineSoldierAttack))
	{
		image_speed = -1;
	}
	
	if (image_speed == -1 && image_index < 1)
	{
		SoldierState = SHRINESOLDIER_STATE.WALK;
		xSpeed = SoldierSpeed * image_xscale;
	}
	
}