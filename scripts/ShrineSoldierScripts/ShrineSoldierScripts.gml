/// This function manages the Shrine Soldier's state while their attacking the player
function ShrineSoldierState_Attack(){
	
	//If SS hasnt started attacking, attack
	if (sprite_index != spr_ShrineSoldierAttack)
	{
		//Change the sprite
		image_speed = 1;
		image_index = 0;
		image_xscale = sign(obj_Player.x - x);
		sprite_index = spr_ShrineSoldierAttack;
		//Stop moving
		xSpeed = 0;
		
		//Create a hitbox
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
	
	Damage = 0;
	
	var _text = TextBox_Text;
	
	var _createOne = false;
	
	//show_debug_message("Shrine Soldier Image Index: {0}", image_index);
	
	//If the Shrine Soldier hasnt changed their sprite to the defeated one, do so
	if (sprite_index != spr_ShrineSoldierDefeated)
	{
		image_index = 0;
		image_xscale = sign(obj_Player.x - x);
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
			
			//If an NPC hasnt been made
			if (!_createOne)
			{
			
				//Turn into an NPC
				with (instance_create_layer(x, y, layer, obj_NPC))
				{
					sprite_index = spr_ShrineSoldierDefeated;
					image_xscale = other.image_xscale;
					image_index = image_number - 1;
					image_speed = 0;
					Speech = _text;
					TextBox_UIPosition = TEXTBOX_POS.TOP;
					Name = other.Name;
					Entity_Marker.Marker_OffsetX = image_xscale * -10;
					TalkRange = 100;
					/*
					with(instance_create_layer((image_xscale * 5), y - sprite_yoffset, layer, obj_RightClickMarker))
					{
						show_debug_message("Marker Coordinate = ({0}, {1})", x, y);
						Creator = other;
						TalkRange = other.TalkRange;
					}
					*/
				}
				
				_createOne = true;
				
			}
			
			instance_destroy();
			
			
		}//end Shrine Soldier Defeated animation ended
		
		else
		{
			image_speed = 1;
		}
		
	}//end sprite change happened

	
	
	
}//end ShrineSoldierState_Defeat