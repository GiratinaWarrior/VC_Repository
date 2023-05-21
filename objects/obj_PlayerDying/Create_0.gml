/// @description Creation
xSpeed = 0;
ySpeed = 0;
Gravity = 0.3;
Done = 0;

image_index = 0;
image_speed = 1;
image_alpha = 1;

//audio_play_sound(sound_Death, 10, false);

with (obj_Camera) follow = other.id;

var _gameover = function()
{
	SlideTransition(TRANS_MODE.GOTO, Room_GameOver);
	with (obj_PlayerHealth)
	{
		global.Health = MaxHealth;
	}
}

TransToGameOver = time_source_create(time_source_game, 60, time_source_units_frames, _gameover)