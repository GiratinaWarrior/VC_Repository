/// @description Play the dying animation

if (Done == 0) {
	//sprite_index = spr_PlayerDying;
	if (animation_end()) {
		image_speed = 0;
		Done = 1;
		alarm[0] = 60;
	} 

} 

Wall_StopRun();
Wall_FallOn();

y += ySpeed;

ySpeed += Gravity;