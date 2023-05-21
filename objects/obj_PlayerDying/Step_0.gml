/// @description

if (Done == 0) {
	//sprite_index = spr_PlayerDying;
	if (animation_end()) {
		image_speed = 0;
		Done = 1;
		if (!alarm[0])
		{
			alarm[0] = 60;
		}
	} 

} 

Wall_StopRun();
Wall_FallOn();

y += ySpeed;