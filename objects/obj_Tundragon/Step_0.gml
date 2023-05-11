/// @description Movement and Ice Spikes

IceSpikeCooldown -= 1;

//Generate the orbiting spikes
if (numOfIceSpikes < maxIceSpikes)
{
	with(instance_create_layer(x, y, "Tundragon", obj_IceSpikeOrbit))
	{
		//Set the ice spikes to orbit 60 pixels away from a Tundragon
		IceSpikeOrbitDist = 60;
		
		//Set the angle the Ice Spike is spawned at
		IceSpikeAngle = ((2 * pi)/other.maxIceSpikes) * other.numOfIceSpikes;
		
		//The Speed it rotates at
		IceSpikeRotate = pi / (power(2, 7));
		sprite_index = IceSpikeSprite[other.numOfIceSpikes % 3]; 
		IceSpikeOrigin = other.id;
	}
	numOfIceSpikes++;
}