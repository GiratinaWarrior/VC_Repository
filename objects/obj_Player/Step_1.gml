//@description When the player dies

if (global.Health <= 0)
{		
	//instance_change(obj_PlayerDying, true);
	//instance_create_layer(x, y, layer_get_id("PlayerDeath"), obj_PlayerDying);
	instance_create_depth(x, y, depth - 1, obj_PlayerDying);
	instance_destroy();
}//end if player should be dead