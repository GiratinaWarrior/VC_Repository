/// This function manages the Shrine Soldier's state while their attacking the player
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
	
}//end ShrineSoldierState_Attack()
	
/// This function manages the Shrine Soldier's state after being defeated
function ShrineSoldierState_Defeat(){
	
	xSpeed = 0;
	
	//If the Shrine Soldier hasnt changed their sprite to the defeated one, do so
	if (sprite_index != spr_ShrineSoldierDefeated)
	{
		image_speed = 1;
		sprite_index = spr_ShrineSoldierDefeated;
	}//end sprite change not happened
	
	//If the Shrine Soldier has changed their sprite
	else
	{
		//if the Shrine Soldier Defeated animation has ended, stay at the last sprite
		if (animation_end())
		{
			image_index = image_number - 1;
			image_speed = 0;
			with (instance_create_depth(x, y, depth, obj_NPC))
			{
				sprite_index = other.sprite_index;
				image_index = other.image_index;
				image_speed = other.image_speed;
				TextBox_Text = other.TextBox_Text;
			}
			instance_destroy();
		}//end Shrine Soldier Defeated animation ended
		
	}//end sprite change happened
	
}//end ShrineSoldierState_Defeat