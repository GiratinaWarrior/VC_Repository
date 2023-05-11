/// @description Death

//If Rune Turret dies
if (Health <= 0) {
	
	with (instance_create_layer(x, y, layer, obj_RuneTurretDead))
	{ 
		if (sign(xSpeed) != 0){
			image_xscale = sign(xSpeed);
		}
	}
	
	instance_destroy();

}