/// @description In Death
if (Health <= 0) {
	
	with (instance_create_layer(x, y, layer, obj_MaskMantisDead))
	{ 
		direction = other.HitFrom;
		xSpeed = lengthdir_x(3, direction);
		ySpeed = lengthdir_y(3, direction) - 2;
		if (sign(xSpeed) != 0){
			image_xscale = sign(xSpeed);
		}
	}
	
	instance_destroy();
}