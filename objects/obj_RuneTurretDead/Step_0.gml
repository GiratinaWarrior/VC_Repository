/// @description Insert description here
// You can write your code in this editor
if (Done == 0){

	ySpeed = ySpeed + Gravity;


	//if the object is touching a platform
	if (place_meeting(x, y + ySpeed, obj_Wall)){
	
		Damage = 0;
	
		if (ySpeed > 0) {
			Done = 1;
		}
		sprite_index = spr_RuneTurretFallenCorpse
	
		while(!place_meeting(x, y + sign(ySpeed), obj_Wall))
		{
			y = y + sign(ySpeed);
		}
	
		ySpeed = 0;
	}
	
	
	y = y + ySpeed;


	if (place_meeting(x + xSpeed, y, obj_Wall)){
			
		while(!place_meeting(x + sign(xSpeed), y, obj_Wall))
		{
			x = x + sign(xSpeed);
		}
	
		xSpeed = 0;
	}
	
	x = x + xSpeed;

}