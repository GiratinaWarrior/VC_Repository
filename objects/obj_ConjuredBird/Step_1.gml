/// @description Insert description here
// You can write your code in this editor
if (Health <= 0) {
	
	with (instance_create_layer(x, y, layer, obj_ConjuredBirdDead))
	{ 
		image_alpha = 2;
		direction = other.HitFrom;
		xSpeed = 0;
		ySpeed = ySpeed = lengthdir_y(1, direction) - 2;;
	}
	
	instance_destroy();
}