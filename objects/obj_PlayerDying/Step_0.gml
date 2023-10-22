/// @description

if (!audio_is_playing(sound_PlayerDeath))
{
	audio_stop_all();
}

AnimationStopAtEnd();

if (image_index == image_number - 1 && image_speed == 0)
{
	
	TransitionStart(Room_GameOver, seq_FadeOut, seq_FadeIn);
	
	obj_Camera.follow = noone;

}

layer_sprite_x(PlayerDeathFade, obj_Camera.x);
layer_sprite_y(PlayerDeathFade, obj_Camera.y);

y += ySpeed;