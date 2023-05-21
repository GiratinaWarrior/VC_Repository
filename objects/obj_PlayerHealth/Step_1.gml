/// @description When the Player dies
if (global.Health <= 0)
{
	//Access the player
	with (obj_Player){
		//instance_change(obj_PlayerDying, true);
		
		//Make the dead player objects sprite correspond to the spriteset		
		with(instance_create_layer(x, y, layer, obj_PlayerDying))
		{
			image_index = 0;
			sprite_index = other.PlayerSpriteSet[PLAYERSTATE_SPRITE.DEAD];
		}
		
		//Destroy the regular player object
		instance_destroy();
		
	}//end with Player
	
}//end if player should be dead