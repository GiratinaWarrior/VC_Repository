// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GuardarkState_Shoot(){

	image_speed = 1;
	
	sprite_index = spr_Guardark_Shoot;

	xSpeed = 0;
	
	if (instance_exists(obj_Player))
	{
		Guardark_Dir = sign(obj_Player.x - x);
	}
	
	if (Guardark_Shoot_Timer++ > Guardark_Shoot_Rate)
	{
		audio_play_sound(sound_GuardarkAttack, 50, false, 0.5);
		with (instance_create_depth(x + (Guardark_Dir * 32), y + (random_range(-10, 20)), depth - 1, obj_GuardarkBullet))
		{
			xSpeed = GuardarkBullet_HorizontalSpeed * other.Guardark_Dir;
		}
		
		Guardark_Shoot_Timer = 0;
	}
	
	if (!PlayerInRange)
	{
		Guardark_State = GUARDARK_STATE.PATROL;
		xSpeed = Guardark_Dir * Guardark_Speed;
		Guardark_Shoot_Timer = 0;
	}


}

