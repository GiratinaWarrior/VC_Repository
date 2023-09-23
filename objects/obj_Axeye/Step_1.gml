/// @description

if (Health <= 0)
{
	audio_stop_sound(sound_AxeyeCharge);
	instance_create_depth(x, y, depth - 1, obj_Axeye_Dead);
	instance_destroy();
}




