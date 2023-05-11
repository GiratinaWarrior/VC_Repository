/// @description When die
if (Health <= 0) {
	
	with (instance_create_layer(x, y, layer, obj_BlueBirdDead))
	{ 
		direction = other.HitFrom;
		xSpeed = 0;
		ySpeed = ySpeed = lengthdir_y(1, direction) - 2;;
	}
	
	instance_destroy();
}