/// @description Rotation and Stuff

//Check if the player and the Tundragon exists
if (instance_exists(obj_Player)) && (instance_exists(IceSpikeOrigin))
{
	//If the Player and the Tundragon are in attack range
	if (point_distance(obj_Player.x, obj_Player.y, IceSpikeOrigin.x, IceSpikeOrigin.y) <= IceSpikeRange) && (!collision_line(obj_Player.x, obj_Player.y, IceSpikeOrigin.x, IceSpikeOrigin.y, obj_WallPlatform, false, false))
	{
		PlayerInProximity = true;
	}
	
	//If they're not
	else
	{
		PlayerInProximity = false;
	}
		
}

//If one of them doesn't exist
else 
{
	PlayerInProximity = false;
}

//If in range, launch the ice spike
if (PlayerInProximity)
{
	//Access the Tundragon
	with(IceSpikeOrigin)
	{
		//If the cooldown is over
		if (IceSpikeCooldown < 0)
		{
			//Launch a spike
			other.IceSpikeLaunched = true;
			
			//Reset the cooldown
			IceSpikeCooldown = IceSpikeCooldownMax;
			
			numOfIceSpikes--;
			
		}//end if cooldown over
		
	}//end access Tundragon
	
}//end in range

//If Tundragon is alive, then the spikes will orbit it
if (instance_exists(IceSpikeOrigin))
{
	IceSpikeAngle += IceSpikeRotate;
	x = IceSpikeOrigin.x + (IceSpikeOrbitDist * cos(IceSpikeAngle));
	y = IceSpikeOrigin.y + (IceSpikeOrbitDist * sin(IceSpikeAngle));
	
}//end orbit Tundragon

else
{
	instance_destroy();
}

//If the spike has been launched
if (IceSpikeLaunched)
{
	with(instance_create_layer(x, y, layer, obj_IceSpikeAttack))
	{
		sprite_index = other.sprite_index;
		direction = point_direction(other.x, other.y, obj_Player.x, obj_Player.y);
		speed = 10;
		instance_destroy(other);
	}
}






